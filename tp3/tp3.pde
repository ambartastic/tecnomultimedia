PImage inicio_soko;
PImage play_soko;
PImage game_over_soko;
PImage paused;
PImage credits;
PImage instructions;
int timeVideo;
int cantFilas = 9;
int cantColumnas = 9;
int ancho, alto;
int [][] tablero;
int [][] boxes;
int [][] targets;
int posX, posY;
int empty = 0;
int wall = 1;
int target = 2;
int box = 4;
int player = 8;
String show = "init";
int currentLevel = 0;
void setup() {
  size(550, 400);
  textSize(40);
  fill(0, 0, 0);
  textAlign(CENTER);
  timeVideo = 0;
  inicio_soko = loadImage("soko1.jpg");
  play_soko = loadImage("soko2.jpg");
  game_over_soko = loadImage("soko3.jpg");
  paused = loadImage("soko4.jpg");
  credits = loadImage("sokocredits.jpg");
  instructions = loadImage("sokoins.jpg");
  ancho = width/cantColumnas;
  alto = height/cantFilas;
  nextLevel();
}

void draw() {
  timeVideo++;

  if (show == "init") {
    background(inicio_soko);
    if (timeVideo >= 100) {
      background(play_soko);
      if ((mouseX < 170 && mouseX > 25 && mouseY >290 && mouseY < 330)||(mouseX < 350 && mouseX > 205 && mouseY >290 && mouseY < 330) ||(mouseX < 525 && mouseX > 380 && mouseY >290 && mouseY < 330)) {
        cursor(HAND);
      } else {
        cursor(ARROW);
      }
    }
  } else if (show == "play") {
    escenario();
  } else if (show  == "gameover") {
    background(game_over_soko);
  } else if (show  == "instructions") {
    background(instructions);
  } else if (show  == "credits") {
    background(credits);
  }else if (show  == "paused") {
    background(paused);
    if ((mouseX < 495 && mouseX > 310 && mouseY >270 && mouseY < 330) ||(mouseX < 245 && mouseX > 55 && mouseY >270 && mouseY < 330) || (mouseX < 60 && mouseX > 25 && mouseY >18 && mouseY < 50)) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }
  if (show == "instructions" || show == "credits" ) {
    if (mouseX < 60 && mouseX > 25 && mouseY >18 && mouseY < 50) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }
  
}


void mouseClicked() {
  // if ((mouseX < 240 && mouseX > 50 && mouseY >270 && mouseY < 330) || (mouseX < 500 && mouseX > 310 && mouseY >270 && mouseY < 330)) {
  // show = "play";
  //}
  // start game
  if (show == "init") {
    if (mouseX < 170 && mouseX > 25 && mouseY >290 && mouseY < 330) {
      cursor(ARROW);
      show = "play";
    }  //instrucciones
    else if (mouseX < 350 && mouseX > 205 && mouseY >290 && mouseY < 330) {
      show = "instructions";
    } else if (mouseX < 525 && mouseX > 380 && mouseY >290 && mouseY < 330) {
      show = "credits";
    }
  }
  // retroceder
  else if (show == "instructions" || show == "credits") {
    if (mouseX < 60 && mouseX > 25 && mouseY >18 && mouseY < 50) {
      show = "init";
    }
  }
  // regresar al juego despues de pausar
  else if(show == "paused"){
    if (mouseX < 60 && mouseX > 25 && mouseY >18 && mouseY < 50) {
      show = "play";
    }
    // adelantar nivel
    else if (mouseX < 495 && mouseX > 310 && mouseY >270 && mouseY < 330) {
      currentLevel++;
      nextLevel();
      show = "play";
    }
    else if (mouseX < 245 && mouseX > 55 && mouseY >270 && mouseY < 330) {
      nextLevel();
      show = "play";
    }
    
  }
}

