int potentiometer = A0;
int sound_sensor = A1;
int temp_sensor = A2;

float temperature;
int B=3975;      //B value of the thermistor
float resistance; 


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  pinMode(potentiometer, INPUT);
  pinMode(sound_sensor, INPUT);
  pinMode(temp_sensor, INPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  //below temperature values are already figured out in Arduino - download the libraries!
  int val = analogRead(temp_sensor);
  resistance=(float)(1023-val)*10000/val;
  temperature=1/(log(resistance/10000)/B+1/298.15)-273.15;
  Serial.print(int(temperature));
  Serial.print("\t");     
      // '\t' means tab
      //printing (displaying in bar below) the temperature and then a '\t' (meaning tab over)
  
  val = analogRead(potentiometer);
  Serial.print(int(val));
  Serial.print("\t");
  //after above tab after temperature it will print the potentiometer reading

  val = analogRead(sound_sensor);
  Serial.print(int(val));
  Serial.print("\t");
  //after above tab after potentiometer it will print the sound sensor reading

  Serial.println();
  // it will print a line at the end
  
  delay(100);
}
