var mysql     = require('mysql'),
    config    = require('./config.js');

class Database {
  constructor(config) {
    this.connection = mysql.createConnection(config);
  }
  query(sql, args) {
    return new Promise( (resolve, reject) => {
      this.connection.query(sql, args, (err, rows) => {
        if (err)
          return reject(err);
        resolve(rows);
      });
    });
  }
  close() {
    return new Promise( (resolve, reject ) => {
      this.connection.end(err => {
        if (err)
            return reject(err);
        resolve();
      });
    });
  }
}

class ChatManager {
  constructor() {
    this.db = new Database(config.db);
  }
  insertNewMessage(userId, contactId, message, callback) {
    console.log('insertNewMessage');

    var query = 'INSERT INTO chatbox_contact(user_id,contact_id,message) ' +
                    ' VALUES(?,?,?)';
    var args = [userId, contactId, message];
    // console.log(args);
    var queryBlock = 'SELECT * FROM chatbox_block WHERE (user_id=? AND contact_id=?) OR (user_id=? AND contact_id=?)';
    var argsBlock = [contactId, userId, userId, contactId];
    var db = this.db;

    this.db.query(queryBlock, argsBlock).then(rows => {
      if (rows.length > 0) {
        if (rows[0].user_id == userId) {
          callback(0);
        } else {
          callback(-1);
        }
      } else {
        db.query(query, args).then(rows => {
          callback(rows.insertId);
        });
      }
    });
    
  }
  insertMessageChatGroup(userId, groupId, message, callback) {
    console.log('insertMessageChatGroup');
    
    var table = 'group'+groupId+ '_chat';
    var query = 'INSERT INTO ' + table + '(user_id,message) ' +
                    ' VALUES(?,?)';
    var args = [userId, message];
    // console.log(args);

    this.db.query(query, args).then(rows => {
      callback(rows.insertId);
    });
  }
  seenMessage(userId, contactId, timeStamp, callback) {
    console.log('seenMessage');
    
    var query = 'UPDATE chatbox_contact SET seen_at=FROM_UNIXTIME(?) WHERE user_id=? AND contact_id=? AND seen_at IS NULL';
    var args = [timeStamp, userId, contactId];
    console.log(args);
    this.db.query(query, args).then(rows => {
      if (rows.affectedRows > 0) {
        callback();
      }
    });
  }
  getHistory(userId, contactId, callback) {
    console.log('getHistory');
    
    var query = 'SELECT * FROM chatbox_contact WHERE user_id=? AND contact_id=? ORDER BY create_at DESC LIMIT 10';
    var args = [userId, contactId];
    // console.log(args);
    this.db.query(query, args).then(rows => {
      // console.log(rows);
      if (rows > 0) {
        callback();
      }
    });
  }
  getUnseenMessage(receiverId, callback) {
    console.log('getUnseenMessage');
    
    //query contact_id = userId: receiver message
    var query = 'SELECT count(id) as count,user_id FROM chatbox_contact WHERE contact_id=? AND seen_at IS NULL GROUP BY user_id';
    var args = [receiverId];
    // console.log('getUnseenMessage');
    var db = this.db;
    var listUnseenMessage = [];
    var notification = {};

    this.db.query(query, args).then(rows => {
      if (rows && rows.length > 0) {
        
        var query = 'SELECT chatbox_contact.*, users.first_name,users.username FROM chatbox_contact LEFT JOIN users ON chatbox_contact.user_id=users.id WHERE ((contact_id=? AND user_id=?) OR (contact_id=? AND user_id=?)) ORDER BY id DESC LIMIT 10';
        var listPromise = [];
        rows.forEach(function(row, idx) {
          notification[row.user_id] = {};
          notification[row.user_id] = row.count;

          var args = [row.user_id,receiverId,receiverId,row.user_id];
          // console.log(args);
          listPromise.push(db.query(query, args));
        });

        Promise.all(listPromise).then(function(values) {
          
          values.forEach(function(rows, idx) {
            rows.forEach(function(row, idx) {
              listUnseenMessage.push({
                'userId': row.user_id,
                'displayName': row.first_name,
                'contactId': row.contact_id,
                'message': row.message,
                'idMessage': row.id,
                'username': row.username,
                'time': row.create_at,
                'seen': row.seen_at,
              });
            });
          });

          callback(notification, listUnseenMessage.reverse());
        });
      } else {
        callback([]);
      }
    });
  }

