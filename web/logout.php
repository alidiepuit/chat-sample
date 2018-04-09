<?php
require_once "lib/application.php";
require_once "lib/AuthManager.php";

AuthManager::getInstance()->logout();

header('Location: ' . BASE_URL . 'index.php');