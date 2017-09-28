// Declare potentiometer on Analog pin A0
int pot = A0;


int light = A1;

int value;
int brightness;

//declare variable for button toggle
bool buttonOn;

int inPin = 7;
int state = HIGH;
int reading;
int previous = LOW;

long time = 0;
long debounce = 200;

void setup() {
  // Start a serial connection with a baud rate of 9600
  Serial.begin(9600);
  // Set the mode of the Analog pin connected to our potentiometer to be an input
  pinMode(pot, INPUT);

 // Set the mode of the Analog pin connected to our light sensor to be an input
  pinMode(light, INPUT);

  //initiate the buzzer
  pinMode(6, OUTPUT);

  //initiate the button
  pinMode(inPin,INPUT);
}

void loop() {
  // Read the value of the potentiometer and assign it to a variable called 'value'
  value = analogRead(pot);
  // Send this value to the serial out as a separate line, therefore containing
  // the 'EOL' or end-of-line character
  //Serial.println(value);

  brightness = analogRead(light);
  int brightnessSend = map(brightness,0,760,0,1000);
  Serial.println(brightnessSend); 
  
  //Read the button
  reading = digitalRead(inPin);
  //Toggle the button
  if (reading ==HIGH && previous == LOW && millis() - time > debounce){
    if (state == HIGH){
      state = LOW;
    }else{
      state = HIGH;
    }
    time - millis();
  }
  
 // Serial.println(state);
  
  if (state == HIGH && brightness < 750){

    //pot range = 0-1023 
    //light range = ~ 100 - 760
    // decent buzzer output range - 400,5500
    
    int buzzTone = map(brightness,0,760,400,5500);
     //Serial.println(buzzTone);
     tone(6, buzzTone);

  } else{
    noTone(6);
  }

  //Set button state
  previous = reading;
  
  // Take a breather for 100 milliseconds
  delay(100);
}
