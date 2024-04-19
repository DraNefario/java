import gifAnimation.*;

boolean keyPressedA = true;
boolean keyPressedB = true;
boolean keyPressedC = true;

Gif myAnimation;

void setup() {
  size(800, 1000);
  myAnimation = new Gif(this, "mat1.gif");
  myAnimation.play();
}

void draw() {
  background(255);
  image(myAnimation, 0, 0);
  fill(0, 255, 0);
  circle(width/2, height/1.45, 100);
  textSize(32);
  fill(0);
  text("Qual é a forma geométrica?", width/2, height/1.25);
  textSize(20);
  fill(0);
  text("Pressione A para Círculo, B para Triângulo e C para Quadrado", width/2, height/1.156);
  drawBoxes();
  drawText();
  verdadeiroFalso();
}

void drawBoxes() {
  fill(255); 

  int numRetangulos = 3;
  float espacamento = 200;
  float largura = 150;
  float altura = 60;

  for (int i = 0; i < numRetangulos; i++) {
    rect(130 + (i * espacamento), height/1.1, largura, altura);
  }
}

void drawText() {
  String[] texto = {"Círculo", "Triângulo", "Quadrado"};
  int numRetangulos = 3;
  float espacamento = 200;
  float largura = 150;
  float altura = 60;

  for (int i = 0; i < numRetangulos; i++) {
    fill(0);
    textSize(16);
    textAlign(CENTER, CENTER);
    text(texto[i], 130 + (i * espacamento) + largura / 2, height / 1.1 + altura / 2);
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
    rect(130, height/1.1, 150, 60);
  }
  if (!keyPressedB) {
    fill(255, 0, 0);
    rect(130 + 200, height/1.1, 150, 60);
  }
  if (!keyPressedC) {
    fill(255, 0, 0);
    rect(130 + 400, height/1.1, 150, 60);
  }
}
