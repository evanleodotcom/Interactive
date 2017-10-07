// You can access command-line arguments via the global process object. The process object has an argv property which is an array containing the complete command-line. i.e. process.argv.

//console.log(process.argv)

var total = 0;

for (var i = 2; i < process.argv.length; i++) {
  total+= Number(process.argv[i]);

//Alernative syntax for casting the string to a Number
total+= +process.argv[i];

  //return total; //RETURN EXITS IMMEDIATELY DINGUS
  // if(i == process.argv.length){ This doesn't break everything
  //   return total
  // }
}

 console.log(total);
