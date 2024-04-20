import gifAnimation.*;

boolean keyPressedA = true;
boolean keyPressedB = true;
boolean keyPressedC = true;

Gif myAnimation;

void setup() {
  size(800, 600);  
  myAnimation = new Gif(this, "mat1.gif");
  myAnimation.play();
}

void draw() {
  background(255);
  image(myAnimation, 0, 0);
  fill(0, 255, 0);
  circle(width/2, height/1.45, width / 10);  
  textSize(width / 25);  
  fill(255, 0, 0);
  text("Qual é a forma geométrica?", width/2, height/1.25);
  textSize(width / 40);  
  fill(255, 0, 0);
  text("Pressione A para Círculo, B para Triângulo e C para Quadrado", width/2, height/1.156);
  drawBoxes();
  drawText();
  verdadeiroFalso();
}

void drawBoxes() {
  fill(255); 
  int numRetangulos = 3;
  float espacamento = width / 4; 
  float largura = width / 5;  
  float altura = width / 20;
  for (int i = 0; i < numRetangulos; i++) {
    rect((width - numRetangulos * espacamento) / 2 + (i * espacamento), height/1.1, largura, altura);
  }
}

void drawText() {
  String[] texto = {"Círculo", "Triângulo", "Quadrado"};
  int numRetangulos = 3;
  float espacamento = width / 4;  
  float largura = width / 5;  
  float altura = width / 20;  
  for (int i = 0; i < numRetangulos; i++) {
    fill(0);
    textSize(width / 50);  
    textAlign(CENTER, CENTER);
    text(texto[i], (width - numRetangulos * espacamento) / 2 + (i * espacamento) + largura / 2, height / 1.1 + altura / 2);
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    keyPressedA = !keyPressedA;
  } else if(key == 'c' || key == 'C') {
    keyPressedC = !keyPressedC;
  } else if (key == 'b' || key == 'B') {
    keyPressedB = !keyPressedB;
  }
}

void verdadeiroFalso() {
  if (!keyPressedA) {
    fill(0, 255, 0);
    rect((width - 3 * width / 4) / 2, height/1.1, width / 5, width / 20);
  }
  if (!keyPressedB) {
    fill(255, 0, 0);
    rect((width - 3 * width / 4) / 2 + width / 4, height/1.1, width / 5, width / 20);
  }
  if (!keyPressedC) {
    fill(255, 0, 0);
    rect((width - 3 * width / 4) / 2 + width / 2, height/1.1, width / 5, width / 20);
  }
}
