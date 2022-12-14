class Tower {

  final int PLACING = 0;
  final int PLACED = 1;


  float x, y, d;
  int cooldown, threshold;
  int towerMode;
  int towerType;

  Tower(float _x, float _y, int c, int th, int _towerType ) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    towerMode = PLACING;
    towerType = _towerType;
  }

  void show() {
    if (towerType == GUN) {
      Gunshow();
    } else if (towerType == AOE) {
      AOEshow();
    } else if (towerType == SNIPER) {
      Snipershow();
    } else if (towerType == BEAM) {
      Beamshow();
    }
  }

  void act() {
    if (towerType == GUN) {
      Gunact();
    } else if (towerType == AOE) {
      AOEact();
    } else if (towerType == SNIPER) {
      Sniperact();
    } else if (towerType == BEAM) {
      Beamact();
    }
  }


  void Gunshow() {
    stroke(black);
    strokeWeight(4);
    fill(lyellow);
    if (towerMode == PLACED) {
      square(x, y, 40);
    } else if (towerMode == PLACING) {
      building = true;
      square(mouseX, mouseY, 45);

      if (mousePressed && mouseX > 0 && mouseX < 700) {
        towerMode = PLACED;
        building = false;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void AOEshow() {
    stroke(black);
    strokeWeight(4);
    fill(purple);
    if (towerMode == PLACED) {
      circle(x, y, 30);
    } else if (towerMode == PLACING) {
      building = true;
      circle(mouseX, mouseY, 35);
      if (mousePressed && mouseX > 0 && mouseX < 700) {
        towerMode = PLACED;
        x = mouseX;
        y = mouseY;
        building = false;
      }
    }
  }

  void Snipershow() {
    stroke(black);
    strokeWeight(4);
    fill(purple);
    if (towerMode == PLACED) {
      triangle(x, y-10, x+10, y+40, x+40, y);
    } else if (towerMode == PLACING) {
      building = true;
      triangle(mouseX, mouseY-10, mouseX+10, mouseY+40, mouseX+40, mouseY);
      if (mousePressed && mouseX > 0 && mouseX < 700) {
        towerMode = PLACED;
        x = mouseX;
        y = mouseY;
        building = false;
      }
    }
  }

  void Beamshow() {
    stroke(black);
    strokeWeight(4);
    fill(purple);
    if (towerMode == PLACED) {
      triangle(x, y-10, x+10, y+70, x+50, y);
    } else if (towerMode == PLACING) {
      building = true;
      triangle(mouseX, mouseY-10, mouseX+10, mouseY+70, mouseX+50, mouseY);
      if (mousePressed && mouseX > 0 && mouseX < 700) {
        towerMode = PLACED;
        x = mouseX;
        y = mouseY;
        building = false;
      }
    }
  }

  void Gunact() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      bullets.add(new Bullet(x, y, 0, -10));//up
      bullets.add(new Bullet(x, y, 0, 10));//down
      bullets.add(new Bullet(x, y, -10, 0));//left
      bullets.add(new Bullet(x, y, 10, 0));//right
    }
  }
  void AOEact() {
    cooldown++;
    if (cooldown < threshold && mobs.size() > 0) {
      ringshoot.x = x;
      ringshoot.y = y;
      ringshoot.act();
      ringshoot.show();
    }
    if (cooldown > 30) {
      cooldown = 0;
    }
  }
  void Sniperact() {
    cooldown++;
    if (cooldown >= threshold && mobs.size() > 0) {
      Mob myMob = mobs.get(0);
      myMob.hp = myMob.hp - 5000;
      stroke(red);
      strokeWeight(50);
      line(myMob.x, myMob.y, x, y);
    }
    if (cooldown >= 150) {
      cooldown = 0;
    }
  }


  void Beamact() {
    cooldown++;
    if (cooldown >= threshold && mobs.size() > 0) {
      Mob myMob = mobs.get(0);
      myMob.hp = myMob.hp - 0.05;
      stroke(red);
      strokeWeight(7);
      line(myMob.x, myMob.y, x+10, y+70);
    }
    if (cooldown > 80) {
      cooldown = 0;
    }
  }
}
