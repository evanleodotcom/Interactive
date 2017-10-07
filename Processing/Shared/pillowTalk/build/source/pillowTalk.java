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

public class pillowTalk extends PApplet {

String[] sayings;

public void setup(){

  String[] sayings = loadStrings("sayings.txt");
  println("there are " + sayings.length + " lines");

    for (int i = 0 ; i < sayings.length; i++) {
      println(sayings[i]);
    }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pillowTalk" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
