import gifAnimation.*;

import processing.sound.*;
boolean inMenu = true;
boolean quizCompleted = false; // Definindo quizCompleted como uma variável global

float buttonXRatio = 0.25; // Proporção da largura da tela para a posição X do botão
float buttonYRatio = 0.25; // Proporção da altura da tela para a posição Y do botão
float buttonWidthRatio = 0.5; // Proporção da largura da tela para a largura do botão
float buttonHeightRatio = 0.1; // Proporção da altura da tela para a altura do botão

color buttonColor; // Cor do botão
color hoverColor = color(255, 204, 0); // Cor do botão quando o mouse está sobre ele (amarelo)
color textColor = color(255); // Cor do texto (branco)
color backgroundColor = color(85, 193, 255); // Cor de fundo (azul claro)
color correctAnswerColor = color(0, 255, 0); // Cor para indicar uma resposta correta (verde mais intenso)
color wrongAnswerColor = color(255, 0, 0); // Cor para indicar uma resposta incorreta (vermelho)

String[][] questions = {
  {"Qual é o maior planeta do sistema solar?", "Marte", "Júpiter", "Vênus", "Júpiter"},
  {"Qual planeta é conhecido como 'Planeta Vermelho'?", "Vênus", "Júpiter", "Marte", "Marte"},
  {"Quantas luas tem a Terra?", "1", "2", "0", "1"},
  {"Qual é o planeta mais próximo do Sol?", "Vênus", "Mercúrio", "Marte", "Mercúrio"},
  {"Qual é o planeta mais frio do sistema solar?", "Urano", "Netuno", "Saturno", "Urano"}
};
String[][] descricao = {
  {"Localizado além das brilhantes e inebriantes órbitas visíveis a olho nu, \neste gigante gasoso impera silenciosamente sobre os confins distantes do nosso \nsistema solar. Sua vasta atmosfera, composta principalmente de hidrogênio e hélio, \noculta vastas tempestades que fazem de seus céus um espetáculo eterno de \nturbulência e grandiosidade. Com um impressionante número de luas, algumas \nmaiores que planetas inteiros, este colosso celestial mantém seu reinado \nmajestoso, desafiando as definições de magnitude e beleza cósmica."},
  {"Envolto em um véu de mistério e fascínio, este mundo solitário e árido tem\n sido objeto de admiração e exploração há séculos. Batizado em honra ao deus romano \nda guerra, sua superfície é tingida por tonalidades avermelhadas que evocam uma \npaisagem alienígena e desolada. Marcado por antigas crateras e vastos desertos, este \nplaneta é um testemunho silencioso da implacável \npassagem do tempo no vasto vazio do espaço."},
  {"Em um intrincado ballet cósmico, um planeta azulado é acompanhado por uma companheira \nsilenciosa que paira nos vastos céus estrelados. Embora discreta, esta lua é \numa testemunha leal dos acontecimentos na superfície do planeta, ecoando segredos \nantigos e futuros mistérios que aguardam a exploração humana."},
  {"Erguendo-se como um guardião ardente nas proximidades do sol, este pequeno planeta de \nrocha e metal é envolto em uma dança eterna em torno da estrela central de nosso\n sistema solar. Sujeito às maiores temperaturas de todos os mundos conhecidos, \nsua superfície é uma terra hostil e estéril, onde apenas as \nespaçonaves mais resistentes ousam aventurar-se."},
  {"Em um universo gélido e desolado, um dos planetas mais afastados do Sol reina como um \nsoberano das temperaturas congelantes. Este gigante gasoso, envolto \nem uma atmosfera de hidrogênio e hélio, mantém uma aura de mistério e \nfrieza enquanto orbita em seu trajeto solitário. \nSeus anéis escuros e suas luas geladas testemunham o domínio do \nfrio sobre este mundo distante, onde as temperaturas alcançam mínimos \ninimagináveis, desafiando a própria essência do calor e da vida."}
};

int totalQuestions = questions.length;
int currentQuestion = 0;
int score = 0;

// Matriz para armazenar as respostas selecionadas pelo usuário
int[] selectedAnswer = new int[totalQuestions];
SoundFile file;
Gif gif;

void setup() {
  fullScreen();
  textAlign(CENTER, CENTER);
  textSize(32);
  
  file = new SoundFile(this, "mine.mp3");
  file.loop();
  
  gif = new Gif(this, "terra1.gif");
  gif.play();
  
  gif.resize( gif.width , gif.height );
}

void draw() {
  if (inMenu) {
    displayMenu();
  } else if (!quizCompleted) {
    displayQuestion();
  } else {
    displayFeedback();
  }
  float gifHeight = gif.height;
  image(gif, 0, height - gifHeight*0.9);
}

void displayMenu() {
  background(backgroundColor);
  
  fill(textColor);
  textSize(width * 0.03);
  textAlign(CENTER);
  text("MENU", width/2, height * 0.2);
  
 
  // Botão de Iniciar Jogo
  float startButtonXPos = width * 0.25;
  float startButtonYPos = height * 0.5;
  float startButtonWidthSize = width * 0.5;
  float startButtonHeightSize = height * 0.1;
  
  if (mouseX > startButtonXPos && mouseX < startButtonXPos + startButtonWidthSize &&
      mouseY > startButtonYPos && mouseY < startButtonYPos + startButtonHeightSize) {
    buttonColor = hoverColor;
  } else {
    buttonColor = color(255, 153, 0);
  }
  
  fill(buttonColor);
  rect(startButtonXPos, startButtonYPos, startButtonWidthSize, startButtonHeightSize);
  fill(textColor);
  textAlign(CENTER, CENTER);
  text("Iniciar Jogo", startButtonXPos + startButtonWidthSize/2, startButtonYPos + startButtonHeightSize/2);
}

