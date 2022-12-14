class Mob {

  float x, y, vx, vy, d, hp, speed;
  int numMobs, maxhp, fillcolor, strokecolor;

  Mob (float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    hp = 8;
    maxhp = 8;
    speed = 1;
    fillcolor = grey;
    strokecolor = grey;
  }

  void show() {
    fill(fillcolor);
    stroke(black);
    strokeWeight(4);
    circle(x, y, d);
  }

  void act() {
    x = x + vx*speed;
    y = y + vy*speed;

    int i = 0;
    while (i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < speed) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }


    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        hp = hp - 3;

        myBullet.hp--;
      }
      i++;
    }
    if (x > height || y > height|| y < 0) {
      hp--;
      if (hp==0) lives--;
    }
  }
  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);//background
    fill(white);
    rect(x-25, y-(d+10), 50, 20);
    fill(pink);
    rect(x-25, y-(d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }
}
