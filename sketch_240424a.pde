int numBolas = 10;
float[] posX = new float[numBolas];
float[] posY = new float[numBolas];
float diametro = 20;
int bolaArrastada = -1;
color[] cores = new color[numBolas];
boolean ganhou = false;

void setup() {
  size(600, 600);
  background(255, 255, 255);

  for (int i = 0; i < numBolas; i++) {
    posX[i] = random(250, 350);
    posY[i] = random(200, 300);
    cores[i] = (i < numBolas / 2) ? color(255, 0, 0) : color(0, 0, 255);
  }
}

void draw() {
  background(255); 

  fill(0);
  rect(200,150,200,200);
  fill(255, 0, 0);
  rect(150, 450, 50, 100);
  fill(0, 0, 255);
  rect(400, 450, 50, 100);

  int contadorBolinhasVermelhas = 0;
  int contadorBolinhasAzuis = 0;

  for (int i = 0; i < numBolas; i++) {
    fill(cores[i]);
    ellipse(posX[i], posY[i], diametro, diametro);

    if (cores[i] == color(255, 0, 0)) {
      if (posX[i] > 150 && posX[i] < 200 && posY[i] > 450 && posY[i] < 550) {
        contadorBolinhasVermelhas++;
      }
    } else {
      if (posX[i] > 400 && posX[i] < 450 && posY[i] > 450 && posY[i] < 550) {
        contadorBolinhasAzuis++;
      }
    }
  }

  if (contadorBolinhasVermelhas == 5 && contadorBolinhasAzuis == 5) {
    if (!ganhou) {
      println("Parabéns! Você ganhou!");
      ganhou = true; // Definindo que o jogo foi ganho
    }
  }
}

void mousePressed() {
  for (int i = 0; i < numBolas; i++) {
    float distancia = dist(mouseX, mouseY, posX[i], posY[i]);
    if (distancia < diametro / 2) {
      bolaArrastada = i; 
      break; 
    }
  }
}

void mouseDragged() {
  if (bolaArrastada != -1) {
    posX[bolaArrastada] = mouseX;
    posY[bolaArrastada] = mouseY;
  }
}

void mouseReleased() {
  bolaArrastada = -1;
}
