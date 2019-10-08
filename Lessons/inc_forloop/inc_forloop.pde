// uses incrementing to animate
// uses a for loop to make many similar instances

float opacity = 255;
float snowYpos = 0;

void setup() {
  size(1000,700);
}

void draw() {
  opacity = map(mouseX, 0, 1000, 0, 255);
  strokeWeight(mouseY/3);

  if (mousePressed) {
    // redraw background and set stroke and fill for main shape
    background(66,244,200);
    stroke(30,27,114, opacity);
    fill(242,118,84, opacity);
    rect(500-mouseY/2, 350-mouseY/2, mouseY, mouseY);
    
    // set stroke and fill for "snow"
    noStroke();
    fill(242,118,84, 255);
    for(int i=-1000; i <=1000; i=i+100) {
      ellipse(mouseX+i, snowYpos+i/6, 20, 20);
    }
    
  } else {
    // redraw background and set stroke and fill for main shape
    background(30,27,114);
    stroke(242,118,84, opacity);
    fill(66,244,200, opacity);
    ellipse(500, 350, mouseY, mouseY);
    
    // set stroke for "snow"
    noStroke();
    rect(mouseX-10, snowYpos, 20, 20);
  }
  
  // increment Y position for snow
  snowYpos=snowYpos+5;
  // reset Y position for snow when it's out of range of canvas
  if (snowYpos>=700) {
    snowYpos = 0;
  }

  println(snowYpos); // like Serial.println() in arduino
  
}