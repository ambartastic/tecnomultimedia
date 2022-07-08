void escenario() {
  for (int fila = 0; fila < cantFilas; fila++) {
    for (int columna = 0; columna < cantColumnas; columna++) {
      if (tablero[columna][fila] == 1) {
        fill(0);
      } else if (tablero[columna][fila] == 4) {
        fill(200, 0, 150);
      } else if (tablero[columna][fila] == 8 || tablero[columna][fila] == 10) {
        fill(20, 0, 150);
      } else if (tablero[columna][fila] == 0) {
        fill(255);
      } else if (tablero[columna][fila] == 2) {
        fill(123);
      }
      rect(columna * ancho, fila * alto, ancho, alto);
    }
  }
  int cantTargets = targets.length;
  for (int fila = 0; fila < cantTargets; fila++) {
    if (tablero[targets[fila][0]][targets[fila][1]] == 0) {
      tablero[targets[fila][0]][targets[fila][1]] = target;
    }
  }
  int cantBoxes = boxes.length;
  for (int fila = 0; fila < cantBoxes; fila++) {
    tablero[boxes[fila][0]][boxes[fila][1]] = box;
  }
  // tablero[posX][posY] = 8;
}
void keyPressed() {
  if (key == 'x' || key == 'X') {
    show = "paused";
    return;
  }
  int posXBefore = posX;
  int posYBefore = posY;
  if (keyCode == LEFT) {
    if (posX == 0) {
      // posX = cantColumnas;
      return;
    } 
    if (tablero[posX-1][posY] == empty || tablero[posX-1][posY] == target )
      posX--;
    else if (posX-2 >= 0/* && tablero[posX-1][posY] != wall && tablero[posX-2][posY] != wall*/  && (tablero[posX-1][posY] == box && tablero[posX-2][posY] == empty || tablero[posX-2][posY] == target)) {
      posX--;
      moveBox( keyCode );
    }
  }

  if (keyCode == RIGHT) {
    if (posX == cantColumnas-1) {
      // posX = -1 ;
      return;
    }
    if (tablero[posX+1][posY] == empty  || tablero[posX+1][posY] == target ) {
      posX++;
    } else if (posX+2 < cantColumnas  && tablero[posX+1][posY] == box && (tablero[posX+2][posY] == empty || tablero[posX+2][posY] == target )) {
      posX++;
      moveBox( keyCode );
      ;
    }
  }
  if (keyCode == UP) {
    if (posY == 0) {
      // posY = cantColumnas;
      return;
    }
    if (tablero[posX][posY-1] == empty || tablero[posX][posY-1] == target) {
      posY--;
    } else if (posY-2 >= 0 && tablero[posX][posY-1] == box && (tablero[posX][posY-2] == empty || tablero[posX][posY-2] == target)) {
      posY--;
      moveBox( keyCode );
    }
  }
  if (keyCode == DOWN) {
    if (posY == cantColumnas-1) {
      // posY = -1;
      return;
    }
    if (tablero[posX][posY+1] == empty || tablero[posX][posY+1] == target) {
      posY++;
    } else if (posY+2 < cantColumnas && tablero[posX][posY+1] == box && (tablero[posX][posY+2] == target || tablero[posX][posY+2] == empty)) {
      posY++;
      moveBox( keyCode );
    }
  }

  int currentValue = tablero[posX][posY];

  if (posX != posXBefore || posY != posYBefore) {
    //  se movio
    currentValue = currentValue == box || currentValue == box + target ? currentValue - box : currentValue;
    int beforeValue = tablero[posXBefore][posYBefore];
    tablero[posXBefore][posYBefore] = beforeValue - player ;
    tablero[posX][posY] = player + currentValue;
  }
  if (levelEnd() ) {
    currentLevel++;
    if (currentLevel < 3) {
      nextLevel();
    } else {
      show = "gameover";
    }
  }
}

void moveBox(int keyCode) {
  int newPosX = posX;
  int newPosY = posY;

  if (keyCode == RIGHT) {
    newPosX = posX+1;
  } else if (keyCode == LEFT) {
    newPosX = posX-1;
  } else if (keyCode == UP) {
    newPosY = posY-1;
  } else if (keyCode == DOWN) {
    newPosY = posY+1;
  }

  tablero[newPosX][newPosY] = box;


  int cantBoxes = boxes.length;
  for (int fila = 0; fila < cantBoxes; fila++) {
    if (boxes[fila][0] == posX && boxes[fila][1] == posY) {
      boxes[fila][0] = newPosX;
      boxes[fila][1] = newPosY;
    }
  }
}
boolean levelEnd() {
  int matches = 0;
  int cantTargets = targets.length;
  int cantBoxes = boxes.length;
  for (int i = 0; i < cantTargets; i++) {
    for (int j = 0; j < cantBoxes; j++) {
      if (targets[i][0] == boxes[j][0] && targets[i][1] == boxes[j][1]) {
        matches++;
      }
    }
  }
  return (matches == cantTargets);
}

