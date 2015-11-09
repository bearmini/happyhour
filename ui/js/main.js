var ipc = require('ipc');
var $ = require('./bower_components/jquery/dist/jquery.js');

ipc.on('reply-brew-info', function(arg){
  console.log(arg);
  $('#version').text(arg.version);
});

ipc.send('query-brew-info');
