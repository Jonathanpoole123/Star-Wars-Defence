//Jonathan Poole
//mode variables
int mode;
final int INTRO = 0;
final int MAPSELECT = 1;
final int GAME = 2;
final int BUILD = 3;
final int GAMEOVER = 4;


//tower types
final int GUN = 1;
final int AOE = 2;
final int SNIPER = 3;
final int BEAM = 4;
//font
PFont Hintown;

//background images
PImage deathStar, rebelBase, space;

//colors
color lGreen = #b9fbc0;
color lBlue1= #98f5e1;
color lBlue2 = #8eecf5;
color mBlue1 = #90dbf4;
color mBlue2 = #a3c4f3;
color purple = #cfbaf0;
color pink = #f1c0e8;
color peach = #ffcfd2;
color lpeach= #fde4cf;
color lyellow = #fbf8cc;
color white = 255;
color black = 0;
color grey = #AAAAAA;
color red = #ff0000;
color dred = #8E3636;

boolean mouseReleased;
boolean wasPressed;
boolean building = false;

//buttons
Button start, GameoverButton, buildButton, mapButton1, mapButton2, nextWave, nextWave2, playButton, towerGun, towerAOE, towerSniper, towerBeam;

int bkg;

//gifs
Gif introGif;
PImage Map1, Map2;
//objects
Node[] nodes;
AoE_ring ringshoot;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  //map pic
  Map1 = loadImage("Map1.png");
  Map2 = loadImage("Map2.png");
  //background picks
  deathStar = loadImage("Deathstar.jpg");
  space = loadImage("space.png");
  rebelBase = loadImage("Rebel.png");
  //font
  Hintown = createFont("Berliner_Wand.ttf", 200);
  initializeModes();
  initializeVariables();
  makeButtons();

  mode = INTRO;
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  introGif = new Gif("IntroGif/frame_", "_delay-0.03s.gif", 40, 2, 500, 400, width, height);
  //Load Fonts

  //Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  ringshoot = new AoE_ring(0, 0);
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", 750, 650, 100, 100, purple, white);

  //PLAY - Next Wave, To Build Mode
  nextWave = new Button("NEXT WAVE", 850, 75, 300, 100, purple, white);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  towerGun = new Button("BLASTER", 775, 335, 100, 100, mBlue2, white);
  towerAOE = new Button("LIGHTSABER", 925, 335, 100, 100, mBlue2, white);
  towerSniper = new Button("DEATH STAR", 775, 450, 100, 100, mBlue2, white);
  towerBeam = new Button("Beam", 925, 450, 100, 100, mBlue2, white);
  buildButton = new Button("BUILD", 850, 225, 300, 100, pink, white);
  playButton = new Button("PLAY", 850, 225, 300, 100, pink, white);
  mapButton1 = new Button( "", 300, 300, 300, 300, lBlue1, white);
  mapButton2 = new Button( "", 700, 300, 300, 300, lBlue2, white);
  //GAMEOVER - Reset
  GameoverButton = new Button("AGAIN?", 700, 700, 100, 100, dred, white);
}

void makeNodes() {
  //Plot the nodes on the map

  if (mapButton1.clicked) {
    nodes = new Node[11];
    //Map 1
    nodes [0] = new Node(200, height/2, 0, -2);
    nodes [1] = new Node(200, 200, 2, 0);
    nodes [2] = new Node(300, 200, 0, 2);
    nodes [3] = new Node(300, 600, 2, 0);
    nodes [4] = new Node(500, 600, 0, -2);
    nodes [5] = new Node(500, height/2, 2, 0);
    nodes [6] = new Node(600, height/2, 0, 2);
    nodes [7] = new Node(600, 500, -2, 0);
    nodes [8] = new Node(400, 200, 2, 2);
    nodes [9] = new Node(550, 350, 2, 0);
    nodes [10] = new Node(400, 500, 0, -2);
  } else if (mapButton2.clicked) {
    //Map 2
    nodes = new Node[7];

    nodes [0] = new Node(200, height/2, 0, 2);
    nodes [1]= new Node( 200, 600, 1, 1);
    nodes [2]= new Node( 350, 750, 0, -2);
    nodes [3]= new Node( 350, 300, 2, 0);
    nodes [4]= new Node (500, 300, 0, 2);
    nodes [5]= new Node (500, height/2, 2, 0);
    nodes [6]= new Node (1000, height/2, 2, 0);
  }
}

void draw() {
  click();
  makeNodes();
  if (mode == INTRO) {
    intro();
  } else if (mode == MAPSELECT) {
    MapSelect();
  } else if (mode == GAME) {
    game();
  } else if (mode == BUILD) {
    Build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
  textFont(Hintown);
  textSize(20);
  text(mouseX + "," + mouseY, mouseX, mouseY-20);
}
