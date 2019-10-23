import processing.serial.*; //import serial library
import cc.arduino.*;  //import arduino library

Arduino myArduino; //declare arduino object

Smoother mySmoother;

float knobValue = -1;
float knobValuePosition = -1;
float knobValueColor = -1;

void setup() {
  size(500,500);
  
  mySmoother = new Smoother(50);

  //view available serial ports
  println(Arduino.list());

  //connect to Arduino, initialize object
  myArduino = new Arduino(this, Arduino.list()[4], 57600);

} //end setup

void draw() {
  knobValue = myArduino.analogRead(1);
  println(knobValue);
  
  knobValuePosition = map(knobValue, 0, 670, 0, width);
  knobValuePosition = mySmoother.average(int(knobValuePosition));
  knobValueColor = map(knobValue, 0, 670, 0, 255);
  
  myArduino.analogWrite(9, int(knobValueColor));
  background(knobValueColor, 0, 0);
  ellipse(knobValuePosition, knobValuePosition, 300, 300);
  
} // end draw
