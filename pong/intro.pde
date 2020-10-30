void intro() {
  introtheme.play();
  background(bgdynamic);
  imageMode(CENTER);
  image(walmart, width/2, height*0.3);
  textFont(wmfont);
  textAlign(CENTER);
  fill(blue);
  textSize(150);
  text("PONG", width/2, height*0.55);

  //Start Text
  fill(yellow, alpha1);
  textSize(75);
  text("Press Space To Start", width/2, height*0.8);
  paktc();

  noFill();

  tactileCircle(width*0.9, height*0.9, 65);
  strokeWeight(3);
  circle(width*0.9, height*0.9, 130);
  imageMode(CENTER);
  image(gear, width*0.9, height*0.9, 130, 130);
  //gear(gear);
  
  lefty = height/2;
  righty = height/2;
  
  //fix bug
  wkey = false;
  skey = false;
  upkey = false;
  downkey = false;
}

void introClicks() {
  //Options button
  if (dist(width*0.9, height*0.9, mouseX, mouseY) < 65 ) {
    mode = 4;
  }
}

void introKBP() {
  if (key == ' ' ) {
    lscore = 0;
    rscore = 0;
    mode = 1;
  }
}

void introKBR() {
}
