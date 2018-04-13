$(function() {
  $('#searchText').on('input', function() {
    var name = $(this).val().toLowerCase();

    $filter = $('#base-contact .row.sideBar-body').filter(function(index) {
      return $(this).data('display-name').toLowerCase().indexOf(name) >= 0 || name == "";
    });

    $listContact = []
    $.map($filter, function(v,  i) {
      $listContact.push($(v).data('message-id'));
    })

    $('#base-contact .row.sideBar-body').each(function(i, v) {
      if ($listContact.indexOf($(v).data('message-id')) >= 0) {
        $(v).css('display', 'flex');
      } else {
        $(v).css('display', 'none');
      }
    })
  });

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
    var message = $('#input_' + target).val();
    // Prevent markup from being injected into the message
    message = cleanInput(message);
    // if there is a non-empty message and a socket connection
    if (message && connected) {
      $('#input_' + target).val('');
      var groupId = $('#input_' + target).data('group') || '';
      
      // tell server to execute 'new message' and send along one parameter
      socket.emit('new message', {
        message: message,
        target: target,
        displayName: displayName,
        group: groupId,
      });
    }
  }

  // Log a message
  function log (message, options) {
    var $el = $('<li>').addClass('log').text(message);
    addMessageElement($el, options);
  }

  function addContact(tar, displayName, message, container, blocked, time, avatar) {
    var $img = avatar ? $('<img src="/static/image/' + avatar + '"/>') : $('<span class="icon-user"/>');
    var $eleAvatar = $('<div class="col-sm-3 col-xs-3 sideBar-avatar pinky-template"/>')
      .append($('<div class="avatar-icon"/>').append($('<span class="tg-usericon"/>').append($img).append('<span ng-if="" fl-online-offline-icon="" size="" class="GroupChatThumbnail-onlineStatus online-status" data-user-id="'+tar+'" data-size="small" data-status="offline"></span>')));
    
    var $eleMain = $('<div class="col-sm-9 col-xs-9 sideBar-main"/>')
      .append($('<div class="row"/>').append($('<div class="col-sm-8 col-xs-8 sideBar-name"/>').append($('<div class="name-meta"/>').html(displayName))));

    if (message) {
      $eleMain = $('<div class="col-sm-9 col-xs-9 sideBar-main"/>')
      .append($('<div class="row"/>').append($('<div class="col-sm-8 col-xs-8 sideBar-name"/>').append($('<div class="name-meta"/>').html('<span class="name">'+displayName+'</span>' + '<h6>'+message+'</h6>'))));
    }

    var $eleBody = $('<div class="row sideBar-body" data-target="'+tar+'" data-display-name="'+displayName+'" />')
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
  }

  var initControlBoxChat = function(tar) {
    $messages = $('#' + tar).find('.msg_container_base');
    $messages.attr('data-target', tar);
    /*
    Load more history
    */
    $messages.unbind('scroll');
    $messages.scroll(function(){
      if($messages.scrollTop() == 0) {
        checkingThenLoadMoreMessage($(this));
      }
    });

    $('div.load_more_message').unbind('click');
    $('div.load_more_message').click(function() {
      var target = $(this).data('target');
      $messages = $('#' + target).find('.msg_container_base');
      checkingThenLoadMoreMessage($messages);
    })

    $inputMessage = $('#' + tar).find('.inputMessage');
    $($inputMessage).attr('id', 'input_' + tar);
    
    $inputMessage.unbind('keypress');
    $inputMessage.on("keypress", function (e) {            
      target = $(this).data('target');
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
      updateTyping();
    });

    // Focus input when clicking on the message input's border
    $inputMessage.unbind('click');
    $inputMessage.click(function () {
      target = $(this).data('target');
      $('#input_'+target).focus();
    });

    $('#'+tar).find('.btn-chat').unbind('click');
    $('#'+tar).find('.btn-chat').click(function() {
      target = $(this).data('target');
      sendMessage();
      socket.emit('stop typing');
      typing = false;
    })

    $('#'+tar).unbind('click');
    $('#'+tar).click(function() {
      decreaseNotify(tar);
      updateSeenMessage(username, tar);
    });
  }

  function openChatBox(tar, displayName, blocked) {
    if ($('#' + tar).length > 0) {
      return;
    }


    var chatbox = $('#chatbox_template').clone();
    $(chatbox).attr('id', tar);
    $(chatbox).find('.load_more_message').attr('data-target', tar);
    $(chatbox).removeAttr('data-chatbox-template');
    $('#chat-box').append(chatbox);
    $(chatbox).addClass('show');
    $(chatbox).find('.btn-chat').attr('data-target', tar);
    $(chatbox).find('.inputMessage').attr('data-target', tar);
    $(chatbox).find('.heading-name-meta').html('<span class="glyphicon glyphicon-comment"></span>'+displayName);
    $(chatbox).find('.block-contact').attr('data-target', tar);
    $(chatbox).find('.unblock-contact').attr('data-target', tar);

    if (blocked && blocked > 0) {
      $(chatbox).find('.unblock-contact').removeClass('hide');
    } else {
      $(chatbox).find('.block-contact').removeClass('hide');
    }
    
    
    
    initControlBoxChat(tar);

    

    $('.row.heading .block-contact').unbind('click');
    $('.row.heading .block-contact').click(function() {
      socket.emit('block_contact', {
        target: $(this).data('target'),
        userId: userId,
      });
      alert('Block successfully!!!');
      updateBlockContact($(this).data('target'), true);
      $(this).addClass('hide');
      $(this).parent().find('.unblock-contact').removeClass('hide');
    })

    $('.row.heading .unblock-contact').unbind('click');
    $('.row.heading .unblock-contact').click(function() {
      socket.emit('remove_block_contact', {
        target: $(this).data('target'),
        userId: userId,
      });
      alert('Unblock successfully!!!');
      updateBlockContact($(this).data('target'), false);
      $(this).addClass('hide');
      $(this).parent().find('.block-contact').removeClass('hide');
    })
  }

  var updateBlockContact = function(target, blocked) {
    if (blocked) {
      $('#base-contact .row.sideBar-body[data-target='+target+'] .block-contact').removeClass('hide');
    } else {
      $('#base-contact .row.sideBar-body[data-target='+target+'] .block-contact').addClass('hide');
    }
    $('#base-contact .row.sideBar-body[data-target='+target+']').attr('data-blocked', blocked);
  }

  function updateSeenMessage(username, tar) {
    //username: sender
    //target: receiver
    socket.emit('seen message', {
      username: target || '',
      target: username,
      group: groupId,
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
      var $messageBodyDiv = $('<div class="col-sm-12 message-main-sender"/>').append($('<div class="sender"/>').append($('<div class="message-text"/>').text(data.message)).append($('<div class="col-sm-1 col-xs-1 delete-message" data-id="'+data.idMessage+'"/>').append($('<i class="fa fa-close"/>'))));
    } else {
      var $messageBodyDiv = $('<div class="col-sm-12 message-main-receiver"/>').append($('<div class="receiver"/>').append($('<div class="message-text"/>').addClass('avatar-icon').append($('<img/>').attr('src','/static/image/'+data.avatar)).append($('<span>').text(data.message))));
    }

    var typingClass = data.typing ? 'typing' : '';
    
    if (data.typing) {
      $messageBodyDiv = $('<div class="col-md-10 col-xs-10">')
        .append($('<img src="/images/imessage-prank.gif"/>'));
    }

    var $messageDiv = $('<div class="row message-body" data-id="'+data.idMessage+'"/>')
      .data('username', data.username)
      .addClass(typingClass);

    $messageDiv.append($messageBodyDiv);

    addMessageElement($messageDiv, options);

    $('.delete-message').unbind('click');
    $('.delete-message').click(function() {
      var idMessage = $(this).data('id');
      socket.emit('delete message', {
        'idMessage': idMessage,
        group: groupId,
      });
      $('.row.message-body[data-id='+idMessage+']').remove();
    })
  }

  function addSeenMessage(target, time) {
    if ($('#' + target).find('.msg_seen').length > 0) {
      var messageDiv = $('#' + target).find('.msg_seen');
      $('#' + target).find('.msg_container_base').append(messageDiv);
      $(messageDiv).find("time.timeago").attr('datetime', timeAgo(time));
      $(messageDiv).find("time.timeago").attr('timeago', '');
      $("time.timeago").timeago();
      return;
    }
    var $messageDiv = $('<div class="msg_seen"/>').append('seen&nbsp;-&nbsp;<time class="timeago" datetime="'+timeAgo(time)+'"></time>');
    $messages = $($('#' + target).find('.msg_container_base'));
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

    $messages = $($('#' + target).find('.msg_container_base'));
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
    return $('.message-body.typing').filter(function (i) {
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
    
  });

  // Whenever the server emits 'new message', update the chat body
  socket.on(username, function (data) {
    increaseNotify(data.sender);
    onReceiveMessage(data);
  });

  socket.on('group'+groupId, function (data) {
    data['avatar'] = listUsers[data.userId]?listUsers[data.userId].avatar:'';
    onReceiveMessage(data);
  })

  var onReceiveMessage = function(data, options) {
    target = data.sender;
    var groupId = data.group || '';

    if (groupId) {
      //
    } else {
      openChatBox(target, data.displayName);
    }
    
    addChatMessage(data, options);
  }

  var onAddMessage = function(data, options) {
    if (data.error) {
      alert(data.error);
      return;
    }
    target = data.sender;
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
    target = ele.data('target');
    var lastId = ele.find('.row.message-body:first').data('id');
    loadMoreMessage(target, lastId);
  }

  var loadMoreMessage = function(tar, lastId) {
    socket.emit('load_more_message', {
      userId: userId,
      target: tar,
      lastMessageId: lastId,
      group: groupId,
    })
  }

  var sortContactByLastMessageId = function(listElements, data, container) {
    $(listElements).sort(function (a, b) {
        return parseInt($(a).data(data)) < parseInt($(b).data(data));
    }).each(function () {
        var elem = $(this);
        elem.remove();
        $(elem).appendTo(container);
    });

    $('.row.sideBar-body').unbind('click');
    $('.row.sideBar-body').click(function(event) {
      target = $(this).data('target');
      var displayName = $(this).data('display-name');
      var blocked = $(this).data('blocked');

      $('.conversation').removeClass('show');
      $('#' + target).addClass('show');
      openChatBox(target, displayName, blocked);
    })
  }

  socket.on(username+'_load_more_message', function(data) {
    if (data.group) {
      // console.log(data);
      $loadMoreElement = $('#' + data.target).find('.msg_container_base').find('.load_more_message');
      var listMessage = data.listMessage || [];
      listMessage.forEach(function(message, idx) {
        if (userId != message.userId) {
          onReceiveMessage({
            'sender': data.target,
            'displayName': '',
            'message': message.message,
            'idMessage': message.idMessage,
            avatar: listUsers[message.userId].avatar,
          }, {
            prepend: true,
            scrollTop: true,
          });
        } else {
          onAddMessage({
            'sender': data.target,
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
        $('#' + data.target).find('.msg_container_base').prepend($loadMoreElement);
      }
    } else {
      // console.log(data);
      $loadMoreElement = $('#chatbox_' + data.target).find('.msg_container_base').find('.load_more_message');
      var listMessage = data.listMessage || [];
      listMessage.forEach(function(message, idx) {
        if (userId == message.contactId) {
          onReceiveMessage({
            'sender': 'chatbox_' + data.target,
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
        $('#chatbox_' + data.target).find('.msg_container_base').prepend($loadMoreElement);
      }
    }
  });

  socket.on(username+'_add_message', function (data) {
    onAddMessage(data);
  });

  socket.on(username+'_seen_message', function (data) {
    addSeenMessage(data.sender, data.time);
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
    log('you have been disconnected');
  });

  socket.on('reconnect', function () {
    log('you have been reconnected');
    if (username) {
      socket.emit('add user', {
        'username': username,
        'group': groupId,
      });
    }
  });

  socket.on('reconnect_error', function () {
    log('attempt to reconnect has failed');
  });

  socket.on('list-user-online', function(data) {
    $('#chat-box').find('.row.sideBar').html('');
    groups = data.groups;
    for(var key in data.users) {

      if (key != username && groups[groupId].indexOf(key) != -1 
        && data.users.hasOwnProperty(key)) {

        var val = data.users[key];
        listUsers[val.userId] = val;
        addContact('chatbox_'+val.userId, val.displayName, '',
            $('#chat-box').find('.row.sideBar'), false, null, val.avatar);
      }
    }
  });

  socket.on('new-user-online', function(data) {
    if (data.group != groupId || $('#chat-box .row.sideBar-body[data-target='+data.user.username+']').length!=0) {
      return;
    }
    listUsers[data.user.userId] = data.user;
    addContact('chatbox_'+data.user.userId, data.user.displayName, '',
      $('#chat-box').find('.row.sideBar'), false, null, data.user.avatar); 
  });

  socket.on("gotToken", function(message){
      console.log(message);
      if (username) {
        initControlBoxChat('group'+groupId);

        socket.emit('add user', {
          'username': username,
          'group': groupId,
        });
      }
      if(message.token != "") {
          localStorage.setItem("token", message.token);
          token = message.token;
      }
  });

  if (username) {
    setInterval(function() {
      socket.emit('ping online', {
        userId: userId,
      })
    }, 5000);
  }

});

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
  } else {
    $('.notification.GroupChatThumbnail-onlineStatus.online-status').attr('data-status', 'offline');
  } 
}, 2000);
var clearNotifyTitle = function() {
  clearInterval(intervalNotifyTitle);
}

var timeAgo = function(timeStamp) {
  return moment.unix(timeStamp).format("YYYY-MM-DDTH:m:sZ");
}