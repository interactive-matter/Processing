 	

// Example by Tom Igoe

import processing.serial.*;
import java.util.StringTokenizer;

Serial myPort;  // The serial port
float xVect=0;
float yVect=0;
float zVect=0;

void setup() {
    size(640, 360, P3D); 
  noStroke(); 
  colorMode(RGB, 1); 

  
  // List all the available serial ports:
  println(Serial.list());

  // I know that the first port in the serial list on my mac
  // is always my  Keyspan adaptor, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[0], 14400);
}

void draw() {
    String inBuffer = myPort.readStringUntil('\n');       
    if (inBuffer != null) {
      StringTokenizer tokenizer = new StringTokenizer(inBuffer);
      if (tokenizer.countTokens()==3) {
        String x = tokenizer.nextToken();
        String y = tokenizer.nextToken();
        String z = tokenizer.nextToken();
        print("X=");
        print(x);
        print(", Y=");
        print(y);
        print(", Z=");
        print(z);
        println("");
        xVect= Float.valueOf(x)/50*PI;
        yVect= Float.valueOf(y)/50*PI;
        zVect= Float.valueOf(z)/50*PI
        ;
      }
    }

  background(0.5);
  lights();
  
  pushMatrix(); 
 
  translate(width/2, height/2, -30); 
  
  float length= sqrt(  sq(xVect) + sq(xVect) + sq(zVect));
  float xRot = atan2(xVect,yVect);
  float yRot = acos(zVect/length);
  
  rotateX(xRot);
  rotateY(yRot);
  
  scale(90);
  beginShape(QUADS);

  fill(0, 1, 1); vertex(-1,  1,  1);
  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(1, 0, 1); vertex( 1, -1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);

  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1,  1);

  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);

  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(0, 1, 1); vertex(-1,  1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);
  fill(0, 0, 0); vertex(-1, -1, -1);

  fill(0, 1, 0); vertex(-1,  1, -1);
  fill(1, 1, 0); vertex( 1,  1, -1);
  fill(1, 1, 1); vertex( 1,  1,  1);
  fill(0, 1, 1); vertex(-1,  1,  1);

  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1,  1);
  fill(0, 0, 1); vertex(-1, -1,  1);

  endShape();
  
  popMatrix(); 
  
}
