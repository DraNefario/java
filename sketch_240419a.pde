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
float xBoneco, yBoneco, larguraBoneco, alturaBoneco;
float x1q, y1q, largura1, altura1, x2q, y2q, largura2, altura2;
boolean colisao1;
boolean colisao2;
boolean colisao3;
float x5 = 100;
float y5 = 300;
float speed = 5; 

void setup() {
  size(2000, 800); 
}

void draw() {
  background(255); 
    
 
  
  x = width/3 + amplitude * sin(angle);
  x1 = width/3 + amplitude1 * sin(angle1);
  x2 = width/3 + amplitude * sin(angle2);
  
  float c = map(x, 0, width, 100, 255);
  float b = map(x, 0, width, 100, 255);
  float e = map(x, 0, width, 255, 100);
  float d = map(mouseX, 0, width, 100, 600);
  float a = d/400;
  float s = 100;
  
  map(a);
  
  
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
  
  x1q = x-100*a;
  x2q = x2-100*a;
  y1q = height/2*0.70*a;
  largura1 = 300*a;
  altura1 = 140*a;
  y2q = height/2*0.70*a;
  largura2 = 300*a;
  altura2 = 140*a;
  
  xBoneco =x5 - 20;
  yBoneco = y5 - 30;
  larguraBoneco = 40;
  alturaBoneco = 80;
  
  

  //rect(x5 - 20, y5 - 30, 40, 80);
   colisao1 =x1q < x2q + largura2 &&
                  x1q + largura1 > x2q &&
                  y1q < y2q + altura2 &&
                  y1q + altura1 > y2q;
                  
   colisao2 = xBoneco < x2q + largura2 &&
                   xBoneco + larguraBoneco > x2q &&
                   yBoneco < y2q + altura2 &&
                   yBoneco + alturaBoneco > y2q;
                   
   colisao3 = xBoneco < x1q + largura1 &&
                   xBoneco + larguraBoneco > x1q &&
                   yBoneco < y1q + altura1 &&
                   yBoneco + alturaBoneco > y1q;
   
  carDraw1(e, b, a, x, d, c);
  carDraw2(e, b, a, x, d, c);
  
  //quadrado2
  noStroke();
   fill(255,0);
  rect(x-100*a, height/2*0.70*a, 300*a, 140*a);
  
  //quadrado1
  noStroke();
  fill(255,0);
  rect(x2-100*a, height/2*0.70*a, 300*a, 140*a);
  
 // casaDraw(a); 
  

  angle += TWO_PI / period;
  angle1 += TWO_PI / period1;
  angle2 += TWO_PI / period;
  
  boneco(d, a);
}

void map(float a) {
  fill(0, 255,0);
  rect(10*a, height/10*3*a, width*a*100, 3000*a);
  fill(0, 0, 200);
  rect(10*a, height/height*a, width*a*100, 240*a);
}



void carDraw1(float e, float b, float a, float x, float d, float c) {
  if (colisao1) {
    fill(random(255), random(255), random(255));
  } else {
    fill(0, b, e);
  circle(x+175*a, height/6*3*a, 50*a);
  circle(x-75*a, height/6*3*a, 50*a);
  rect(x-100*a, height/2*0.85*a, 300*a, 60*a);
  rect(x-100*a, height/2*0.7*a, 100*a, 60*a); 
  }
}

//void casaDraw( float a){
//  fill(255, 204, 0); 
//  rect(width/1*a, height/0.55*a, 1900*a, 2500*a);
//  triangle(width/1*a, 1900*a, height/0.55*a, 500*a, 1900*a, 2*a);
//}
 
void carDraw2(float e, float b, float a, float x, float d, float c) {
   if (colisao1) {
    fill(random(255), random(255), random(255));
  } else {
     fill(b, 0, c);
  circle(x2+175*a, height/6*3*a, 50*a);
  circle(x2-75*a, height/6*3*a, 50*a);
  rect(x2-100*a, height/2*0.85*a, 300*a, 60*a);
  rect(x2-100*a, height/2*0.7*a, 100*a, 60*a);
  }
}

void boneco(float a, float d){
  if (colisao2 || colisao3) {
    fill(random(255), random(255), random(255));
  } else {
  fill(255);
  ellipse(x5, (y5 - 20), 20, 20); 
  rect((x5 - 10), y5, 20, 40); 
  rect((x5 - 20), (y5 + 40), 40, 10);  
  }
  //quadrado3
  noStroke();
   fill(255, 0);
  rect(x5 - 20, y5 - 30, 40, 80);
   
 
  
  if (keyPressed && keyCode == RIGHT) {
    x5 += speed;
  }
  
  if (keyPressed && keyCode == LEFT) {
    x5 -= speed;
  }
   if (keyPressed && keyCode == DOWN) {
    y5 += speed;
  }
   if (keyPressed && keyCode == UP) {
    y5 -= speed;
  }
}
