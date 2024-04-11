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

circle(x+xp*25, y+yp*150, 50);
circle(x+xp*375, y+yp*150, 50);
rect(x+xp*200, y+yp*0, 200, 60);
rect(x+xp*0.4, y+yp*65, 400, 80);
}
