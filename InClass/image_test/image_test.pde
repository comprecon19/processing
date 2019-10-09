PImage myCoolPhoto;

void setup() {
  size(800,800);
  myCoolPhoto = loadImage("schoolbus.jpg");
}

void draw() {
  background(0);
  ellipse(width/2, height/2, 100, 100);
  tint(255, 0, 0, 130);
  image(myCoolPhoto, mouseX, mouseY, mouseX, mouseY);
}
