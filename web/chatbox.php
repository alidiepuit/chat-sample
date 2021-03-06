<?php
require_once "lib/application.php";
require_once "lib/AuthManager.php";

$user = AuthManager::getInstance()->getIdentity();

if ($user) {
?>
<h1>Welcome: <?=$user['first_name']?>, <a href="/logout.php">logout</a></h1>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="/static/css/bootstrap.min.css" rel="stylesheet">
  <link href="/static/css/chatbox.css?v=<?=rand()?>" rel="stylesheet">

  <script type="text/javascript">
  var userId = "<?= $user['id']?>";
  var username = "chatbox_<?= $user['id']?>";
  var displayName = "<?= $user['first_name']?>";
  var adsId = adsId || 0;
  var adsTitle = adsTitle || '';
  var listBlocked = {};
  var sessId = '<?= $_COOKIE['PHPSESSID']?>';
  </script>

  <script src="/static/js/jquery.js"></script>
  <script src="/static/js/bootstrap.min.js"></script>
  <script src="/static/js/moment.min.js"></script>
  <script src="/static/js/jquery.timeago.js"></script>
  <script src="http://local.chat-sample.com:3000/socket.io/socket.io.js"></script>
  <script src="http://local.chat-sample.com:3000/main.js?v=1"></script>

<div id="chat-box">
  <div class="container app">
    <div class="row app-one">
      <div class="col-sm-4 side">
        <div class="side-one">
          <div class="row heading">
            
            
          </div>

          <div class="row sideBar"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="chatbox row chat-window col-xs-5 col-md-3 " id="chatbox_template" data-chatbox-template="1" style="margin-left:10px;">
      <div class="ui card panel panel-default">
         <div class="content content-chat-header">
            <h3 class="panel-title"></h3>
            <div class="heading-dot pull-right chatbox-close">
              <i class="fa fa-close fa-2x  pull-right" aria-hidden="true"></i>
           </div>
         </div>
         <div class="image panel-body msg_container_base">
            <a class="load_more_message">Load more messages...</a>
            <div class="spinner hide">
               <div class="bounce1"></div>
               <div class="bounce2"></div>
               <div class="bounce3"></div>
            </div>
         </div>
         <div class="extra content">
            <div class="ui large transparent left icon input">
               <input id="" type="text" class="form-control input-sm chat_input inputMessage" placeholder="Write your message here..." />
            </div>
         </div>
      </div>
   </div>
</div>
<?php } else {
  header('Location: ' . BASE_URL . 'index.php');
}
?>