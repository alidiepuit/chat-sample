// Setup basic express server
var express     = require('express'),
    app         = express(),
    path        = require('path'),
    server      = require('http').createServer(app),
    chatManager = require('./ChatManager.js'),
    io          = require('../..')(server);

var port = process.env.PORT || 3000;

server.listen(port, function () {
  console.log('Server listening at port %d', port);
});



// Routing
app.use(express.static(path.join(__dirname, 'public')));

// Chatroom

var numUsers = 0;

io.on('connection', function (socket) {
  var addedUser = false;

  // when the client emits 'new message', this listens and executes
  socket.on('new message', function (data) {
    var target = data.target;
    var message = data.message;
    var displayName = data.displayName;
    var adsTitle = data.adsTitle;
    var adsId = data.adsId;
    
    var contactId = parseInt(target.replace("chatbox_", ""));
    var userId = parseInt(socket.username.replace("chatbox_", ""));

    chatManager.insertNewMessage(userId, adsId, contactId, message, adsTitle, function(idMessage) {
      if (idMessage > 0) {
        // we tell the client to execute 'new message'
        socket.broadcast.emit(target, {
          username: socket.username,
          message: message,
          sender: socket.username,
          displayName: displayName,
          adsId: adsId,
          adsTitle: adsTitle,
          idMessage: idMessage,
        });

        socket.emit(socket.username+'_add_message', {
          sender: target,
          username: socket.username,
          message: message,
          adsId: adsId,
          adsTitle: adsTitle,
          idMessage: idMessage,
        });
      } else {
        switch (idMessage) {
          case 0:
            socket.emit(socket.username+'_add_message', {
              error: 'This contact was blocked!!!',
            });
            break;
          case -1: 
            socket.emit(socket.username+'_add_message', {
              error: 'You were blocked!!!',
            });
            break;
        }
        
      }
    });
  });

  // when the client emits 'seen message', this listens and executes
  socket.on('seen message', function (data) {
    //username: sender
    //target: receiver
    var userId = parseInt(data.username.replace("chatbox_", ""));
    var adsId = data.adsId;
    var contactId = parseInt(data.target.replace("chatbox_", ""));
    var timeStamp = Math.floor(Date.now() / 1000);

    chatManager.seenMessage(userId, adsId, contactId, timeStamp, function() {
      //seen message successfully
      // console.log('seen message successfully');
      socket.broadcast.emit(data.username+'_seen_message', {
        sender: data.target,
        username: socket.username,
        adsId: data.adsId,
        time: timeStamp,
      });
    });
  });

  // when the client emits 'add user', this listens and executes
  socket.on('add user', function (username) {
    console.log('add user ' + username);

    if (addedUser) return;

    var userId = parseInt(username.replace("chatbox_", ""));
    socket.userId = userId;


    // we store the username in the socket session for this client
    socket.username = username;
    addedUser = true;

    chatManager.getUnseenMessage(userId, function(notification, listUnseenMessage) {
      socket.emit(username+'_login', {
        listUnseenMessage: listUnseenMessage,
        notification: notification,
      });
    });

    chatManager.getListContact(userId, function(listContact) {
      socket.emit(username+'_list_contact', {
        listContact: listContact,
      });
    })

  });

  socket.on('load_more_message', function(data) {
    var contactId = parseInt(data.target.replace("chatbox_", ""));
    var lastMessageId = data.lastMessageId || 0;
    chatManager.getHistoryMessage(data.userId, contactId, data.adsId, lastMessageId, function(listMessage) {
      socket.emit(socket.username+'_load_more_message', {
        target: contactId,
        adsId: data.adsId,
        adsTitle: '',
        listMessage: listMessage,
      });
    });
  })

  socket.on('block_contact', function(data) {
    var contactId = parseInt(data.target.replace("chatbox_", ""));
    chatManager.blockContact(data.userId, contactId, function(result) {
      
    });
  })

  socket.on('remove_block_contact', function(data) {
    var contactId = parseInt(data.target.replace("chatbox_", ""));
    chatManager.removeBlockContact(data.userId, contactId, function(result) {
      
    });
  })

  socket.on('delete message', function(idMessage) {
    chatManager.removeMessage(socket.userId, idMessage, function(result) {
      
    });
  })

  // when the client emits 'typing', we broadcast it to others
  socket.on('typing', function (data) {
    var target = data.target;
    socket.broadcast.emit('typing', {
      username: socket.username,
      sender: socket.username,
      target: target,
    });
  });

  // when the client emits 'stop typing', we broadcast it to others
  socket.on('stop typing', function () {
    socket.broadcast.emit('stop typing', {
      username: socket.username
    });
  });

  // when the user disconnects.. perform this
  socket.on('disconnect', function () {
    if (addedUser) {
      // echo globally that this client has left
      socket.broadcast.emit('user left', {
        username: socket.username,
        userId: socket.userId,
      });
    }
  });

  socket.on('ping online', function(data) {
    // console.log('user ' + data.userId + ' alive!!!')
    //broadcast user online
    socket.broadcast.emit('user joined', {
      userId: data.userId,
    });
  })
});
