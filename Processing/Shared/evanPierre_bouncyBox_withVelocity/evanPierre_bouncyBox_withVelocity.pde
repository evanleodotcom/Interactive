float boxX = 50;
float boxY = 150;
int rectHeight= 100;
int rectWidth= 100;
float speed = 9;
int newSpeed = 9;
float alpha = 255;
float newAlpha = 255;


boolean movingRight = true;
boolean movingDown = true;

// sup 
void setup(){
 size(500,500);
}

//GO GO GO GO
void draw(){
  
noStroke();
background(255,89,65);
rectMode(CENTER);
fill(0,0,255,alpha);
rect(boxX,boxY,rectWidth,rectHeight);

if(movingRight){
boxX = boxX+speed;
if (boxX >= width-50){
  movingRight = !movingRight;
  speed = newSpeed;
  alpha = newAlpha;
}
}
else{
  boxX = boxX-speed;
  if(boxX <= 50){
  movingRight = !movingRight;
  speed = newSpeed;
  alpha = newAlpha;
  }
}

if(movingDown){
boxY = boxY+speed;
if (boxY >= height-50){
  movingDown = !movingDown;
  speed = newSpeed;
  alpha = newAlpha;
}
}
else{
  boxY = boxY-speed;
  if(boxY <= 50){
  movingDown = !movingDown;
  speed = newSpeed;
  alpha = newAlpha;
  }
}

if (speed > 1){
  speed -=.1;
}else{
  speed = 1;
}

if (alpha > 0){
  alpha -=6;
}else{
  alpha =01;
}

}