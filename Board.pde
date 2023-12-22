import java.util.Arrays;

class Board {
  
  Cell[][] cells;
  int w;
  int h;
  int rows;
  int cols;
  int res;
  Cell current;
  ArrayList<Cell> moves;
  
  
  public Board(int res, int w, int h) {
    this.res = res;
    this.w = w;
    this.h = h;
    
    this.rows = this.w / this.res;
    this.cols = this.h / this.res;
    
    this.cells = new Cell[this.rows][this.cols];
    for (int i = 0; i < cells.length; i++) {
      for (int j =0; j < cells[i].length; j++) {
        cells[i][j] = new Cell(i, j, res);
      }
    } 
    
    this.current = this.cells[(int) random(rows)][(int) random(cols)];
    this.moves = new ArrayList<>();
  }
  
  public void update() {
    
    this.current.highlight(this.res);
    
    Cell nextCell = getNext(this.current);
    
    if (nextCell != null) {
      
      this.moves.add(this.current);
      
      nextCell.visited = true;
      
      this.removeWall(nextCell, this.current);
      
      this.current = nextCell;
      
    }
    else if (this.moves.size() != 0) {
      Cell prevCell = this.moves.remove(this.moves.size() - 1);
      
      this.current = prevCell;
      
    }
  }
  
  public Cell[] checkNeighbors(Cell cell) {
    int[] xDir = new int[] {-1, 0, 1, 0};
    int[] yDir = new int[] {0, 1, 0, -1};
    
    Cell[] neighbors = new Cell[4]; //top, right, bottom, left for visited cells
    
    for (int k = 0; k < 4; k++) {
      if ((cell.x + xDir[k] < this.cells.length) && (cell.y + yDir[k] < this.cells.length) && (cell.x + xDir[k] > -1) && (cell.y + yDir[k] > -1) && !cells[cell.x + xDir[k]][cell.y + yDir[k]].visited) {
        neighbors[k] = this.cells[cell.x + xDir[k]][cell.y + yDir[k]];
      }
    }
    return neighbors;
  }
  
  
  
  public void drawBoard() {
    for (Cell[] cells : this.cells) {
      for (Cell cell : cells) {
        cell.drawCell(this.res);
      }
    } 
  }
  
  
  public Cell getNext(Cell cell) {
    int k = 0;
    int[][] available = new int[4][2];
    Cell[] neighbors = this.checkNeighbors(cell);
    for (int i = 0; i < neighbors.length; i++) {
      if (neighbors[i] != null) {
        if (i == 0 && cell.x - 1 > -1) {
          available[k][0] = -1;
          available[k][1] = 0;
          k++;
        }
        else if (i == 1 && cell.y + 1 < this.h / this.res) {
          available[k][0] = 0;
          available[k][1] = 1;
          k++;
        }
        else if (i == 2 && cell.x + 1 < this.w / this.res) {
          available[k][0] = 1;
          available[k][1] = 0;
          k++;
        }
        else if (cell.y - 1 > -1) {
          available[k][0] = 0;
          available[k][1] = -1;
          k++;
        }
      }
    }
    if (k == 0) {
      return null;
    }
    int[] move = available[(int) random(k)];
    return this.cells[this.current.x + move[0]][this.current.y + move[1]];
  }
  
  
  
  public void removeWall(Cell a, Cell b) {
    int x = b.x - a.x;
    if (x == 1) {
      b.borders[3] = false;
      a.borders[1] = false;
    }
    else if (x == -1) {
      b.borders[1] = false;
      a.borders[3] = false;
    }
    
    int y = b.y - a.y;
    if (y == 1) {
      b.borders[0] = false;
      a.borders[2] = false;
    }
    else if (y == -1) {
      b.borders[2] = false;
      a.borders[0] = false;
    }
  }

}
