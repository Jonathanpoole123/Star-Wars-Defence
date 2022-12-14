class Button {
  //instance variables
  int x, y, w, h; // x in center
  boolean clicked;
  color highlight, normal;
  String text;
  PImage Img;
  //constructor
  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    this(_x, _y, _w, _h, norm, high);
    text = t;
  }

  //constructor 2
  Button(PImage _Img, int _x, int _y, int _w, int _h, color norm, color high ) {
    this(_x, _y, _w, _h, norm, high);
    Img = _Img;
  }

  Button(int _x, int _y, int _w, int _h, color norm, color high ) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    highlight = high;
    normal = norm;
    clicked = false;
  }

  //Behaviour functions

  void show() {
    drawRect();
    drawLabel();
    checkForClick();
  }

  boolean touchingMouse() {
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      return true;
    } else {
      return false;
    }
  }
  void checkForClick() {

    if (mouseReleased && touchingMouse()) {
      clicked = true;
    } else {
      clicked = false;
    }
  }

  void drawRect() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    if (touchingMouse()) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);
  }
  void drawLabel() {
    textAlign(CENTER, CENTER);
    if (touchingMouse()) {
      fill(normal);
    } else {
      fill(highlight);
    }
    if (Img == null) {
      textSize(w/4);
      text(text, x, y);
    } else {
      image(Img, x- 50, y-50, w*0.9, h*0.9);
    }
  }
}
