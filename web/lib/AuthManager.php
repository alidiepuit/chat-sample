<?php
class AuthManager {
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

  private static $instance;

  public static function getInstance() {

      if (!isset(self::$instance)) {
          self::$instance = new AuthManager();
      }

      return self::$instance;
  }

  function __construct() {
    $this->dbConnection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    $this->dbTable = 'users';
    if (mysqli_connect_error()) {
        throw new Exception('Connect Error (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
    }
  }

  public function getIdentity() {
    return $_SESSION['authen'];
  }

  public function login($user, $pass) {
    $sql = sprintf("SELECT * FROM %s WHERE username LIKE '%s' AND password LIKE '%s'", $this->dbTable, $this->dbConnection->escape_string($user), $this->dbConnection->escape_string(md5($pass)));
    // var_dump($sql);die;
    if ($result = $this->dbConnection->query($sql)) {
      if ($result->num_rows && $result->num_rows > 0) {
        $record = $result->fetch_assoc();
        $_SESSION['authen'] = $record;
        return $record;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  public function logout() {
    session_destroy();
  }
}