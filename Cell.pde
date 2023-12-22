
class Cell {

  int x;
  int y;
  int size;
  boolean visited;
  boolean[] borders;
  boolean highlight;

  public Cell(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.visited = false;
    this.borders = new boolean[]{true, true, true, true}; //top, right, bottom, left
  }


  public void drawCell(int offset) {
    if (this.visited) {
      noStroke();
      fill(255, 0, 0);
      rect(offset * this.x, offset * this.y, offset, offset);
    }
    else {
      noStroke();
      fill(255);
      rect(offset * this.x, offset * this.y, offset, offset);
    }
    stroke(0);
    strokeWeight(5);
    if (this.borders[0]) { //top
      line(offset * this.x, offset * this.y, (offset * this.x) + this.size, offset * this.y);
    } 
    if (this.borders[1]) { //right
      line((offset * this.x) + this.size, offset * this.y, (offset * this.x) + this.size, (offset * this.y) + this.size);
    } 
    if (this.borders[2]) { //bottom
      line(offset * this.x, (offset * this.y) + this.size, (offset * this.x) + this.size, (offset * this.y) + this.size);
    } 
    if (this.borders[3]) { //left
      line(offset * this.x, offset * this.y, offset * this.x, (offset * this.y) + this.size);
    }
  }
  
  public void highlight(int offset) {
      noStroke();
      fill(0, 255, 0);
      rect((offset * this.x) + 1, (offset * this.y) + 1, offset - 1, offset - 1);
    
  }
  
}
