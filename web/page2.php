<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Page 2</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/static/css/bootstrap.min.css" rel="stylesheet">
<link href="/static/css/dashboard-message.css" rel="stylesheet">
<style>

</style>
</head>
<body>
<?php
require_once "lib/application.php";
require_once "lib/AuthManager.php";

$user = AuthManager::getInstance()->getIdentity();

if ($user) {
?>

<div class="container app">
  <div class="row app-one" id="group<?=$_GET['id']?>">
    
    <div class="col-sm-3 side" id="">
      Empty
    </div>
    <div class="col-sm-6 conversation">
      <div class="row heading">
        
        <div class="col-sm-8 col-xs-7 heading-name">
          <span>Category <?php echo $_GET["id"];?></span>
        </div>
        
      </div>

      <div class="row message msg_container_base" id="conversation">
        <div class="row message-previous load_more_message" data-target="group<?=$_GET['id']?>" data-group="<?=$_GET['id']?>">
          <div class="col-sm-12 previous">
            <a onclick="" name="20">
            Show Previous Message!
            </a>
          </div>
        </div>

      </div>

      <div class="row reply">
        <div class="col-sm-1 col-xs-1 reply-emojis">
          <i class="fa fa-smile-o fa-2x"></i>
        </div>
        <div class="col-sm-9 col-xs-9 reply-main">
          <input type="text" class="inputMessage" id="input_group<?=$_GET['id']?>" data-target="group<?=$_GET['id']?>" data-group="<?=$_GET['id']?>"/>
        </div>
        <div class="col-sm-1 col-xs-1 reply-send btn-chat" data-target="group<?=$_GET['id']?>" data-group="<?=$_GET['id']?>">
          <i class="fa fa-send fa-2x" aria-hidden="true"></i>
        </div>
      </div>
    </div><!-- message -->

    <div class="col-sm-3 side" id="chat-box">
      <div class="side-one">
        <div class="row heading">
          
          
        </div>

        <div class="row sideBar">
          

        </div>
      </div>

    </div><!-- list user -->

  </div>
</div>

<script type="text/javascript">
  var userId = "<?= $user['id']?>";
  var username = "chatbox_<?= $user['id']?>";
  var displayName = "<?= $user['first_name']?>";
  var adsId = adsId || 0;
  var adsTitle = adsTitle || '';
  var listBlocked = {};
  var sessId = '<?= $_COOKIE['PHPSESSID']?>';
  var groupId = '<?php echo $_GET["id"];?>';
  var listUsers = {};
</script>
<script src="/static/js/jquery.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/moment.min.js"></script>
<script src="/static/js/jquery.timeago.js"></script>
<script src="http://local.chat-sample.com:3000/socket.io/socket.io.js"></script>
<script src="http://local.chat-sample.com:3000/dashboard.js"></script>
<script>
$(function(){
  $(".heading-compose").click(function() {
    $(".side-two").css({
      "left": "0"
    });
  });

  $(".newMessage-back").click(function() {
    $(".side-two").css({
      "left": "-100%"
    });
  });
})
</script>
<?php } else {
  header('Location: ' . BASE_URL . 'index.php');
}?>
</body>
</html>