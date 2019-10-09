color faveColor = color(0,255,247,100);

float mouseXScaled = -1;
float mouseYScaled = -1;

void setup() {
  size(800,600);
}

void draw() {
  mouseXScaled = map(mouseX, 0, width, 0, 255);
  mouseYScaled = map(mouseY, 0, height, 0, 255);
  
  if(mousePressed) {
    // do something special
    background(mouseXScaled, mouseYScaled, 150);
  } else {
    background(mouseXScaled);
  }
  
  noStroke();
  
  //stroke(0);
  fill(255);
  rect(mouseY/2, mouseX/3, 100, 50);
  
  //stroke(105,24,204,100);
  fill(105,222,mouseXScaled);
  ellipse( width/2, height/2, 50, 50);
  
  stroke(105,24,204,100);
  strokeWeight(15);
  fill(faveColor);
  triangle(200, 200, 350, 350, 200, 500);
  
  //for(int i = 0; i < 255; i++) {
  //  // do something with i
  //  ellipse(width/2, height/2, i, i);
  //}
 
}
