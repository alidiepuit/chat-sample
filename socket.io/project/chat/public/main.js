$(function() {
  $('#chat-box .row.heading').click(function() {
    $('#chat-box .container.app').toggleClass('hide');
  });

  $('.footer-notification').click(function() {
    window.location.href = '/dashboard-message';
  })

  var FADE_TIME = 150; // ms
  var TYPING_TIMER_LENGTH = 400; // ms
  var COLORS = [
    '#e21400', '#91580f', '#f8a700', '#f78b00',
    '#58dc00', '#287b00', '#a8f07a', '#4ae8c4',
    '#3b88eb', '#3824aa', '#a700ff', '#d300e7'
  ];

  // Initialize variables
  var $window = $(window);
  var $usernameInput = $('.usernameInput'); // Input for username
  var $messages = $('.msg_container_base'); // Messages area
  var $inputMessage = $('.inputMessage'); // Input message input box

  var $loginPage = $('.login.page'); // The login page
  var $chatPage = $('.chat.page'); // The chatroom page

  // Prompt for setting a username
  // var username;
  var connected = false;
  var typing = false;
  var lastTypingTime;
  var $currentInput = $usernameInput.focus();

  var socket = io.connect('http://localhost:3000/', {
                timeout: 3000
            });

  var token = sessId || "";
  
  socket.emit("getToken", {token: token});

  if (username) {
    socket.emit('add user', username);
  }

  function addParticipantsMessage (data) {
    var message = '';
    if (data.numUsers === 1) {
      message += "there's 1 participant";
    } else {
      message += "there are " + data.numUsers + " participants";
    }
    log(message);
  }

  // Sends a chat message
  function sendMessage () {
    var message = $('#input_' + target + '_' + adsId).val();
    // Prevent markup from being injected into the message
    message = cleanInput(message);
    // if there is a non-empty message and a socket connection
    if (message && connected) {
      $('#input_' + target + '_' + adsId).val('');
      
      adsId = $('#' + target + '_' + adsId).data('ads-id');
      adsTitle = $('#' + target + '_' + adsId).data('ads-title');
      // tell server to execute 'new message' and send along one parameter
      socket.emit('new message', {
        message: message,
        target: target,
        displayName: displayName,
        adsId: adsId || 0,
        adsTitle: adsTitle || '',
      });
    }
  }

  // Log a message
  function log (message, options) {
    var $el = $('<li>').addClass('log').text(message);
    addMessageElement($el, options);
  }

  $('.button-open-chatbox').click(function() {
    target = $(this).data('chatbox');
    name = $(this).data('name');
    adsId = $(this).data('ads-id');
    adsTitle = $(this).data('ads-title');
    openChatBox(target, adsId, name);
  });

  function addContact(tar, aId, aTitle, displayName, message, container, blocked, time, avatar) {
    var $img = avatar ? $('<img src="/static/image/' + avatar + '"/>') : $('<span class="icon-user"/>');
    var $eleAvatar = $('<div class="col-sm-3 col-xs-3 sideBar-avatar pinky-template"/>')
      .append($('<div class="avatar-icon"/>').append($('<span class="tg-usericon"/>').append($img).append('<span ng-if="" fl-online-offline-icon="" size="" class="GroupChatThumbnail-onlineStatus online-status" data-user-id="'+tar+'" data-size="small" data-status="offline"></span>')));
    
    var $timeEle = '';
    if (time) {
      $timeEle = $('<time class="timeago" datetime="'+timeAgo(time)+'"></time>');
    }

    var $eleMain = $('<div class="col-sm-9 col-xs-9 sideBar-main"/>')
      .append($('<div class="row"/>').append($('<div class="sideBar-name"/>').append($('<div class="name-meta"/>').html(displayName + '<h6>'+aTitle+'</h6>')).append($timeEle)));

    if (message) {
      $eleMain = $('<div class="col-sm-9 col-xs-9 sideBar-main"/>')
      .append($('<div class="row"/>').append($('<div class="sideBar-name"/>').append($('<div class="name-meta"/>').html(displayName + '<h6>'+message+'</h6>')).append($timeEle)));
    }

    var $eleBody = $('<div class="row sideBar-body" data-target="'+tar+'" data-ads-id="'+aId+'" data-display-name="'+displayName+'" data-ads-title="'+aTitle+'" data-blocked="'+blocked+'"/>')
      .append($eleAvatar)
      .append($eleMain);

    if (blocked) {
      $eleBlock = $('<div class="col-sm-1 col-xs-1  heading-dot pull-right block-contact"/>').append($('<i class="fa fa-lock fa-2x  pull-right"/>'));
      $eleBody.append($eleBlock);
    } else {
      $eleBlock = $('<div class="col-sm-1 col-xs-1  heading-dot pull-right block-contact hide"/>').append($('<i class="fa fa-lock fa-2x  pull-right"/>'));
      $eleBody.append($eleBlock);
    }

    container.append($eleBody);

    $('.row.sideBar-body').unbind('click');
    $('.row.sideBar-body').click(function(event) {
      target = $(this).data('target');
      adsId = $(this).data('ads-id');
      adsTitle = $(this).data('ads-title');
      var displayName = $(this).data('display-name');
      openChatBox(target, adsId, displayName);
    })

  }

  function openChatBox(tar, aId, displayName) {
    if ($('#' + tar + '_' + aId).length > 0) {
      return;
    }


    var chatbox = $('#chatbox_template').clone();
    $(chatbox).attr('id', tar + '_' + aId);
    $(chatbox).find('.chatbox-close').attr('data-target', tar);
    $(chatbox).find('.chatbox-close').attr('data-ads-id', aId);
    $(chatbox).attr('data-ads-id', aId);
    $(chatbox).attr('data-ads-title', adsTitle);
    $(chatbox).find('.load_more_message').attr('data-target', tar);
    $(chatbox).find('.load_more_message').attr('data-ads-id', aId);
    $(chatbox).removeAttr('data-chatbox-template');
    $('#chat-box').prepend(chatbox);
    $(chatbox).addClass('show');
    $(chatbox).find('.btn-chat').attr('data-target', tar);
    $(chatbox).find('.inputMessage').attr('data-target', tar);
    $(chatbox).find('.spinner').attr('data-target', tar);
    $(chatbox).find('.panel-title').html(''+displayName + '<h6>' + adsTitle + '</h6>');

    $(chatbox).find('.block-contact').attr('data-target', tar);
    $(chatbox).find('.block-contact').attr('data-ads-id', aId);
    $(chatbox).find('.unblock-contact').attr('data-target', tar);
    $(chatbox).find('.unblock-contact').attr('data-ads-id', aId);

    if (listBlocked[tar]) {
      $(chatbox).find('.unblock-contact').removeClass('hide');
      $(chatbox).find('.block-contact').addClass('hide');
    }

    initChatBox();
    
    if ($('#chat-box').width() > $('body').width()) {
      $('#chat-box').find('.chatbox.row.chat-window:not(.hide):not([data-chatbox-template]):last').removeClass('show').addClass('hide');
    }

    $messages = $('#' + tar + '_' + aId).find('.msg_container_base');
    $messages.attr('data-target', tar);
    $messages.attr('data-ads-id', aId);
    /*
    Load more history
    */
    $messages.unbind('scroll');
    $messages.scroll(function(){
      if($messages.scrollTop() == 0) {
        checkingThenLoadMoreMessage($(this));
      }
    });
    $messages.bind('mousewheel DOMMouseScroll', function(e) {
        var scrollTo = null;

        if (e.type == 'mousewheel') {
            scrollTo = (e.originalEvent.wheelDelta * -1);
        }
        else if (e.type == 'DOMMouseScroll') {
            scrollTo = 40 * e.originalEvent.detail;
        }

        if (scrollTo) {
            e.preventDefault();
            $(this).scrollTop(scrollTo + $(this).scrollTop());
        }
    });
    $inputMessage = $('#' + tar + '_' + aId).find('.inputMessage');
    $($inputMessage).attr('id', 'input_' + tar + '_' + aId);
    
    $inputMessage.unbind('keypress');
    $inputMessage.on("keypress", function (e) {            
      target = $(this).data('target');
      adsId = aId;
      if (e.keyCode == 13) {
        if (username) {
          sendMessage();
          socket.emit('stop typing');
          typing = false;
        }
      }
    });

    $inputMessage.unbind('input');
    $inputMessage.on('input', function() {
      target = $(this).data('target');
      adsId = $(this).data('ads-id');
      updateTyping();
    });

    // Focus input when clicking on the message input's border
    $inputMessage.unbind('click');
    $inputMessage.click(function () {
      target = $(this).data('target');
      adsId = $(this).data('ads-id');
      $('#input_'+target + '_' + aId).focus();
    });

    $('#'+tar + '_' + aId).find('.btn.btn-chat').unbind('click');
    $('#'+tar + '_' + aId).find('.btn.btn-chat').click(function() {
      target = $(this).data('target');
      adsId = $(this).data('ads-id');
      sendMessage();
      socket.emit('stop typing');
      typing = false;
    })

    $('#'+tar + '_' + aId).unbind('click');
    $('#'+tar + '_' + aId).click(function() {
      $('.chatbox').find('.panel-heading.top-bar').css('background-color', '#666');
      $(this).find('.panel-heading.top-bar').css('background-color', '#3d8fa5');
      decreaseNotify(tar);

      updateSeenMessage(username, tar, aId);
    });

    $('a.load_more_message').unbind('click');
    $('a.load_more_message').click(function() {
      var target = $(this).data('target');
      var adsId = $(this).data('ads-id');
      $messages = $('#' + target + '_' + adsId).find('.msg_container_base');
      checkingThenLoadMoreMessage($messages);
    })

    $('.panel-heading.top-bar .block-contact').unbind('click');
    $('.panel-heading.top-bar .block-contact').click(function() {
      socket.emit('block_contact', {
        target: $(this).data('target'),
        userId: userId,
      });
      alert('Block successfully!!!');
      updateBlockContact($(this).data('target'), true);
      $('.unblock-contact[data-target='+$(this).data('target')+']').removeClass('hide');
      $('.block-contact[data-target='+$(this).data('target')+']').addClass('hide');

      listBlocked[$(this).data('target')] = true;
    })

    $('.panel-heading.top-bar .unblock-contact').unbind('click');
    $('.panel-heading.top-bar .unblock-contact').click(function() {
      socket.emit('remove_block_contact', {
        target: $(this).data('target'),
        userId: userId,
      });
      alert('Unblock successfully!!!');
      updateBlockContact($(this).data('target'), false);
      $('.unblock-contact[data-target='+$(this).data('target')+']').addClass('hide');
      $('.block-contact[data-target='+$(this).data('target')+']').removeClass('hide');
      
      listBlocked[$(this).data('target')] = false;
    })
  }

  var updateBlockContact = function(target, blocked) {
    if (blocked) {
      $('.row.sideBar-body[data-target='+target+'] .block-contact').removeClass('hide');
    } else {
      $('.row.sideBar-body[data-target='+target+'] .block-contact').addClass('hide');
    }
    $('.row.sideBar-body[data-target='+target+']').attr('data-blocked', blocked);
  }

  function updateSeenMessage(username, tar, adsId) {
    //username: sender
    //target: receiver
    socket.emit('seen message', {
      username: target,
      target: username,
      adsId: adsId,
    })
  }

  // Adds the visual chat message to the message list
  function addChatMessage(data, options) {
    // Don't fade the message in if there is an 'X was typing'
    var $typingMessages = getTypingMessages(data);
    options = options || {};
    if ($typingMessages.length !== 0) {
      options.fade = false;
      $typingMessages.remove();
    }

    if (data.username == username) {
      var $usernameDiv = '';
      var $messageBodyDiv = $('<div class="col-md-10 col-xs-10">')
        .append($('<div class="messages msg_sent"/>').text(data.message)).append($('<div class="col-sm-1 col-xs-1 delete-message" data-id="'+data.idMessage+'"/>').append($('<i class="fa fa-close"/>')));
    } else {
      var $img = $('.row.sideBar-body .tg-usericon img').attr('src') ? $('<img src="' + $('.row.sideBar-body .tg-usericon img').attr('src') + '" class="img-responsive"/>') : $('<img src="/images/Original-Facebook-Geek-Profile-Avatar-1.jpg" class="img-responsive"/>');
      var $usernameDiv = $('<div class="col-md-2 col-xs-2 avatar"/>').append($img);
      var $messageBodyDiv = $('<div class="col-md-10 col-xs-10">')
        .append($('<div class="messages msg_receive"/>').text(data.message));
    }

    var typingClass = data.typing ? 'typing' : '';

    var classContainer = data.username == username ? 'base_sent' : 'base_receive';
    var $messageDiv = $('<div class="row msg_container" data-id="'+data.idMessage+'"/>')
      .data('username', data.username)
      .addClass(typingClass)
      .addClass(classContainer);

    if (data.username == username) {
      $messageDiv.append($messageBodyDiv, $usernameDiv);
    } else {
      $messageDiv.append($usernameDiv, $messageBodyDiv);
    }

    if (data.typing) {
      $spinner = $('#' + target + '_' + adsId).find('.msg_container_base .spinner');
      $spinner.removeClass('hide');
      $messages = $($('#' + target + '_' + adsId).find('.msg_container_base'));
      $messages.append($spinner);
      $messages[0].scrollTop = $messages[0].scrollHeight;
    } else {
      addMessageElement($messageDiv, options);
    }

    $('.delete-message').unbind('click');
    $('.delete-message').click(function() {
      var idMessage = $(this).data('id');
      socket.emit('delete message', idMessage);
      $('.row.msg_container.base_sent[data-id='+idMessage+']').remove();
    })
  }

  function addSeenMessage(target, adsId, time) {
    if ($('#' + target + '_' + adsId).find('.row.msg_container.msg_seen').length > 0) {
      var messageDiv = $('#' + target + '_' + adsId).find('.row.msg_container.msg_seen');
      $('#' + target + '_' + adsId).find('.msg_container_base').append(messageDiv);
      $(messageDiv).find("time.timeago").attr('datetime', timeAgo(time));
      $(messageDiv).find("time.timeago").attr('timeago', '');
      $("time.timeago").timeago();
      return;
    }
    var $messageDiv = $('<div class="row msg_container base_sent msg_seen"/>').append('seen&nbsp;-&nbsp;<time class="timeago" datetime="'+timeAgo(time)+'"></time>');
    $messages = $($('#' + target + '_' + adsId).find('.msg_container_base'));
    $messages.append($messageDiv);
    $messageDiv.attr("style", "");
    if ($messages.length > 0) {
      $messages[0].scrollTop = $messages[0].scrollHeight;
    }
    $("time.timeago").timeago();
  }

  // Adds the visual chat typing message
  function addChatTyping(data) {
    data.typing = true;
    data.message = 'is typing';
    target = data.sender;
    addChatMessage(data);
  }

  // Removes the visual chat typing message
  function removeChatTyping(data) {
    $('.msg_container_base .spinner[data-target='+data.username+']').addClass('hide');
    getTypingMessages(data).fadeOut(function () {
      $(this).remove();
    });
  }

  // Adds a message element to the messages and scrolls to the bottom
  // el - The element to add as a message
  // options.fade - If the element should fade-in (default = true)
  // options.prepend - If the element should prepend
  //   all other messages (default = false)
  function addMessageElement(el, options) {
    var $el = $(el);

    // Setup default options
    if (!options) {
      options = {};
    }
    if (typeof options.fade === 'undefined') {
      options.fade = true;
    }
    if (typeof options.prepend === 'undefined') {
      options.prepend = false;
    }

    // Apply options
    if (options.fade) {
      $el.hide().fadeIn(FADE_TIME);
    }

    $messages = $($('#' + target + '_' + adsId).find('.msg_container_base'));
    if (options.prepend) {
      $messages.prepend($el);
    } else {
      $messages.append($el);
    }
    $el.attr("style", "");
    if ($messages.length > 0) {
      if (options.scrollTop) {
        //scroll to top
        $messages[0].scrollTop = 0;
      } else {
        //default: auto scroll down
        $messages[0].scrollTop = $messages[0].scrollHeight;
      }
    }
  }

  // Prevents input from having injected markup
  function cleanInput (input) {
    return $('<div/>').text(input).html();
  }

  // Updates the typing event
  function updateTyping () {
    if (connected) {
      if (!typing) {
        typing = true;
        socket.emit('typing', {
          target: target,
        });
      }
      lastTypingTime = (new Date()).getTime();

      setTimeout(function () {
        var typingTimer = (new Date()).getTime();
        var timeDiff = typingTimer - lastTypingTime;
        if (timeDiff >= TYPING_TIMER_LENGTH && typing) {
          socket.emit('stop typing', {
            target: target,
          });
          typing = false;
        }
      }, TYPING_TIMER_LENGTH);
    }
  }

  // Gets the 'X is typing' messages of a user
  function getTypingMessages (data) {
    return $('.msg_container.typing').filter(function (i) {
      return $(this).data('username') === data.username;
    });
  }

  // Gets the color of a username through our hash function
  function getUsernameColor (username) {
    // Compute hash code
    var hash = 7;
    for (var i = 0; i < username.length; i++) {
       hash = username.charCodeAt(i) + (hash << 5) - hash;
    }
    // Calculate color
    var index = Math.abs(hash % COLORS.length);
    return COLORS[index];
  }

  // Focus input when clicking anywhere on login page
  $loginPage.click(function () {
    $currentInput.focus();
  });

  // Socket events

  // Whenever the server emits 'login', log the login message
  socket.on(username+'_login', function (data) {
    connected = true;
    // console.log(data);
    

    var notification = data.notification || '';
    if (notification) {
      for(target in notification) {
        if (notification.hasOwnProperty(target)) {
          listAds = notification[target];
          for(ads in listAds) {
            for(i = 0; i < listAds[ads]; i++) {
              increaseNotify('chatbox_' + target);
            }
          }
        }
      }

      $('.chatbox.row.chat-window:not([data-chatbox-template])').remove();
      var listUnseenMessage = data.listUnseenMessage || [];
      listUnseenMessage.forEach(function(message, idx) {
        if (userId == message.contactId) {
          onReceiveMessage({
            'sender': 'chatbox_' + message.userId,
            'adsId': message.adsId,
            'adsTitle': message.adsTitle,
            'displayName': message.displayName,
            'message': message.message,
            'idMessage': message.idMessage,
            'username': message.username,
          });
        } else {
          onAddMessage({
            'sender': 'chatbox_' + message.contactId,
            'adsId': message.adsId,
            'adsTitle': message.adsTitle,
            'message': message.message,
            'idMessage': message.idMessage,
          })
        }
        
      });
    }
    
  });

  // Whenever the server emits 'new message', update the chat body
  socket.on(username, function (data) {
    increaseNotify(data.sender);
    onReceiveMessage(data);
  });

  var onReceiveMessage = function(data, options) {
    target = data.sender;
    adsId = data.adsId;
    adsTitle = data.adsTitle;
    openChatBox(target, adsId, data.displayName);
    addChatMessage(data, options);
  }

  var onAddMessage = function(data, options) {
    if (data.error) {
      alert(data.error);
      return;
    }
    target = data.sender;
    adsId = data.adsId;
    adsTitle = data.adsTitle;
    addChatMessage({
      username: username,
      message: data.message,
      idMessage: data.idMessage,
    }, options);
  }

  var checkingThenLoadMoreMessage = function(ele) {
    if (ele.hasOwnProperty('data-loading-more')) {
      return
    }
    ele.attr('data-loading-more', 1);
    var target = ele.data('target');
    var adsId = ele.data('ads-id');
    var lastId = ele.find('.row.msg_container:first').data('id');
    loadMoreMessage(target, adsId, lastId);
  }

  var loadMoreMessage = function(tar, aId, lastId) {
    socket.emit('load_more_message', {
      userId: userId,
      target: tar,
      adsId: aId,
      lastMessageId: lastId,
    })
  }

  socket.on(username+'_load_more_message', function(data) {
    // console.log(data);
    $loadMoreElement = $('#chatbox_' + data.target + '_' + data.adsId).find('.msg_container_base').find('a.load_more_message');
    var listMessage = data.listMessage || [];
    listMessage.forEach(function(message, idx) {
      if (userId == message.contactId) {
        onReceiveMessage({
          'sender': 'chatbox_' + data.target,
          'adsId': data.adsId,
          'adsTitle': data.adsTitle,
          'displayName': '',
          'message': message.message,
          'idMessage': message.idMessage,
        }, {
          prepend: true,
          scrollTop: true,
        });
      } else {
        onAddMessage({
          'sender': 'chatbox_' + data.target,
          'adsId': data.adsId,
          'adsTitle': '',
          'message': message.message,
          'idMessage': message.idMessage,
        }, {
          prepend: true,
          scrollTop: true,
        })
      }
    });
    if (listMessage.length == 0) {
      $loadMoreElement.remove();
    } else {
      $('#chatbox_' + data.target + '_' + data.adsId).find('.msg_container_base').prepend($loadMoreElement);
    }
  });

  socket.on(username+'_add_message', function (data) {
    onAddMessage(data);
  });

  socket.on(username+'_seen_message', function (data) {
    addSeenMessage(data.sender, data.adsId, data.time);
  })

  socket.on(username+'_list_contact', function (data) {
    // console.log(data);
    var listContact = data.listContact || [];
    $('#chat-box').find('.row.sideBar').html('');
    $('.dropdown .dropdown-chat-box .row.sideBar').html('');
    for (idx in listContact) {
      var listAds = listContact[idx];
      for (i in listAds) {
        var row = listAds[i];

        //add to dashboard
        addContact('chatbox_'+row.contactId, row.adsId, row.adsTitle, row.displayName, '',
          $('#chat-box').find('.row.sideBar'), row.blocked, null, row.avatar);

        //add to dropdown chat notification nav bar
        addContact('chatbox_'+row.contactId, row.adsId, row.adsTitle, row.displayName, row.message,
          $('.dropdown .dropdown-chat-box .row.sideBar'), row.blocked, row.time, row.avatar);

        if (row.blocked) {
          listBlocked['chatbox_'+row.blocked] = true;
        }
      }
    }

    $("time.timeago").timeago();
  })

  // Whenever the server emits 'user joined', log it in the chat body
  socket.on('user joined', function (data) {
    $('.online-status').each(function(i, v) {
      if ($(v).data('user-id') == 'chatbox_'+data.userId) {
        $(v).attr('data-status', 'online');
      }
    });
  });

  // Whenever the server emits 'user left', log it in the chat body
  socket.on('user left', function (data) {
    $('.online-status').each(function(i, v) {
      if ($(v).data('user-id') == 'chatbox_'+data.userId) {
        $(v).attr('data-status', 'offline');
      }
    });
    removeChatTyping(data);
  });

  // Whenever the server emits 'typing', show the typing message
  socket.on('typing', function (data) {
    addChatTyping(data);
  });

  // Whenever the server emits 'stop typing', kill the typing message
  socket.on('stop typing', function (data) {
    removeChatTyping(data);
  });

  socket.on('disconnect', function () {
    // log('you have been disconnected');
  });

  socket.on('reconnect', function () {
    // log('you have been reconnected');
    if (username) {
      socket.emit('add user', username);
    }
  });

  socket.on('reconnect_error', function () {
    // log('attempt to reconnect has failed');
  });

  if (username) {
    setInterval(function() {
      socket.emit('ping online', {
        userId: userId,
      })
    }, 5000);
  }


  

  socket.on("gotToken", function(message){
      console.log(message);
      if(message.token != "") {
          localStorage.setItem("token", message.token);
          token = message.token;
      }
  });

});

