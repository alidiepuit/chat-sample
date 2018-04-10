<?php

/**
* A PHP session handler to keep session data within a MySQL database
*
* @author 	Manuel Reinhard <manu@sprain.ch>
* @link		https://github.com/sprain/PHP-MySQL-Session-Handler
*/

class MySqlSessionHandler{

    /**
     * a database MySQLi connection resource
     * @var resource
     */
    protected $dbConnection;
    
    /**
     * the name of the DB table which handles the sessions
     * @var string
     */
    protected $dbTable;

    /**
     * Set db data if no connection is being injected
     * @param 	string	$dbHost
     * @param	string	$dbUser
     * @param	string	$dbPassword
     * @param	string	$dbDatabase
     */
    public function setDbDetails($dbHost, $dbUser, $dbPassword, $dbDatabase)
    {
        $this->dbConnection = new mysqli($dbHost, $dbUser, $dbPassword, $dbDatabase);

        if (mysqli_connect_error()) {
            throw new Exception('Connect Error (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
        }
    }

    /**
     * Inject DB connection from outside
     * @param 	object	$dbConnection	expects MySQLi object
     */
    public function setDbConnection($dbConnection)
    {
        $this->dbConnection = $dbConnection;
    }

    /**
     * Inject DB connection from outside
     * @param 	object	$dbConnection	expects MySQLi object
     */
    public function setDbTable($dbTable)
    {
        $this->dbTable = $dbTable;
    }

    /**
     * Open the session
     * @return bool
     */
    public function open()
    {
        //delete old session handlers
        $limit = time() - (3600 * 24);
        $sql = sprintf("DELETE FROM %s WHERE expires < %s", $this->dbTable, $limit);
        return $this->dbConnection->query($sql);
    }

    /**
     * Close the session
     * @return bool
     */
    public function close()
    {
        return $this->dbConnection->close();
    }

    /**
     * Read the session
     * @param int session id
     * @return string string of the sessoin
     */
    public function read($id)
    {
        $sql = sprintf("SELECT data FROM %s WHERE sessionId = '%s'", $this->dbTable, $this->dbConnection->escape_string($id));
        if ($result = $this->dbConnection->query($sql)) {
            if ($result->num_rows && $result->num_rows > 0) {
                $record = $result->fetch_assoc();
                $arr = json_decode($record['data'], true);
                return $this->serializeSession($arr);
            } else {
                return false;
            }
        } else {
            return false;
        }

        return true;
    }

    /**
     * Write the session
     * @param int session id
     * @param string data of the session
     */
    public function write($id, $data)
    {
        $unserializeData = $this->unserializeSession($data);
        $sql = sprintf("REPLACE INTO %s VALUES('%s', '%s', '%s')",
                       $this->dbTable,
                       $this->dbConnection->escape_string($id),
                       time() + 3600,
                       json_encode($unserializeData));

        return $this->dbConnection->query($sql);
    }

    /**
     * @see http://php.net/manual/en/function.session-decode.php#108037
     * @param array $session_data
     * @throws Exception
     * @return multitype:mixed
     */
    private function unserializeSession($session_data)
    {
        $return_data = array();
        $offset = 0;
        while ($offset < strlen($session_data)) {
            if (!strstr(substr($session_data, $offset), "|")) {
                throw new Exception("invalid data, remaining: " . substr($session_data, $offset));
            }
            $pos = strpos($session_data, "|", $offset);
            $num = $pos - $offset;
            $varname = substr($session_data, $offset, $num);
            $offset += $num + 1;
            $data = unserialize(substr($session_data, $offset));
            $return_data[$varname] = $data;
            $offset += strlen(serialize($data));
        }
        return $return_data;
    }

    /**
     * @see http://php.net/manual/en/function.session-encode.php#76425
     * @param array $array
     * @return string
     */
    private function serializeSession(array $array)
    {
        $raw = '';
        $line = 0;
        $keys = array_keys($array);
        foreach ($keys as $key) {
            $value = $array[$key];
            $line++;
            $raw .= $key . '|';
            if (is_array($value) && isset($value['huge_recursion_blocker_we_hope'])) {
                $raw .= 'R:' . $value['huge_recursion_blocker_we_hope'] . ';';
            } else {
                $raw .= serialize($value);
            }
            $array[$key] = Array('huge_recursion_blocker_we_hope' => $line);
        }
        return $raw;
    }

    /**
     * Destoroy the session
     * @param int session id
     * @return bool
     */
    public function destroy($id)
    {
        $sql = sprintf("DELETE FROM %s WHERE `sessionId` = '%s'", $this->dbTable, $this->dbConnection->escape_string($id));
        return $this->dbConnection->query($sql);
    }

    /**
     * Garbage Collector
     * @param int life time (sec.)
     * @return bool
     * @see session.gc_divisor      100
     * @see session.gc_maxlifetime 1440
     * @see session.gc_probability    1
     * @usage execution rate 1/100
     *        (session.gc_probability/session.gc_divisor)
     */
    public function gc($max)
    {
        $sql = sprintf("DELETE FROM %s WHERE `expires` < '%s'", $this->dbTable, time() - intval($max));
        return $this->dbConnection->query($sql);
    }
}