void displayQuestion() {
  background(backgroundColor);
  
  // Exibe a pergunta atual
  fill(textColor);
  textSize(width * 0.03); // Tamanho do texto proporcional ao tamanho da tela
  textAlign(CENTER);
  text(questions[currentQuestion][0], width/2, height * 0.2); // Posição proporcional ao tamanho da tela
  
   // Exibe a descrição da pergunta
  textSize(width * 0.015); // Reduz o tamanho da fonte para caber na tela
  text(descricao[currentQuestion][0], width/2, height * 0.7);
  
  
  // Exibe as opções de resposta como botões
  textSize(width * 0.02); // Tamanho do texto proporcional ao tamanho da tela
  for (int i = 0; i < 3; i++) {
    float buttonXPos = width * buttonXRatio;
    float buttonYPos = height * (buttonYRatio + i * (buttonHeightRatio + 0.02)); // Adiciona espaçamento entre os botões
    float buttonWidthSize = width * buttonWidthRatio;
    float buttonHeightSize = height * buttonHeightRatio;
    
    // Verifica se o mouse está sobre o botão
    if (mouseX > buttonXPos && mouseX < buttonXPos + buttonWidthSize &&
        mouseY > buttonYPos && mouseY < buttonYPos + buttonHeightSize) {
      buttonColor = hoverColor; // Muda a cor do botão se o mouse estiver sobre ele
    } else {
      buttonColor = color(255, 153, 0); // Cor padrão do botão (laranja)
    }
    
    // Desenha o botão
    fill(buttonColor);
    rect(buttonXPos, buttonYPos, buttonWidthSize, buttonHeightSize);
    
    // Adiciona texto dentro do botão
    fill(textColor);
    textAlign(CENTER, CENTER);
    text(questions[currentQuestion][i + 1], buttonXPos + buttonWidthSize/2, buttonYPos + buttonHeightSize/2);
  }
}

void displayFeedback() {
  background(backgroundColor);
  
  // Exibe o feedback
  fill(textColor);
  textSize(width * 0.03); // Tamanho do texto proporcional ao tamanho da tela
  textAlign(CENTER);
  text("Quiz Concluído!", width/2, height * 0.2);
  text("Você acertou " + score + " de " + totalQuestions + " perguntas.", width/2, height * 0.3);
  textSize(width * 0.017);
  text("creditos: \nLorenzo Nakayama Machado, Thomas Manussadjian Steinhausser \nPaulo Augusto Tesseroli Ribas de Oliveira, Kevyn Gabriel Gonçalves de Moraes \nPedro Henrique Hara Bialy", width/2, height * 0.76);
  
  
  // Exibe as respostas corretas e incorretas
  textSize(width * 0.02); // Tamanho do texto proporcional ao tamanho da tela
  for (int i = 0; i < totalQuestions; i++) {
    String correctAnswer = questions[i][4];
    String userAnswer = questions[i][selectedAnswer[i]];
    String feedback = "Pergunta " + (i+1) + ": " + correctAnswer;
    
    if (userAnswer.equals(correctAnswer)) {
      fill(correctAnswerColor); // Resposta correta em verde
    } else {
      fill(wrongAnswerColor); // Resposta errada em vermelho
    }
    
    text(feedback, width/2, height * (0.4 + i * 0.05));
  }
}

void mousePressed() {
  if (inMenu) {
    // Verifica se o mouse está sobre os botões do menu
    
    float startButtonXPos = width * 0.25;
    float startButtonYPos = height * 0.5;
    float startButtonWidthSize = width * 0.5;
    float startButtonHeightSize = height * 0.1;
    
    if (mouseX > startButtonXPos && mouseX < startButtonXPos + startButtonWidthSize &&
        mouseY > startButtonYPos && mouseY < startButtonYPos + startButtonHeightSize) {
      inMenu = false; // Começa o jogo
    }
  } else {
    // Adicione aqui o código mousePressed() original do jogo
    if (!quizCompleted) {
      // Verifica se o mouse está dentro do botão quando clicado
      for (int i = 0; i < 3; i++) {
        float buttonXPos = width * buttonXRatio;
        float buttonYPos = height * (buttonYRatio + i * (buttonHeightRatio + 0.02)); // Adiciona espaçamento entre os botões
        float buttonWidthSize = width * buttonWidthRatio;
        float buttonHeightSize = height * buttonHeightRatio;
        
        if (mouseX > buttonXPos && mouseX < buttonXPos + buttonWidthSize &&
            mouseY > buttonYPos && mouseY < buttonYPos + buttonHeightSize) {
          // Se o mouse estiver dentro do botão, registra a resposta do usuário
          selectedAnswer[currentQuestion] = i + 1;
          
          // Verifica se a resposta está correta
          if (questions[currentQuestion][i + 1].equals(questions[currentQuestion][4])) {
            score++;
            println("Resposta correta!");
          } else {
            println("Resposta incorreta.");
          }
          
          // Passa para a próxima pergunta ou finaliza o quiz
          currentQuestion++;
          if (currentQuestion >= totalQuestions) {
            quizCompleted = true;
          }
          break; // Sai do loop após encontrar o botão clicado
        }
      }
    }
  }
}
