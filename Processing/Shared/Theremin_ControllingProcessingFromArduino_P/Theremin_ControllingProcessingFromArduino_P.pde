// import a serial library giving us access to all the serial port functionality
// https://processing.org/reference/libraries/serial/index.html
import processing.serial.*;

// make a new Serial object called myPort
Serial myPort;
// make a String container called 'value'
String value;
// this will be the radius of our rectangle
int rectSide = 100;

//Smoothing input
// Define the number of samples to keep track of. The higher the number, the
// more the readings will be smoothed, but the slower the output will respond to
// the input. Using a constant rather than a normal variable lets us use this
// value to determine the size of the readings array.
final int numReadings = 10;
int[] readings = new int[numReadings];      // the readings from the analog input
int readIndex = 0;              // the index of the current reading
int total = 0;                  // the running total
int average = 0;                // the average


void setup(){
  // make a window of 1023px by 1023px
  size(800, 800);
  // print a list of all the serial ports in the system as an array
  // just to check which one we need to connect to
  printArray(Serial.list());
  // grab the right name from that list and make it our port name
  String portName = Serial.list()[2];
  // set up our Serial object to belong to our sketch (this), to connect to the right port
  // and to communicate at baud 9600
  myPort = new Serial(this, portName, 9600);
  
  for (int thisReading = 0; thisReading < numReadings; thisReading++) {
    readings[thisReading] = 0;
  }
}

void draw(){
  //background rectangle with a bit of transparency
  fill(255, 10);
  rect(0, 0, width, height);
  
  // if serial data on our port is available
  if ( myPort.available() > 0) {
    // read a chunk of it until we get to the EOL character (see the Arduino sketch)
    // and store it in the 'value' container
    value = myPort.readStringUntil('\n');         
  }
  
  //remap the value 

  
  // here is some cleanup:
  // let's make sure the value is not null
  // it can happen if there is a communication error - we can disregard those errors
  if( value != null ){
    // trim some possible white space junk
    // just in case
    value = value.trim();
    // print the value as a separate line for us to see
    //println("Raw: " + value);
    
    //Smooth the incoming values from Arduino
    
    // subtract the last reading:
    total = total - readings[readIndex];
    // read from the sensor:
    readings[readIndex] = int(value);
    // add the reading to the total:
    total = total + readings[readIndex];
    // advance to the next position in the array:
    readIndex = readIndex + 1;

  // if we're at the end of the array...
  if (readIndex >= numReadings) {
    // ...wrap around to the beginning:
    readIndex = 0;
  }

  // calculate the average:
  average = total / numReadings;
    println("Smoothed: " + average);
    // set the radius of our rectangle to be half of the value we're recieving
    rectSide = int(average);
    //rectSide = int(value);
  }
  
  
  
  // draw our rectangle with a bit of opacity
  noStroke();
  fill(0);
  ellipse(width/2, height/2, rectSide*1.13, rectSide*1.13);
}