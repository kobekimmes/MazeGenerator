
class Board {
  
  Cell[][] cells;
  int w;
  int h;
  int res;
  
  
  public Board(int res, int w, int h) {
    this.res = res;
    this.w = w;
    this.h = h;
    
    this.cells = new Cell[this.w / this.res][this.h / this.res];
    for (int i = 0; i < cells.length; i++) {
      for (int j =0; j < cells[i].length; j++) {
        cells[i][j] = new Cell(i, j, res);
      }
    } 
  }
  
  public boolean[] checkNeighbors(Cell cell) {
    int[] xDir = new int[] {0, 1, 0, -1};
    int[] yDir = new int[] {1, 0, -1, 0};
    
    boolean[] states = new boolean[] {false, false, false, false};
    
    for (int k = 0; k < 4; k++) {
      if ((cell.x + xDir[k] < this.cells.length) && (cell.y + yDir[k] < this.cells.length) && cells[cell.x + xDir[k]][cell.y + yDir[k]].visited) {
        states[k] = true;
      }
    }
    return states;
  }
  
  public void drawBoard() {
    for (Cell[] cells : this.cells) {
      for (Cell cell : cells) {
        cell.drawCell(this.res);
      }
    } 
  }
  
}
