int cant = 10;
int tamX, tamY;
PImage photo;
void setup(){
  size(400, 400);
  tamX = width/cant;
  tamY = height/cant;
  photo = loadImage("ilusion.jpg");
}

void draw(){
  image(photo, 0, 0);
  for(int i=1; i<cant; i++){
    for(int j=1; j<cant; j++){
      float distancia = dist(i*tamX, j*tamY, mouseX, mouseY);
      float miColor = map(distancia, 0, 100, 250, 100);
      fill(miColor, 0, 0);
      circle(i*tamX, j*tamY, 20);
    }
  }
}
