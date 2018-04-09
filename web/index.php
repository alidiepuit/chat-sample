<?php
require_once "lib/application.php";
require_once "lib/AuthManager.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  AuthManager::getInstance()->login($_POST['username'], $_POST['password']);
}

$user = AuthManager::getInstance()->getIdentity();
if (empty($user)) {?>

<form method="post" action="index.php">
  <input type="text" name="username"/>
  <input type="password" name="password"/>
  <input type="submit" value="Login">
</form>

<?php } else {
  include 'chatbox.php';
}
?>