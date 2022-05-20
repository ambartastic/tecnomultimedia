PImage bg;
PImage botonSi;
PImage botonNo;
PImage opcion;
PImage logo;
int timeVideo;
int up;
int y;
int imageNum;
PFont tipografia;
boolean isPlaying;
String text1 = "Club Penguin fue un videojuego multijugador en línea, implicando un mundo virtual que contenía una gran variedad de juegos y actividades, desarrollado por Club Penguin Entertainment (New Horizon Interactive). Utilizaba a los pequeños pingüinos como personajes principales del juego, donde podían caminar, hablar, jugar juegos y participar en actividades con otros jugadores en un mundo virtual basado en una isla antártica cubierta de nieve.";
String text2 = "Club Penguin se desarrolló y se inició el 10 de octubre de 2003 cuando Lance Priebe y Lane Merrifield, empleados de New Horizons Productions (que se convirtió en New Horizon Interactive en 2003), vieron la necesidad de crear redes sociales para los niños, por lo que se decidió fundar Club Penguin en la búsqueda de algo que tenga algunos componentes sociales, pero seguro, y no solo comercializado como seguro para sus propios hijos. Merrifield y Priebe se acercaron al empleado David Krysko con la idea de crear una empresa derivada para desarrollar el nuevo producto.";
String text3 = "Antes de empezar a trabajar en Club Penguin, Lance Priebe, en su tiempo libre desarrolló juegos basados en Flash-Web. Priebe lanzó en el 2000 Experimental Penguins, un juego muy similar a Club Penguin. Aunque los pingüinos estuvieron fuera de línea en 2001, fueron utilizados como inspiración para Penguin Chat, que fue liberado poco después de la eliminación de Experimental Penguins. Por lo tanto, cuando Priebe, Merrifield y Krysko decidieron seguir adelante con Club Penguin en 2003, Penguin Chat estaba en línea en el que se pudo basar parte del proceso de diseño. Año y medio después, fue lanzado Penguin Chat 3, una versión actualizada de este.";
String text4 = "El 31 de enero de 2017, Disney anunció que el juego en su versión para computadora y dispositivos móviles cerraría de forma definitiva el 29 de marzo de 2017" +
  "Nos gustaría agradecer a todos y cada uno de los miembros de la comunidad de Club Penguin su dedicación y apoyo al juego y a nuestro equipo a lo largo de estos años. Se lee en la página de información sobre el cierre. A partir de esa fecha, se lanzó un nuevo juego exclusivo para dispositivos móviles llamado Isla de Club Penguin, el cual terminó cerrando el 20 de diciembre de 2018.";
void setup() {
  size(1280, 720);
  tipografia = loadFont("MS-PGothic-40.vlw");
  textFont(tipografia, 32);
  textSize(40);
  fill(0, 0, 0);
  isPlaying = true;
  imageNum = 1;
  y = height;
  textAlign(RIGHT);
  timeVideo = 0;
  logo = loadImage("logo.png");
  opcion = loadImage("opcion.jpg");
  botonSi = loadImage("si.png");
  botonNo = loadImage("no.png");
}

void draw() {
  bg = loadImage("herbert ("+imageNum+").jpg");
  up = frameCount/2;
  background(bg);
  timeVideo++;
/*OPCION DE REINICIO*/
  if (imageNum == 501 && isPlaying) {
    background(opcion);
    image(botonSi, 430, 370);
    image(botonNo, 670, 370);
    /*CURSOR CAMBIO*/
    if ((mouseX < 640 && mouseX > 430 && mouseY >350 && mouseY < 480)||(mouseX < 870 && mouseX > 670 && mouseY >350 && mouseY < 480)) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }
  /*CONTADOR*/
  if (timeVideo%2==0 && imageNum <= 500) {
    imageNum++;
  }
  /*LOGO*/
  if (timeVideo >= 130) {
    image(logo, 100, y, width/2, height/2);
  }
  /*TEXTOS*/
  if (timeVideo >= 130) {
    text(text1, 130, y+500, 500, 900);
    text(text2, 130, y+1500, 500, 900);
    text(text2, 130, y+2500, 500, 900);
    text(text3, 130, y+3500, 500, 900);
    y=y-14;
    if (y > height) {
      y = 0;
    }
  }
 
}

void mouseClicked() {
  cursor(ARROW);
  /*BOTON SI*/
  if (mouseX < 640 && mouseX > 430 && mouseY >350 && mouseY < 480) {
    setup();
  }
  /*BOTON NO*/
  if (mouseX < 870 && mouseX > 670 && mouseY >350 && mouseY < 480) {
    isPlaying = false;
    imageNum = 501;;
  }
}
