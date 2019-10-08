int i = 0;

void setup(){
 size(500, 400);
 background(255);
}

void draw(){
  fill(255);
  
  ellipse(250, i, 500, i); 
  
  i=i+5;
  
}
