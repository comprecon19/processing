// knob connected to Analog pin 0
// sensor connected to Analog pin 1

import processing.serial.*;
import cc.arduino.*;

int knobValue;
int sensorValue;
float redValue;

Arduino myArduino;

// two different smoother objects
Smoother mySmoother;
Smoother sensorSmoother;

void setup() {
  
  // initialize smoother object and set resolution
  mySmoother = new Smoother(100); 
  
  sensorSmoother = new Smoother(20); 
  
  size(500,500);
  
  // print out available ports
  println(Arduino.list());
  
  //connect to Arduino, initialize object
  myArduino = new Arduino(this, Arduino.list()[2], 57600);
  
}

void draw() {
  
   background(0);
  
   knobValue = myArduino.analogRead(0);
   knobValue = mySmoother.average(knobValue);
   
   sensorValue = myArduino.analogRead(1);
   sensorValue = sensorSmoother.average(sensorValue);
   
   println(sensorValue);
   
   redValue = map(float(sensorValue), 0, 675, 0,255);
   
   fill(redValue, 50, 100);
   
   ellipse( knobValue, knobValue, sensorValue, sensorValue);

}
