class Gif {
  //Gif(String before, String after, int numFrames, int speed, int x, int y)
  //Gif(String before, String after, int numFrames, int speed, int x, int y, int w, int h)
  int x, y, w, h;
  int numFrames, speed;
  String before, after;
  PImage[] gif;
  int f = 0;

  Gif( String before_, String after_, int numF, int sped, int x_, int y_) {
    x = x_;
    y = y_;
    before = before_;
    after = after_;
    numFrames = numF;
    speed = sped;
    loadGif();
    w = gif[0].width;
    h = gif[0].height;
  }

  Gif(String before_, String after_, int numF, int sped, int x_, int y_, int w_, int h_) {
    x = x_;
    y = y_;
    before = before_;
    after = after_;
    numFrames = numF;
    speed = sped;
    w = w_;
    h = h_;
    loadGif();
  }

  void loadGif() {
    //gif
    gif = new PImage [numFrames];

    int i = 0;
    while (i < numFrames) {
      gif[i] = loadImage( before +i+ after);

      i++;
    }
  }

  void show() {
    image(gif[f], x, y, w, h);
    if (frameCount % speed == 0) f = f + 1;
    if (f == numFrames) f = 0;
  }

  void show2() {
    image(gif[f], x, y, 200, 200);
    if (frameCount % speed == 0) f = f + 1;
    if (f == numFrames) f = 0;
  }
}
