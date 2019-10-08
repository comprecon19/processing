// hello processing but sensor input
// dependencies -- arduino library and StandardFirmata

import processing.serial.*;
import cc.arduino.*;

int rawData;
float floatValue;

Arduino myArduino;

void setup() {
  size(500, 400);
  background(10, 80, 100);

  // Prints out the available serial ports.
  println(Arduino.list());
  
  // initialize arduino object
  myArduino = new Arduino(this, Arduino.list()[3], 57600); //baudrate is important here
  
}

void draw() {
   
  rawData = myArduino.analogRead(0); // read pin 0 on the arduino
  //println(rawData);
  
  floatValue = float(rawData); // convert to float to work with ellipse()
  
  if (mousePressed) {
    background(10, 80, 100);
    myArduino.digitalWrite(13, Arduino.HIGH);
  } else {
    myArduino.digitalWrite(13, Arduino.LOW);
  }
  stroke(255, 255, 255);
  fill(160, 220, 90);
  ellipse(floatValue, 200, 300, 300);

  fill(160, 210, 230);
  rect(245, floatValue, 10, 240);

  fill(255, 255, 255);
  ellipse(floatValue, floatValue, 70, 70);      

}