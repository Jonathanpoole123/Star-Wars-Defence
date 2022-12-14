
void intro() {
  introGif.show();
  start.show();
  if (start.clicked) {
    mode = MAPSELECT;
  }
  textSize(100);
  fill(white);
  text("STAR WARS DEFENCE", 500, 300);
}
