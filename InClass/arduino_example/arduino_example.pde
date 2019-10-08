import cc.arduino.*;
import processing.serial.*;

Arduino myArduino;

float knobValue;

void setup() {
  size(500,500);
  
  println(Arduino.list());
  
  myArduino = new Arduino(this,Arduino.list()[3], 57600);
  
}

void draw() {
  
  knobValue = myArduino.analogRead(0);
  println(knobValue);
  
  background(0);
  rect(knobValue,knobValue, 50,50);
  

  
}