void nextLevel() {
  tablero = new int[cantFilas][cantColumnas];

  //nivel 1

  if (currentLevel == 0) {

    targets = new int[4][2];
    targets[0][0]= 3;
    targets[0][1]= 1;
    targets[1][0]= 1;
    targets[1][1]= 4;
    targets[2][0]= 6;
    targets[2][1]= 3;
    targets[3][0]= 4;
    targets[3][1]= 6;

    boxes = new int[4][2];
    boxes[0][0]= 2;
    boxes[0][1]= 4;
    boxes[1][0]= 3;
    boxes[1][1]= 2;
    boxes[2][0]= 4;
    boxes[2][1]= 5;
    boxes[3][0]= 5;
    boxes[3][1]= 3;

    tablero[2][0] = wall;
    tablero[2][1] = wall;
    tablero[2][2] = wall;
    tablero[2][3] = wall;
    tablero[1][3] = wall;
    tablero[0][3] = wall;
    tablero[0][4] = wall;
    tablero[0][5] = wall;
    tablero[1][5] = wall;
    tablero[2][5] = wall;
    tablero[3][5] = wall;
    tablero[3][6] = wall;
    tablero[3][7] = wall;
    tablero[4][7] = wall;
    tablero[5][7] = wall;
    tablero[5][6] = wall;
    tablero[5][5] = wall;
    tablero[5][4] = wall;
    tablero[6][4] = wall;
    tablero[7][4] = wall;
    tablero[7][3] = wall;
    tablero[7][2] = wall;
    tablero[6][2] = wall;
    tablero[5][2] = wall;
    tablero[4][2] = wall;
    tablero[4][1] = wall;
    tablero[4][0] = wall;
    tablero[3][0] = wall;


    tablero[2][4] = empty;
    tablero[3][2] = empty;
    tablero[5][3] = empty;
    tablero[4][5] = empty;
    posX = 4;
    posY = 4;
    tablero[posX][posY] = player;
  } 

  //nivel 2

  else if (currentLevel == 1) {
    targets = new int[3][2];
    targets[0][0]= 7;
    targets[0][1]= 3;
    targets[1][0]= 7;
    targets[1][1]= 4;
    targets[2][0]= 7;
    targets[2][1]= 5;

    boxes = new int[3][2];
    boxes[0][0]= 2;
    boxes[0][1]= 2;
    boxes[1][0]= 2;
    boxes[1][1]= 3;
    boxes[2][0]= 3;
    boxes[2][1]= 3;


    tablero[0][0] = wall;
    tablero[0][1] = wall;
    tablero[0][2] = wall;
    tablero[0][3] = wall;
    tablero[0][4] = wall;
    tablero[1][4] = wall;
    tablero[2][4] = wall;
    tablero[2][5] = wall;
    tablero[1][5] = wall;
    tablero[1][6] = wall;
    tablero[1][7] = wall;
    tablero[1][8] = wall;
    tablero[2][8] = wall;
    tablero[2][8] = wall;
    tablero[3][8] = wall;
    tablero[4][8] = wall;
    tablero[5][8] = wall;
    tablero[5][7] = wall;
    tablero[5][6] = wall;
    tablero[6][7] = wall;
    tablero[7][7] = wall;
    tablero[8][7] = wall;
    tablero[8][6] = wall;
    tablero[8][5] = wall;
    tablero[8][4] = wall;
    tablero[8][3] = wall;
    tablero[8][2] = wall;
    tablero[7][2] = wall;
    tablero[6][2] = wall;
    tablero[6][3] = wall;
    tablero[6][4] = wall;
    tablero[5][4] = wall;
    tablero[4][4] = wall;
    tablero[4][3] = wall;
    tablero[4][2] = wall;
    tablero[4][1] = wall;
    tablero[4][0] = wall;
    tablero[3][0] = wall;
    tablero[2][0] = wall;
    tablero[1][0] = wall;


    posX = 3;
    posY = 2;
    tablero[posX][posY] = player;
  } 

  //nivel 3

  else if (currentLevel == 2) {
    targets = new int[5][2];
    targets[0][0]= 1;
    targets[0][1]= 5;
    targets[1][0]= 1;
    targets[1][1]= 6;
    targets[2][0]= 2;
    targets[2][1]= 6;
    targets[3][0]= 3;
    targets[3][1]= 6;
    targets[4][0]= 4;
    targets[4][1]= 6;

    boxes = new int[5][2];
    boxes[0][0]= 3;
    boxes[0][1]= 2;
    boxes[1][0]= 2;
    boxes[1][1]= 3;
    boxes[2][0]= 3;
    boxes[2][1]= 4;
    boxes[3][0]= 2;
    boxes[3][1]= 5;
    boxes[4][0]= 3;
    boxes[4][1]= 6;

    tablero[3][0] = wall;
    tablero[4][0] = wall;
    tablero[1][1] = wall;
    tablero[0][1] = wall;
    tablero[0][2] = wall;
    tablero[0][3] = wall;
    tablero[0][4] = wall;
    tablero[0][5] = wall;
    tablero[0][6] = wall;
    tablero[0][7] = wall;
    tablero[1][7] = wall;
    tablero[2][7] = wall;
    tablero[3][7] = wall;
    tablero[4][7] = wall;
    tablero[5][7] = wall;
    tablero[5][6] = wall;
    tablero[5][5] = wall;
    tablero[5][4] = wall;
    tablero[5][3] = wall;
    tablero[2][0] = wall;
    tablero[1][0] = wall;
    tablero[4][1] = wall;
    tablero[4][2] = wall;
    tablero[4][3] = wall;
    tablero[1][3] = wall;
    tablero[1][4] = wall;

    posX = 2;
    posY = 2;
    tablero[posX][posY] = player;
  }
}
// void isElementAtPosition(int element, int posX, int posY) {
//   if (element == 0) {
//     return tablero[posX][posY] == 0;
//   }
//   return tablero[posX][posY] & element == element;
// }

/*
void playing(element,posX,posY){
 element =tablero[columna][fila]; 
 if(element == 0){
 return posX;
 
 }
 }
 */
