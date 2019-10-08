// taken from the GettingStartCapture example

import processing.video.*;

Capture cam;

void setup() {
  size(800, 450);

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
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  float green = map(mouseY, 0,450, 0, 255);
  tint(255,green,0);
  image(cam, 0, 0, width, height);
  
  float opacity = map(mouseX, 0, 800, 0., 1.);
  println(opacity);
  fill(0,0,0,opacity);
  rect(0,0,width,height);
}
