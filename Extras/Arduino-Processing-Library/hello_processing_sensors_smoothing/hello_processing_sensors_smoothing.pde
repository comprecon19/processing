// uses multiple inputs and Smoothers to smooth the data
// dependencies -- arduino library and StandardFirmata

import processing.serial.*;
import cc.arduino.*;

int rawKnob;
float floatKnob;

int rawSensor;
float floatSensor;

Smoother knobSmoother;
Smoother sensorSmoother;

Arduino myArduino;

void setup() {
  size(500, 400);
  background(10, 80, 100);

  // Prints out the available serial ports.
  println(Arduino.list());
  
  // initialize arduino object
  myArduino = new Arduino(this, Arduino.list()[3], 57600);
  
  // initialize smoother object and set resolution
  knobSmoother = new Smoother(40);
  sensorSmoother = new Smoother(40);
  
}

void draw() {
   
  rawKnob = myArduino.analogRead(0); // read pin 0 on the arduino
  //println(rawData);
  
  rawKnob = knobSmoother.average(rawKnob);
  floatKnob = float(rawKnob); // convert to float to work with ellipse()
  
  rawSensor = myArduino.analogRead(1); // read the sensor pin on the arduino
  rawSensor = sensorSmoother.average(rawSensor);
  floatSensor = float(rawSensor);
  
  if (mousePressed) {
    background(10, 80, 100);
    myArduino.digitalWrite(13, Arduino.HIGH);
  } else {
    myArduino.digitalWrite(13, Arduino.LOW);
  }
  stroke(255, 255, 255);
  fill(160, 220, 90);
  ellipse(floatKnob, 200, 300, 300);

  fill(160, 210, 230);
  rect(floatSensor, floatKnob, 10, 240);

  fill(255, 255, 255);
  ellipse(floatKnob, floatKnob, 70, 70);      

}