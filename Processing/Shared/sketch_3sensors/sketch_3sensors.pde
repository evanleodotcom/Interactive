import processing.serial.*;

Serial myPort;
String value;
int rectSide = 100;

int temperature, soundLevel, potLevel;

void setup(){
   size(1023,1023);
   //printArray(Serial.list());
   
   String portName = Serial.list()[2];
   myPort = new Serial(this, portName, 9600);
}

void draw(){
  fill(255,255,0,60);
  rect(0, 0, width, height);
  
  if (myPort.available() > 0){
    value = myPort.readStringUntil('\n');
  }
  
  if( value != null){
    value = value.trim();
    //print(value);
    int mysensors[] = int(split(value,  '\t'));
    printArray(mysensors);
   
   delay(100);
   
  temperature = mysensors[0];
  potLevel = mysensors[1];
  soundLevel = mysensors[2];
  }
  
  float processedColor = map(temperature, -40, 125, 0, 255);
  fill(0,255,processedColor,40);
  
  rectMode(RADIUS);
  rect(potLevel,height/2,soundLevel,soundLevel);
  
}