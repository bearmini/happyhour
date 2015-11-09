(function(){
'use strict';

var app = require('app');
var execSync = require('child_process').execSync;
var menubar = require('menubar');
var ipc = require('ipc');


var dir = app.getAppPath();

var options = {
  dir: dir,
  index: 'file://' + dir + '/.dist/index.html',
  width: 320,
  height: 200
};

var mb = menubar(options);

mb.on('ready', function() {
  setInterval(checkBrewUpdates, 3600 * 1000); // every 1 hour
  console.log('app is ready');
});

function checkBrewUpdates() {
  var i = gatherBrewInfo();
  console.log(i);
}

function gatherBrewInfo() {
  var version = '' + execSync('brew --version');
  var info = {
      version: version
  };
  return info;
}

function sendBrewInfoToRenderer(info) {
  console.log(ipc);
  //ipc.send('update-info', JSON.stringify(info));
}

ipc.on('query-brew-info', function(event, arg) {
  var bi = gatherBrewInfo();
  event.sender.send('reply-brew-info', bi);
});

ipc.on('do-brew-update', function(event, arg){
});

ipc.on('do-brew-upgrade', function(event, arg){
});


})();
