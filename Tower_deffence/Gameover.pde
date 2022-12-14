void gameOver() {
  space.resize(1000, 800);
  background(space);
  fill(white);
  textSize(200);
  text("GAMEOVER", 500, 400);
  textSize(75);
  text("NICE TRY!", 500, 600);
  gameoverClicks();
}

void gameoverClicks() {
  GameoverButton.show();
  //reset varibles
  if (GameoverButton.clicked) {
    mode = INTRO;
    lives = 5;
    Wave = 0;
    Money = 400;
    int i = 0;
    m = 0;
    while ( i < mobs.size()) {
      mobs.remove(i);
      i++;
    }
    while ( i < bullets.size()) {
      bullets.remove(i);
      i++;
    }
    i = 0;
    while (i < towers.size()) {
      towers.remove(i);
      i++;
    }
  }
}
