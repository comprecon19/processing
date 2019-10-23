// MASK FILE MUST BE SAME SIZE 
// AS THE IMAGE IT IS MASKING

PImage myCoolPhoto;
PImage imgMask;
void setup() {
  size(800,800);
  myCoolPhoto = loadImage("schoolbus.jpg");
  imgMask = loadImage("mask_circle.jpg");
  myCoolPhoto.mask(imgMask);
  imageMode(CENTER);
}

void draw() {
  background(0);
  image(myCoolPhoto, mouseX, mouseY, mouseX, mouseY);
}
