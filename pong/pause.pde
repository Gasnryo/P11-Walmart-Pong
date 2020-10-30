void pause() {
  fill(blue);
  textSize(500);
  textAlign(CENTER, CENTER);
  text("PAUSED", width/2, height/2);
  
  println(alpha1, fadeOut);
  
  fill(yellow, alpha1);
  textSize(75);
  text("Press Space To Continue", width/2, height*0.8);
  
  wkey = false;
  skey = false;
  upkey = false;
  downkey = false;
  
  paktc();
}

void pauseClicks() {
}

void pauseKBP() {
  if (key == ' ' ) {
    mode = 1;
  }
}

void pauseKBR() {
}
