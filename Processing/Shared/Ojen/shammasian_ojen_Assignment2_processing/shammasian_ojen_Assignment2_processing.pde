// import a serial library giving us access to all the serial port functionality
// https://processing.org/reference/libraries/serial/index.html
import processing.serial.*;

// make a new Serial object called myPort
Serial myPort;
// make a String container called 'buttonAction'
String buttonAction;
// this will be the radius of our rectangle
float rectSide = 100;
float rad;
float deg;

float randomR;
float randomG;
float randomB;

void setup(){
  // make a window of 1023px by 1023px
  size(500, 500);
  background(255);
  // print a list of all the serial ports in the system as an array
  // just to check which one we need to connect to
  printArray(Serial.list());
  // grab the right name from that list and make it our port name
  String portName = Serial.list()[2];
  // set up our Serial object to belong to our sketch (this), to connect to the right port
  // and to communicate at baud 9600
  myPort = new Serial(this, portName, 9600);
}

void draw(){
  //background rectangle with a bit of transparency
  //fill(255, 255, 0, 60);
  //rect(0, 0, width, height);
  
  // if serial data on our port is available
  if ( myPort.available() > 0) {
    // read a chunk of it until we get to the EOL character (see the Arduino sketch)
    // and store it in the 'buttonAction' container
    buttonAction = myPort.readStringUntil('\n');         
  }
  
  // here is some cleanup:
  // let's make sure the buttonAction is not null
  // it can happen if there is a communication error - we can disregard those errors
  if( buttonAction != null ){
    // trim some possible white space junk
    // just in case
    buttonAction = buttonAction.trim();
    // print the buttonAction as a separate line for us to see
    println(buttonAction);
    // set the radius of our rectangle to be half of the buttonAction we're recieving
    rectSide = float(buttonAction)/2;
    rad = radians(rectSide);
    //println(rad);
  }
  
  
  fill(randomR, randomG, randomB);

  pushMatrix();
  // draw our rectangle with a bit of opacity
  // make sure it's in the RADIUS mode, 
  // so drawing from the center and using half its side as a measurement:
  //rectMode(RADIUS);
  translate(width/2, height/2);
  rotate(rad);
  rect(0, 0, 50, 50);
  noStroke();
  popMatrix();
  
  // only create random fill for rectangle if rotate has changed
  delay(100);
    randomR = random(0, 255);
    randomG = random(0, 255);
    randomB = random(0, 255);
  // ASK MAXIM: 
  // how would you refresh the random color only on the
  //if (buttonAction) {
  //  randomR = random(0, 255);
  //  randomG = random(0, 255);
  //  randomB = random(0, 255);
  //}

}