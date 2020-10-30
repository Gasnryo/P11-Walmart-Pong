void game() {
  introtheme.pause();
  introtheme.rewind();
  clap.rewind();
  
  background(bgdynamic);

  //Fix those slow velocities because nobody has time for them and they're annoying
  if (timer > 0) {
    if (ballvx > 0 && ballvx < 1.5 || ballvx < 0 && ballvx > -1.5 || ballvy > 0 && ballvy < 1.5 || ballvy < 0 && ballvy > -1.5 ) {
      ballvx = random(-5, 5);
      ballvy = random(-5, 5);
    }
  }

  //Scoreboard
  textSize(50);
  fill(pink);
  text(lscore, width/4, height*0.15);
  fill(green);
  text(rscore, 3*width/4, height*0.15);
  //text(timer, 3*width/4, height/2); //display timer text
  if (timer > -50) {
  timer--;
  }

  //scoring
  if (ballx < 0+balld/2) {
    rscore++;
    score();
    score.rewind();
    score.play();
    if (rscore == 5) mode = GAMEOVER;
  } else if (ballx > width-balld/2) {
    lscore++;
    score();
    score.rewind();
    score.play();
    if (lscore == 5) mode = GAMEOVER;
  }

  //line
  strokeWeight(5);
  stroke(white);
  line(width/2, 0, width/2, height);

  //draw paddles via artistic talent
  fill(leftpaddle);
  circle(leftx, lefty, leftd);
  fill(rightpaddle);
  circle(rightx, righty, rightd);
  println(AI);
  //move paddles because they're too lazy to move themselves
  if (wkey     == true && lefty > leftd/2) lefty         = lefty  - paddlespeed;
  if (skey     == true && lefty < height-leftd/2) lefty  = lefty  + paddlespeed;

  if (AI == false) {
    if (upkey    == true && righty  > rightd/2) righty        = righty - paddlespeed;
    if (downkey  == true && righty  < height-rightd/2) righty = righty + paddlespeed;
  } else {
    //righty = bally;
    if (righty > bally) {
     righty = righty - 5;
    } else if (righty < bally) {
     righty = righty + 5; 
    }
  }

  //ball
  fill(lightpurple);
  circle(ballx, bally, balld);

  //move ball becayse its mildly overweight and it needs my help to move
  if (timer < 0) {
    ballx = ballx + ballvx;
    bally = bally + ballvy;
  }

  //bouncing
  if (bally <= balld/2 || bally >= height-balld/2) {
    wall.rewind();
    wall.play();
    ballvy=ballvy*-1;
  }

  //left bounce
  if (dist (leftx, lefty, ballx, bally) <= leftd/2 + balld/2) {
    lpaddle.rewind();
    lpaddle.play();
    ballvx = (ballx - leftx)/8;
    ballvy = (bally - lefty)/8;
  }

  //right bounce
  if (dist (rightx, righty, ballx, bally) <= rightd/2 + balld/2) {
    rpaddle.rewind();
    rpaddle.play();
    ballvx = (ballx - rightx)/8;
    ballvy = (bally - righty)/8;
  }
}

void gameClicks() {
}

void gameKBP() {
  if (key == ' ' ) {
    fill (150, 100);
    noStroke();
    rectMode(CORNER);
    rect (0, 0, width, height);
    rectMode(CENTER);
    alpha1 = 400;
    mode = 2;
  }

  if (key == 'w' || key == 'W') wkey     = true;
  if (key == 's' || key == 'S') skey     = true;
  if (keyCode == UP)            upkey    = true;
  if (keyCode == DOWN)          downkey  = true;
}

void gameKBR() {
  if (key == 'w' || key == 'W') wkey     = false;
  if (key == 's' || key == 'S') skey     = false;
  if (keyCode == UP)            upkey    = false;
  if (keyCode == DOWN)          downkey  = false;
}
