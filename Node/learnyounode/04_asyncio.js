//import the fs module for accessing the filesystem
//file:///usr/local/lib/node_modules/learnyounode/node_apidoc/fs.html
var fs = require('fs');

//returns a buffer object containing the full contents of a file

var fileBuffer =  undefined; //we don't know what this is yet


function loadBuffer(callback){ 
  fs.readFile(process.argv[2],'utf8',function doneReading(err, data){ //run this code once the asynchronous read operation completes
      if(err){ //if something went wrong with the operation
        console.log("Shit's fucked up!");
      } else { //otherwise do this and sent it out
        fileBuffer = data.split('\n');
        fileBuffer = fileBuffer.length-1;
        callback();
      }
    });
}

function logBuffer(){
//console.log(fileBuffer);
}

loadBuffer(logBuffer);

//Alternative attempts

// downloadPhoto('http://coolcats.com/cat.gif', handlePhoto)
//
// function handlePhoto (error, photo) {
//   if (error) console.error('Download error!', error)
//   else console.log('Download finished', photo)
// }
//
// console.log('Download started')
//
//
