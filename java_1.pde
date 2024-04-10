float xp; float yp;
float x;
float y;
float easing = 0.05;

void setup() {
size(2000, 1200);
}
void draw() { 
background(250);


fill(120);
stroke(79);
strokeWeight(5);

xp = 100;
yp =100;

circle(xp*4.25, yp*3.8, 50);
circle(xp*7.75, yp*3.8, 50);
rect(xp*5.30, yp*2.40, 200, 60);
rect(xp*4.00, yp*3.00, 400, 80);


   float targetX = mouseX;
   float dx = targetX - x;
   x += dx * easing;
  
   float targetY = mouseY;
   float dy = targetY - y;
   y += dy * easing;
   
   ellipse(x, y, 100, 100);
}
