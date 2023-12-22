int width = 800;
int height = 800;

void setup() {
  size(800, 800);
 
  
}


void draw() {
  background(255);
  myBoard.drawBoard();
  myBoard.update();
  
  //frameRate(60);
  
}


Board myBoard = new Board(20, width, height);
