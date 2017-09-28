int potentiometer = A0;
int sound_sensor = A1;
int temperature_sensor = A2;

float temperature;
int B = 3975;       // B value of the thermistor
float resistance;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  pinMode(potentiometer, INPUT);
  pinMode(sound_sensor, INPUT);
  pinMode(temperature_sensor, INPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
  int val = analogRead(temperature_sensor);
  resistance = (float)(1023-val)*10000/val;
  temperature = 1/(log(resistance/10000)/B+1/298.15)-273.15; // values are from specs of the components
  Serial.print(temperature);
  Serial.print("\t");

  val = analogRead(potentiometer);
  Serial.print("Potentiometer: " + val);
  Serial.print("\t");

  val = analogRead(sound_sensor);
  Serial.print("Sound: " + val);
  Serial.print("\t");
  Serial.println();

  delay(100);

}
