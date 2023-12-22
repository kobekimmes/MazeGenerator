
class Cell {
  
  int x;
  int y;
  int size;
  boolean visited;
  boolean[] borders;
  
  public Cell(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.visited = false;
    this.borders = new boolean[]{true, true, true, true};
  }
  
  
  public void drawCell(int offset) {
    for (int i = 0; i < this.borders.length; i++) {
      if (this.borders[i]) {
        if (i == 0) {
          line(offset * this.x, offset * this.y, offset * (this.x + this.size) , offset * this.y);
        }
        else if (i == 1) {
          line(offset * this.x, offset * this.y, offset * this.x, offset * (this.y + this.size));
        }
        else if (i == 2) {
          line(offset * (this.x + this.size), offset * this.y, offset * (this.x+this.size), offset * (this.y + this.size));
        }
        else {
          line(offset * this.x, offset * (this.y + this.size), offset * (this.x + this.size), offset * (this.y + this.size));
        }
      } 
    }
  }
} 
