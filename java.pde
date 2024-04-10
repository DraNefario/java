float xp; float yp;
float x;
float y;
float easing = 0.05;

void setup() {
size(1200, 600);
}
void draw() { 
background(250);


fill(120);
stroke(79);
strokeWeight(5);

   float targetX = mouseX;
   float dx = targetX - x;
   x += dx * easing;
  
   float targetY = mouseY;
   float dy = targetY - y;
   y += dy * easing;

xp = 100;
yp =100;

circle(x+xp*0.6, y+yp*1, 50);
circle(x+xp*4.1, y+yp*1, 50);
rect(x+xp*2, y+yp*0.00001, 200, 60);
rect(x+xp*0.4, y+yp*0.300, 400, 80);
}
