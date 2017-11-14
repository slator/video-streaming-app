var Connection = require('tedious').Connection;
var Request = require('tedious').Request;
var TYPES = require('tedious').TYPES;
var async = require('async');

var config = {
    userName: 'vsa',
    password: 'vsa',
    server: '(localdb)\\mssqllocaldb',
    options: {
      database: 'VideoStreamingApplication',
      encrypt: false
    }
}
var connection = new Connection(config);

connection.on('connect', function(err) {
    if (err) {
        console.log(err);
    } else {
        console.log('Connected');
    }
});