void setup() {
  size(700, 700);
  background(0);
}
int num = 0, nump;
Ball b[] = new Ball[100];
void draw() {
  background(0);
  int c = 0;
  while (c < 100) {
    if (!(b[c] == null) && c < nump) {
      b[c].display();
      b[c].move();
    }
    int c2 = c+1;
    while (c2 < nump) {
     if (!(b[c2] == null))
        b[c].collide(b[c2]);
      c2++;
    }
    c++;
  }
}

void mousePressed() {
  Ball temp = new Ball(0, 0);
  if (nump == 100)
    temp = b[num];
  b[num] = new Ball(mouseX, mouseY);
  int c = 0;
  while (c < num) {
    if (b[num].overlaps(b[c])) {
      if (nump == 100)
        b[num] = temp;
      else
        b[num] = null;
      return;
    }
    c++;
  }
  num++;
  if (nump != 100)
    nump = num;
  if (num >= 100) {
    num = 0;
    nump = 100;
  }
}
