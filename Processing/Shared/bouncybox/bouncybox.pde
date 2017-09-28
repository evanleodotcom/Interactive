float boxX = 50;
float boxY = 150;
int rectHeight= 100;
int rectWidth= 100;
float speed = 9;
int newSpeed = 9;


boolean movingRight = true;
boolean movingDown = true;

// sup bitches
void setup(){
 size(500,500);
}

//GO GO GO GO
void draw(){
  
noStroke();
background(255,89,65);
rectMode(CENTER);

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
  speed -=.1;
}else{
  speed = 1;
}

}