<?php
require_once('config.php');
require_once('MySqlSessionHandler.php');

$session = new MySqlSessionHandler();

// add db data
$session->setDbDetails(DB_HOST, DB_USER, DB_PASS, DB_NAME);

// OR alternatively send a MySQLi ressource
// $session->setDbConnection($mysqli);

$session->setDbTable('session');
session_set_save_handler(array($session, 'open'),
                         array($session, 'close'),
                         array($session, 'read'),
                         array($session, 'write'),
                         array($session, 'destroy'),
                         array($session, 'gc'));

// The following prevents unexpected effects when using objects as save handlers.
register_shutdown_function('session_write_close');

session_start();

