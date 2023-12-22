

void setup() {
  size(400, 400);
 
  
}


void draw() {
  background(255);
  myBoard.drawBoard();
  
}


Board myBoard = new Board(25, 400, 400);
