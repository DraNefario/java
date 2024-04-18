float x;
float x1;
float x2;
float amplitude = 360; 
float amplitude1 = 1440;
float period = 240;
float period1 = 720;
float angle = 0;
float angle1 = 360;
float angle2 = 180;
float h, j, k, l, t;

void setup() {
  size(2000, 800); 
}

void draw() {
  background(255); 
  

  x = width/3 + amplitude * sin(angle);
  x1 = width/3 + amplitude1 * sin(angle1);
  x2 = width/3 + amplitude * sin(angle2);
  
  
  float c = map(x, 0, width, 0, 255);
  float b = map(x, 0, width, 0, 255);
  float e = map(x, 0, width, 255, 0);
  float d = map(mouseX, 0, width, 100, 600);
  float a = d/400;
  float s = 100;
  
  
  fill(0, 0, 0);
  rect(10*a, height/7*3*a, width*a*100, 200*a);
  fill(255, 204, 0); 

  int numRetangulos = 36;
  float espacamento = 7 * s * a;
  float largura = 300 * a;
  float altura = 60 * a;

  for (int i = -1000; i < numRetangulos; i++) {
    rect(x1 + (i * espacamento), height / 6 * 3 * a, largura, altura);
  }
  
  carDraw(e, b, a, x, d);
  
  h = x-100*a;
  j = x2-100*a;
  k = (x2-100*a) + (300*a);
  l = (x-100*a) + (300*a);
  boolean colisao = j<h && k>l;
  
  angle += TWO_PI / period;
  angle1 += TWO_PI / period1;
  angle2 += TWO_PI / period;
  
  colisao(e, b, a, x, d, h, j, k, l, colisao);
}

void carDraw(float e, float b, float a, float x, float d) {
  fill(0, b, e); 
  circle(x+175*a, height/6*3*a, 50*a);
  circle(x-75*a, height/6*3*a, 50*a);
  rect(x-100*a, height/2*0.85*a, 300*a, 60*a);
  rect(x-100*a, height/2*0.7*a, 100*a, 60*a);
  
  fill(b, e, 0); 
  circle(x2+175*a, height/6*3*a, 50*a);
  circle(x2-75*a, height/6*3*a, 50*a);
  rect(x2-100*a, height/2*0.85*a, 300*a, 60*a);
  rect(x2-100*a, height/2*0.7*a, 100*a, 60*a);
}

void colisao(float e, float b, float a, float x, float d, float h, float j, float k, float l, boolean colisao){
  for (carDraw){
    if (colisao) fill(random(255), random(255), random(255)) carDraw;
  
}






