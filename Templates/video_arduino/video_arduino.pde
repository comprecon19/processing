// combination of GettingStartCapture with Arduino library

// import video library
import processing.video.*;
Capture cam; // initialize camera

// import arduino library
import processing.serial.*;
import cc.arduino.*;
Arduino myArduino; // initialize arduino

float knobValue;

void setup() {
  size(640, 480);
  
  // CAMERA STUFF -------------------------- //
  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
  } if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);

    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[0]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from the camera
    cam.start();
  }
  
  // ARDUINO STUFF -------------------------- //
  // Prints out the available serial ports.
  println(Arduino.list());
  
  // initialize arduino object
  // IMPORTANT -- [0] should match the correct port in the list
  myArduino = new Arduino(this, Arduino.list()[0], 57600);   
}

void draw() {
  
  // read the camera if it's available
  if (cam.available() == true) {
    cam.read();
  }
  
  // read pin from Arduino
  knobValue = myArduino.analogRead(0); 
  
  // change tint/brightness using knobValue from Arduino
  tint(knobValue);
  
  // draw the video
  image(cam, 0, 0, width, height);
}