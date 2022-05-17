PImage cafe;
int timeVideo;
int up;
int y;
int imageNum;
PFont tipografia;
String s = "Club Penguin se desarrolló y se inició el 10 de octubre de 2003 cuando Lance Priebe y Lane Merrifield, empleados de New Horizons Productions (que se convirtió en New Horizon Interactive en 2003), vieron la necesidad de crear redes sociales para los niños, por lo que se decidió fundar Club Penguin en la búsqueda de algo que tenga algunos componentes sociales, pero seguro, y no solo comercializado como seguro para sus propios hijos. Merrifield y Priebe se acercaron al empleado David Krysko con la idea de crear una empresa derivada para desarrollar el nuevo producto.";
void setup() {
  size(1280, 720);
  textSize(40);
  imageNum = 1;
  y = height;
  textAlign(CENTER);
  timeVideo = 0;
}

void draw() {
  cafe = loadImage("gerbert ("+imageNum+").jpg");
  up = frameCount/2;
  background(cafe);

  timeVideo++;

  if (imageNum >= 300) {
    imageNum = 1;
  }
  if (timeVideo%3==0) {
    imageNum++;
  }
  if (timeVideo >= 450) {
    text(s, 130, y, 500, 900);
    y=y-3;
    if (y > height) {
      y = 0;
    }
  }
}