var initChatBox = function() {
  $('.chatbox-close').unbind('click');
  $('.chatbox-close').on('click', function() {
    var target = $(this).data('target');
    var adsId = $(this).data('ads-id');

    $('#' + target + "_" + adsId).remove();

    if ($('#chat-box').width() + 350 < $('body').width()) {
      $('#chat-box').find('.chatbox.row.chat-window.hide:not(.show):not([data-chatbox-template]):last').removeClass('hide').addClass('show');
    }

    
  })
}
var countNewMessage = {};
var documentTitle = document.title;

var increaseNotify = function(target) {
  if (countNewMessage[target]) {
    countNewMessage[target]++;
  } else {
    countNewMessage[target] = 1;
  }
}
var decreaseNotify = function(target) {
  if (countNewMessage[target] > 0) {
    countNewMessage[target] = 0;
  }
}
var intervalNotifyTitle = setInterval(function() {
  newMessage = 0;
  for(key in countNewMessage){
    newMessage = newMessage + countNewMessage[key];
  }
  if (newMessage > 0) {
    //notification icon nav bar
    $('.notification.GroupChatThumbnail-onlineStatus.online-status').attr('data-status', 'online');
    if (document.title == documentTitle) {
      document.title = 'You have new messages (' + newMessage + ')';
    } else {
      document.title = documentTitle;
    }

    $('.notification.button_badge').removeClass('hide').text(newMessage);
  } else {
    $('.notification.GroupChatThumbnail-onlineStatus.online-status').attr('data-status', 'offline');
    document.title = documentTitle;
    $('.notification.button_badge').addClass('hide')
  } 
}, 2000);
var clearNotifyTitle = function() {
  clearInterval(intervalNotifyTitle);
}

var timeAgo = function(timeStamp) {
  return moment.unix(timeStamp).format("YYYY-MM-DDTH:m:sZ");
}