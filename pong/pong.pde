import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//pong project
//grayson lilly
//1-2

//mode framewrok
int mode;
final int INTRO       = 0;
final int GAME        = 1;
final int PAUSE       = 2;
final int GAMEOVER    = 3;

//Entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld, ballvx, ballvy; //ball
float paddlespeed;

//keyboard variables
boolean wkey, skey, upkey, downkey, AI;


//colors
color lightpurple = #BF9A82; //ball color
color black       = #000000; //used instead of 0
color white       = #FFFFFF; //used instead of 255
color pink        = #FF0F53; //PADDLE COLOR
color green       = #558A67; //PADDLE COLOR
color blue        = #007DC6; //ONLY FOR TEXT
color yellow      = #FFC220; //ONLY FOR TEXT WILL BREAK PROGRAM IF USED FOR BG 
color tac         = #FFD767; //tactile stroke only
color red         = #FF0000; //stroke only

//background colors
color brown       = #45201E; //Default BG color
color cyan        = #00636B; //used for background
color purple      = #510077;
color darkgreen   = #007F0E;
color sludge      = #7F6A00;
color darkred     = #4A0000;

//dynamic colors
color bgdynamic;
color aibutton;
color twoplayerbutton;

//paddle colors
color leftpaddle;
color rightpaddle;
boolean leftpink;

//text alpha
float alpha1;

//SCOREEEEEEEEEEEEEEEEE
int lscore, rscore, timer;

//Intro/Options
boolean fadeOut;
float sliderX;

//Images
PImage walmart;
PImage gear;

//Font
PFont wmfont;

//Sound
Minim minim;
AudioPlayer lpaddle, rpaddle, introtheme, wall, score, clap;

void setup() {
  fullScreen();
  mode = 0;

  
  walmart = loadImage("walmart.png");
  gear = loadImage("gear.png");


  wmfont = createFont("MPB.ttf", 100);

  //==========
  AI = false;
  //==========

  //init intro & options
  alpha1 = -400;
  bgdynamic = brown;
  sliderX = width*0.6;
  aibutton = blue;
  twoplayerbutton = red;

  //init score
  lscore = rscore = 0;
  timer = 100;

  //initialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  rightx = width;
  righty = height/2;
  rightd = 200;
  paddlespeed = 6;
  leftpaddle = pink;
  rightpaddle = green;
  leftpink = true;

  //initialize ball
  ballx = width/2;
  bally = height/2;
  //balld = 100;
  balld = map(sliderX, width*0.45, width*0.75, 25, 200);
  ballvx = random(-5, 5);
  ballvy = random(-5, 5);
  fadeOut = false;

  //init keyboard vars
  wkey = skey = upkey = downkey = false;


  //minim
  minim = new Minim(this);
  lpaddle = minim.loadFile("leftpaddle.wav");
  rpaddle = minim.loadFile("rightpaddle.wav");
  introtheme = minim.loadFile("intro.wav");
  wall = minim.loadFile("wall.wav");
  score = minim.loadFile("score.wav");
  clap = minim.loadFile("clapping.wav");
}

void draw() {
  if (mode == 0) {
    intro();
  } else if (mode == 1) {
    game();
  } else if (mode == 2) {
    pause();
  } else if (mode == 3) {
    gameover();
  } else if (mode == 4) {
    options();
  } else {
    println("Grayson, you messed up the programming again. Nice job genius! MODE = " +mode);
  }
}
