import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class bouncybox extends PApplet {

float boxX = 50;
float boxY = 150;
int rectHeight= 100;
int rectWidth= 100;
float speed = 9;
int newSpeed = 9;


boolean movingRight = true;
boolean movingDown = true;

// sup bitches
public void setup(){
 
}

//GO GO GO GO
public void draw(){

noStroke();
background(255,89,65);
rectMde(CENTER);

if (speed >= 8){
fill(0,255,0,127);
} else{
 fill(0,0,255,127);
}
rect(boxX,boxY,rectWidth,rectHeight);

if(movingRight){
boxX = boxX+speed;
if (boxX >= width-50){
  movingRight = !movingRight;
  speed = newSpeed;
}
}
else{
  boxX = boxX-speed;
  if(boxX <= 50){
  movingRight = !movingRight;
  speed = newSpeed;
  }
}

if(movingDown){
boxY = boxY+speed;
if (boxY >= height-50){
  movingDown = !movingDown;
  speed = newSpeed;
}
}
else{
  boxY = boxY-speed;
  if(boxY <= 50){
  movingDown = !movingDown;
  speed = newSpeed;
  }
}

if (speed > 1){
  speed -=.1f;
}else{
  speed = 1;
}

}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "bouncybox" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
