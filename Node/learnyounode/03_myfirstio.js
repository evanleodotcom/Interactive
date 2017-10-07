//import the fs module for accessing the filesystem
//file:///usr/local/lib/node_modules/learnyounode/node_apidoc/fs.html
var fs = require('fs');

//returns a buffer object containing the full contents of a file
var fileBuffer = fs.readFileSync(process.argv[2]);
//buffer documentation file:///usr/local/lib/node_modules/learnyounode/node_apidoc/buffer.html

//convert the buffer thing into a string
var fileString = fileBuffer.toString();

//split the string into an arrray with newlines \n as the split points
var newLines = fileString.split('\n');

//print the number of resulting newlines minues the very last one which is actually the end of the paragraph
console.log((newLines.length)-1);
