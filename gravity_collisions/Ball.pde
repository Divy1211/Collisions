class Ball {
   float x,y,dx,dy;
   float r,g,b,t;
  Ball(float tempX,float tempY) {
    x = tempX;
    y = tempY;
    r = random(100,255);
    g = random(100,255);
    b = random(100,255);
    t = random(100,255);
    dx = random(-10,10);
    dy = 0;
  }
  void display() {
    fill(r,g,b,t);
    ellipse(x,y,50,50);
  }
  void move() {
  if(x > width)
    dx = -Math.abs(dx);
  else if(x < 0)
    dx = Math.abs(dx);
  if(y > height)
    dy = -Math.abs(dy);
  else if(y < 0)
    dy = Math.abs(dy);
  else
    dy+=0.5;
  x+=dx;
  y+=dy;
  }
  boolean overlaps(Ball pass) {
    if(dist(this.x,this.y,pass.x,pass.y) <= 50)
      return true;
    return false;
  }
  void collide(Ball pass) {
    if(this.overlaps(pass)) {
      float c1 = ((this.dx-pass.dx)*(this.x-pass.x)+(this.dy-pass.dy)*(this.y-pass.y))/((this.x-pass.x)*(this.x-pass.x)+(this.y-pass.y)*(this.y-pass.y));
      float c2 = ((pass.dx-this.dx)*(pass.x-this.x)+(pass.dy-this.dy)*(pass.y-this.y))/((pass.x-this.x)*(pass.x-this.x)+(pass.y-this.y)*(pass.y-this.y));
      this.dx = this.dx-c1*(this.x-pass.x);
      this.dy = this.dy-c1*(this.y-pass.y);
      pass.dx = pass.dx-c2*(pass.x-this.x);
      pass.dy = pass.dy-c2*(pass.y-this.y);
      this.x+=this.dx;
      this.y+=this.dy;
      pass.x+=pass.dx;
      pass.y+=pass.dy;      
    }
  }
}
