float x; 
float amplitude = 100; 
float period = 120; 
float angle = 0; 

void setup() {
  size(800, 600); 
}

void draw() {
  background(255); 

  
  x = width/2 + amplitude * sin(angle);

  
  fill(0, 150, 255); 
  circle(x+175, width/6*3, 50);
  circle(x-75, width/6*3, 50);
  rect(x-100, width/2*0.85, 300, 60);
  rect(x-100, width/2*0.7, 100, 60);
 
 angle += TWO_PI / period;
}
