//Ojen button light

// Declare potentiometer on Analog pin A0
int button = 3;
int light = 7;
bool mySwitch;

void setup() {
  // Start a serial connection with a baud rate of 9600
  //open the serial pipe to the computer
  Serial.begin(9600);
  // Set the mode of the Analog pin connected to our potentiometer to be an input
  pinMode(button, INPUT);
  pinMode(light, OUTPUT);

}

void loop() {

  mySwitch = digitalRead(button);
  
  //when we press the button
 if(mySwitch == true){
  digitalWrite(light, HIGH);
 } else{
  digitalWrite(light, LOW);
 }

  //send the button value 
  //to the computer through the pipe
  //without this, no data would go to
  //the computer.
  Serial.println(mySwitch);
    
  delay(100);  
}








// Read the value of the potentiometer and assign it to a variable called 'value'
//  int value = analogRead(pot);
  // Send this value to the serial out as a separate line, therefore containing
  // the 'EOL' or end-of-line character
 // Serial.println(value);
  // Take a breather for 100 milliseconds
 // delay(100);
