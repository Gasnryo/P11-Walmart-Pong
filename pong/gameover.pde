void gameover() {

  introtheme.rewind();
  clap.play();
  if (lscore > rscore) {
    background(pink);
    fill(0, 255, 255);
    text("LEFT PLAYER WINS", width/2, height/2);
    paktc();
    fill(yellow, alpha1);
    textSize(75);
    text("Click Anywhere To Restart", width/2, height*0.8);
  } else if (lscore < rscore) {
    background(green);
    fill(0, 255, 255);
    text("RIGHT PLAYER WINS", width/2, height/2);
    
    paktc();
    fill(yellow, alpha1);
    textSize(75);
    text("Click Anywhere To Restart", width/2, height*0.8);
  } else {
   fill(white);
   text("CONGRATULATIONS, I DON'T KNOW HOW BUT YOU BROKE MY GAME. THANKS A LOT", width/2, height/2);
  }
}

void gameoverClicks() {
  alpha1 = 400;
  mode=0;
}

void gameoverKBP() {
}

void gameoverKBR() {
}
