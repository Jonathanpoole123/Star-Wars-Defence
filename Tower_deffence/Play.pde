int Wave;
int Money = 20000;
int lives = 5;
int m = 0;
boolean enemy;
int i = 0;
void game() {
  //draw maps
  if (mapButton1.clicked) {
    drawMap();
  }
  if (mapButton2.clicked) {
    drawMap2();
  }
  animateThings();
  handleButtonClicks();
  //wave text
  fill(white);
  textSize(50);
  stroke(red);
  text("Wave:" + Wave, 850, 150);
  text("lives:" + lives, 350, 50);
  text("$" +  Money, 125, 50);
  if (lives == 0) {
    mode = GAMEOVER;
  }
}
void animateThings() {
 //mob stuff
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    stroke(black);
    myMob.act();
    myMob.show();
    myMob.healthbar();
    if (myMob.hp <= 0) {
      mobs.remove(i);
      Money = Money + 7;
    } else {
      i++;
    }
  }
//tower stuff
  i = 0;
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    if (mobs.size() > 0) myTower.act();
    myTower.show();
    i++;
  }

//bullet stuff

  i = 0;
  while (i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();

    if (myBullet.hp <= 0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
  //layering stuff
  stroke(black);
  fill(black);
  strokeWeight(5);
  rect(850, 400, 300, height);
}

//maps

void drawMap() {
  deathStar.resize(800, 800);
  image(deathStar, 350, 400);
  stroke(dred);
  strokeWeight(20);
  line(0, height/2, 200, height/2);
  line(200, height/2, 200, 200);
  line(200, 200, 300, 200);
  line(300, 200, 300, 600);
  line(300, 600, 500, 600);
  line(500, 600, 500, height/2);
  line(500, height/2, 600, height/2);
  line(600, height/2, 600, 500);
  line(600, 500, 400, 500);
  line(400, 500, 400, 200);
  line(400, 200, 550, 350);
  line(550, 350, 1000, 350);
  stroke(black);
  fill(black);
  strokeWeight(5);
  rect(850, 400, 300, height);
}

void drawMap2() {
  rebelBase.resize(1000, 800);
  background(rebelBase);
  stroke(lGreen);
  strokeWeight(20);
  line(0, height/2, 200, height/2);
  line(200, height/2, 200, 500);
  line(200, 500, 200, 600);
  line(200, 600, 350, 750);
  line(350, 750, 350, 300);
  line(350, 300, 500, 300);
  line(500, 300, 500, height/2);
  line(500, height/2, 1000, height/2);
  stroke(black);
  fill(black);
  strokeWeight(5);
  rect(850, 400, 300, height);
}

void handleButtonClicks() {

  nextWave.show();
  Wavestuff();
  buildButton.show();
  if (buildButton.clicked && bullets.size() == 0 && mobs.size() == 0) {
    mode = BUILD;
  }
}

void Wavestuff() {
  if (mobs.size() == 0) {
    enemy = false;
    i = 0;
    if (nextWave.clicked && mobs.size() == 0) {
      enemy = true;
      m++;
      Wave++;
    }
    while (enemy == true && i < m ) {
      mobs.add(new Mob(0 - 50*i, height/2, 2, 0));
      i++;
    }

    if (nextWave.clicked && Wave % 4 == 0) {
      i = 0;
      while ( i < Wave/3) {
        mobs.add(new chunkMob(0-20*i, height/2, 2, 0));
        i++;
      }
    }
    if (nextWave.clicked && Wave % 5 == 0) {
      i = 0;
      while ( i < Wave/5) {
        mobs.add(new speedMob(0-10*i, height/2, 2, 0));
        i++;
      }
    }
  }
}
