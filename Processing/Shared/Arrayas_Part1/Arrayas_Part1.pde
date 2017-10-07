//shorthand
//xPositions = {75,300,450,600,750};

//longhand
int[] xPositions;
void setup(){
  size(800,800);
  
  //longhand
  //xPositions = new int[3];
  //xPositions [0] = 75;
  //xPositions [1] = 300;
  //xPositions [2] = 450;
  xPositions = new int[width];
  background (0);
  //noLoop();
}

void draw(){
  background(0);
  for(int i=0; i < xPositions.length; i++){ //all arrays have length method
    fill(255,125,random(255));
    ellipse(xPositions[i], height/2, 50, 50);
    xPositions [i] = int(random(50,width-50));
    println(xPositions);
  }
  delay(1000);
}