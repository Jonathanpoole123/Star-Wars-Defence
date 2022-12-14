void Build() {
  if (mapButton1.clicked) {
    drawMap();
  }
  if (mapButton2.clicked) {
    drawMap2();
  }

  animateThings();
  //buttons
  towerGun.show();
  towerAOE.show();
  towerBeam.show();
  towerSniper.show();
  
  //UI
  fill(white);
  textSize(70);
  text("BUILD MODE", 450, 100);
  textSize(50);
  text("$" +  Money, 125, 50);
  handleBuildClicks();
}

void handleBuildClicks() {
  playButton.show();
  if (playButton.clicked) {
    mode = GAME;
  }
  
  //towers
  if (towerGun.clicked && Money >= 150 && building == false) {
    towers.add(new Tower(0, 0, 0, 30, GUN));
    Money = Money - 150;
  }

  if (towerAOE.clicked && Money >= 250 && building == false) {
    towers.add(new Tower(0, 0, 0, 3, AOE));
    Money = Money - 250;
  }

  if (towerSniper.clicked && Money >= 300 && building == false) {
    towers.add(new Tower(0, 0, 0, 150, SNIPER));
    Money = Money - 300;
  }
  if (towerBeam.clicked && Money >= 400 && building == false) {
    towers.add(new Tower(0, 0, 0, 0, BEAM));
    Money = Money - 400;
  }
}
