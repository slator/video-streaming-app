var http = require('http');
var Connection = require('tedious').Connection;
var Request = require('tedious').Request;
var TYPES = require('tedious').TYPES;
var async = require('async');

var config = {
    userName: 'vsa',
    password: 'vsa',
    server: '(localdb)\\mssqllocaldb',
    options: {
      database: 'VideoStreamingApplication'
    }
  }

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'application/json'});
    
    var connection = new Connection(config);
    function exec(sql) {
        var timerName = "QueryTime";
    
        var request = new Request(sql, function(err) {
            if (err) {
                console.log(err);
            }
        });
        request.on('doneProc', function(rowCount, more, rows) {
            if(!more){
                console.timeEnd(timerName);
            }
        });
        request.on('row', function(columns) {
            columns.forEach(function(column) {
                console.log("Sum: " +  column.value);
            });
        });
        console.time(timerName);
        connection.execSql(request);
    }
    // Open connection and execute query
    connection.on('connect', function(err) {
        async.waterfall([
            function(){
                exec('SELECT Id, Name From Categories');
            },
        ]);
    });

}).listen(8080);