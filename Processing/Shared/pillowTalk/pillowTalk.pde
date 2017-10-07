String[] sayings;
PFont loveFont;

void setup(){
  size(1000,1000);
  
  //Load the sayings from an external file
  String[] sayings = loadStrings("sayings.txt");
  //print number of lines in the file
  println("there are " + sayings.length + " lines");
  
  //Print each saying once in the console for testing purposes
    //for (int i = 0 ; i < sayings.length; i++) {
    //  println(sayings[i]);
    //}
    
   loveFont = createFont("Verdana",32,false);
}

void draw(){
  background(255);
  
  textFont(loveFont);
  textAlign(CENTER, CENTER);
  
  fill(0);
  text("I love you too", width/2, height/2);
  textSize(
  text("I love you too", width/2, (height/2)-30);
}