  getListContact(userId, callback) {
    console.log('getListContact');
    
    // console.log('get list contact: ' + userId);
    var addContact = function(listContact, rows) {
      rows.forEach(function(row, idx) {
        if (row.username) {

          if (!listContact[row.contact_id]) {
            listContact[row.contact_id] = {};
          }

          if (!listContact[row.contact_id]) {
            listContact[row.contact_id] = {
              'userId': row.user_id,
              'contactId': row.contact_id,
              'displayName': row.first_name,
              'message': row.message,
              'idMessage': row.id,
              'blocked': row.blocked,
              'time': row.time,
              'avatar': row.avatar,
            }
          }
          if (row.id > listContact[row.contact_id].idMessage) {
            listContact[row.contact_id].idMessage = row.id;
            listContact[row.contact_id].message = row.message;
            listContact[row.contact_id].time = row.time;
          }
        }
      });
    };
    // console.log('getListContact');

    var listContact = {};
    var listPromise = [];
    var db = this.db;

    var query = 'SELECT chat.user_id, chat.contact_id, \
      users.username, users.avatar, users.first_name, \
      (SELECT message FROM chatbox_contact WHERE chatbox_contact.user_id=? AND chatbox_contact.contact_id=chat.contact_id ORDER BY id DESC LIMIT 1) as message, \
      (SELECT UNIX_TIMESTAMP(create_at) FROM chatbox_contact WHERE chatbox_contact.user_id=? AND chatbox_contact.contact_id=chat.contact_id ORDER BY id DESC LIMIT 1) as time, \
      (SELECT id FROM chatbox_contact WHERE chatbox_contact.user_id=? AND chatbox_contact.contact_id=chat.contact_id ORDER BY id DESC LIMIT 1) as id, \
      (SELECT contact_id FROM chatbox_block WHERE user_id=? AND chatbox_block.contact_id=chat.contact_id) as blocked \
      FROM chatbox_contact as chat \
      LEFT JOIN users ON chat.contact_id=users.id \
      WHERE chat.user_id=? \
      GROUP BY chat.user_id,chat.contact_id';
    var args = [userId,userId,userId,userId,userId];
    //query contact when userId is the one who send message
    listPromise.push(this.db.query(query, args));

    query = 'SELECT chat.user_id as contact_id, chat.contact_id as user_id, \
        users.username, users.avatar, users.first_name, \
        (SELECT message FROM chatbox_contact WHERE chatbox_contact.user_id=chat.user_id AND chatbox_contact.contact_id=? ORDER BY id DESC LIMIT 1) as message, \
        (SELECT UNIX_TIMESTAMP(create_at) FROM chatbox_contact WHERE chatbox_contact.user_id=chat.user_id AND chatbox_contact.contact_id=? ORDER BY id DESC LIMIT 1) as time, \
        (SELECT id FROM chatbox_contact WHERE chatbox_contact.user_id=chat.user_id AND chatbox_contact.contact_id=? ORDER BY id DESC LIMIT 1) as id, \
        (SELECT contact_id FROM chatbox_block WHERE user_id=? AND chatbox_block.contact_id=chat.user_id) as blocked \
        FROM chatbox_contact as chat \
        LEFT JOIN users ON chat.user_id=users.id \
        WHERE chat.contact_id=? \
        GROUP BY chat.user_id,chat.contact_id';
    //query contact when userId is the one who receive message
    listPromise.push(this.db.query(query, args));
    
    Promise.all(listPromise).then(function(values) {
      // console.log(values);
      values.forEach(function(rows, idx) {
        addContact(listContact, rows);
      });
    }).then( () => {
      // console.log(listContact);
      callback(listContact);
    });
  }

  getHistoryMessage(userId, contactId, lastMessageId, callback) {
    console.log('getHistoryMessage');
    
    // console.log('get history message');
    var query = 'SELECT chatbox_contact.* FROM chatbox_contact WHERE ((contact_id=? AND user_id=?) OR (contact_id=? AND user_id=?)) ORDER BY id DESC LIMIT 10';
    var args = [contactId, userId, userId, contactId, lastMessageId];
    if (lastMessageId > 0) {
      // console.log('lastMessageId: ' + lastMessageId);
      query = 'SELECT chatbox_contact.* FROM chatbox_contact WHERE ((contact_id=? AND user_id=?) OR (contact_id=? AND user_id=?)) AND id < ? ORDER BY id DESC LIMIT 10';
      args = [contactId, userId, userId, contactId, lastMessageId];
    }
    
    this.db.query(query, args).then(rows => {
      var listMessage = [];
      if (rows && rows.length > 0) {
        rows.forEach(function(row, idx) {
          listMessage.push({
            'userId': row.user_id,
            'contactId': row.contact_id,
            'message': row.message,
            'idMessage': row.id,
          });
        });
      }
      callback(listMessage);
    });
  }

  getHistoryMessageGroup(groupId, lastMessageId, callback) {
    console.log('getHistoryMessageGroup');
    
    var table = 'group' + groupId + '_chat';
    var query = 'SELECT * FROM ' + table + ' WHERE true ORDER BY cid DESC LIMIT 10';
    var args = [];

    if (lastMessageId > 0) {
      // console.log('lastMessageId: ' + lastMessageId);
      query = 'SELECT * FROM ' + table + ' WHERE true AND cid < ? ORDER BY cid DESC LIMIT 10';
      args = [lastMessageId];
    }
    
    console.log(query);
    this.db.query(query, args).then(rows => {
      var listMessage = [];
      if (rows && rows.length > 0) {
        rows.forEach(function(row, idx) {
          listMessage.push({
            'userId': row.user_id,
            'message': row.message,
            'idMessage': row.cid,
          });
        });
      }
      callback(listMessage);
    });
  }

  blockContact(userId, contactId, callback) {
    console.log('blockContact');
    
    var query = 'INSERT INTO chatbox_block VALUES(?,?)';
    var args = [userId, contactId];
    this.db.query(query, args);
  }

  removeBlockContact(userId, contactId, callback) {
    console.log('removeBlockContact');
    
    var query = 'DELETE FROM chatbox_block WHERE user_id=? AND contact_id=?';
    var args = [userId, contactId];
    this.db.query(query, args);
  }

  removeMessage(userId, messageId, callback) {
    console.log('removeMessage');
    
    var query = 'DELETE FROM chatbox_contact WHERE user_id=? AND id=?';
    var args = [userId, messageId];
    this.db.query(query, args);
  }

  removeMessageGroup(userId, groupId, messageId, callback) {
    console.log('removeMessageGroup');
    var table = 'group' + groupId + '_chat';
    var query = 'DELETE FROM ' + table + ' WHERE user_id=? AND cid=?';
    var args = [userId, messageId];
    this.db.query(query, args);
  }
}

module.exports = new ChatManager();