// Arduino library
// also look at examples that came with the library

// import arduino library and serial library
import processing.serial.*;
import cc.arduino.*;

Arduino myArduino; // initialize arduino

float knobValue;

void setup() {
  size(500,400);
  
  // ARDUINO STUFF -------------------------- //
  // Prints out the available serial ports.
  println(Arduino.list());
  
  // initialize arduino object
  // IMPORTANT -- [0] should match the correct port in the list
  myArduino = new Arduino(this, Arduino.list()[0], 57600);   
}

void draw() {
  
  knobValue = myArduino.analogRead(0); // read pin 0 on the arduino
  
  // draw a rectangle using knobValue as its coordinates
  rect(knobValue, knobValue, 50, 50);
  
}