void MapSelect() {
  space.resize(1000, 800);
  background(space);
  handlebuttonclicks();
  //map1 pic
  Map1.resize(306, 306);
  image(Map1, 300, 300);
  //map2 pic
  Map2.resize(306, 306);
  image(Map2, 700, 300);
  fill(white);
  text("DEATHSTAR", 300, 500);
  text("REBEL BASE", 700, 500);
}

void handlebuttonclicks() {
  mapButton1.show();
  if (mapButton1.clicked) {
    mode = GAME;
  }
  mapButton2.show();
  if (mapButton2.clicked) {
    mode = GAME;
  }
}
