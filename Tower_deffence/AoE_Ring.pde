class AoE_ring {
  float x, y;


  AoE_ring(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(red);
    circle(x, y, 200);
  }


  void act() {
    int i = 0;
    while (i < mobs.size()) {
      Mob myMob = mobs.get(i);
      if (dist(myMob.x, myMob.y, x, y) < 100 + myMob.d/2) {
        myMob.hp--;
      }
      i++;
    }
  }
}
