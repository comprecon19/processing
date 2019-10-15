// uses incrementing for animation
// uses a for loop to make many similar instances
// uses random() to interesting effect

float opacity = 255;
float snowY = 60;

void setup() {
  size(1000,700); // center is at 500, 350
} // end setup

void draw() {
  background(33,33,242);
  opacity=map(mouseX,0,1000,0,255);
 
  if(mousePressed) {
    //green world
    background(0,255,25);
    stroke(255,199,132,opacity);
    fill(173,41,52,opacity);
    rect(500-mouseY/2,350-mouseY/2, mouseY,mouseY);
    
    //snow
    noStroke();
    fill(255,0,246);
    
    for(int i = -1000; i < 1000; i=i+60) {
      ellipse(mouseX + i + random(300),snowY+random(300), 25,25);
    } // end for loop
    
    
    
  } else {
    stroke(35,255,251,opacity);
    strokeWeight(mouseY/3);
    fill(255);
    ellipse(500,350, mouseY,mouseY); 
    
    noStroke();
    fill(255,0,246);
    rect(200-12.5,snowY-12.5, 25,25);
    
  } // end if mousepressed
  
  snowY = snowY + 5;
 
  if(snowY > 700) {
    snowY = 0;
  }
  println(snowY);
  
} // end draw
