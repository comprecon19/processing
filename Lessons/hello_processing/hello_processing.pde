// copy/paste of resulting code from hello.processing.org tutorial
void setup() {
  size(500, 400);
  background(10, 80, 100);
}

void draw() {
  if (mousePressed) {
    background(10, 80, 100);
  } 

  stroke(255, 255, 255);
  fill(160, 220, 90);
  ellipse(mouseX, 200, 300, 300);

  fill(160, 210, 230);
  rect(245, mouseY, 10, 240);

  fill(255, 255, 255);
  ellipse(mouseX, mouseY, 70, 70);
}