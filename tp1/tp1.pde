PImage cafe;
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
String s = "Club Penguin se desarrolló y se inició el 10 de octubre de 2003 cuando Lance Priebe y Lane Merrifield, empleados de New Horizons Productions (que se convirtió en New Horizon Interactive en 2003), vieron la necesidad de crear redes sociales para los niños, por lo que se decidió fundar Club Penguin en la búsqueda de algo que tenga algunos componentes sociales, pero seguro, y no solo comercializado como seguro para sus propios hijos. Merrifield y Priebe se acercaron al empleado David Krysko con la idea de crear una empresa derivada para desarrollar el nuevo producto.";
void setup() {
  size(1280, 720);
  textSize(40);
  fill(0, 0, 0);
  isPlaying = true;
  imageNum = 1;
  y = height;
  textAlign(CENTER);
  timeVideo = 0;
  logo = loadImage("logo.png");
  opcion = loadImage("opcion.jpg");
  botonSi = loadImage("si.png");
  botonNo = loadImage("no.png");
}

void draw() {
  cafe = loadImage("herbert ("+imageNum+").jpg");
  up = frameCount/2;
  background(cafe);
  timeVideo++;
  /*image(opcion, 0, 0);
   image(logo, 0, y, 300, 300);*/
  
  if (imageNum == 501 && isPlaying) {
    background(opcion);
    image(botonSi, 430, 370);
    image(botonNo, 670, 370);
    if ((mouseX < 640 && mouseX > 430 && mouseY >350 && mouseY < 480)||(mouseX < 870 && mouseX > 670 && mouseY >350 && mouseY < 480)) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
  }
  if (/*timeVideo%2==0 &&*/ imageNum <= 500) {
    imageNum++;
  }
  if (timeVideo >= 130) {
    text(s, 130, y, 500, 900);
    y=y-4;
    if (y > height) {
      y = 0;
    }
  }
}

void mouseClicked() {
  cursor(ARROW);
  if (mouseX < 640 && mouseX > 430 && mouseY >350 && mouseY < 480) {
    setup();
  }
  if (mouseX < 870 && mouseX > 670 && mouseY >350 && mouseY < 480) {
    isPlaying = false;
    imageNum = 501;
    background(cafe);
  }
}
