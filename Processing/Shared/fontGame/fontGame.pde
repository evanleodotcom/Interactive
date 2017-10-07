
String[] fontList;
PFont myFont;

String[] words = {"I\'m", "so", "fresh", "you", "can", "suck", "my", "nuts.","nuts.","SWAG!","SWAG!"};
int word = 0;
int iterator = 0;

void setup(){
  size(200, 200);
  //fontList = PFont.list();
  //printArray(fontList);
}

void draw(){
  myFont = createFont(myFonts[iterator], 32, false);
  background(0);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  //for(int i = 1; i < words.length; i++){
  //  background(0);
  //  text(words[i], width/2, height/2);
  //}
  
  text(words[word], width/2, height/2);
  if(word == words.length-1){
    word = 0;
  }else{
  word++;
}


delay(200);
}