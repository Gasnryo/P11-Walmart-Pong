void options() {
  background(bgdynamic);
  textSize(150);
  fill(yellow);
  textAlign(CENTER, CENTER);
  text("Options", width/2, height*0.15);
  fill(blue);
  textSize(70);
  text("Background", width*0.2, height*0.3);
  rectMode(CENTER);

  //Gear/Intro button
  tactileCircle(width*0.9, height*0.9, 65);
  noFill();
  strokeWeight(3);
  circle(width*0.9, height*0.9, 130);
  imageMode(CENTER);
  image(gear, width*0.9, height*0.9, 130, 130);

  //Background Buttons
  bgbuttoncolor(cyan, width*0.13, height*0.4);
  bgbuttoncolor(brown, width*0.2, height*0.4);
  bgbuttoncolor(purple, width*0.27, height*0.4);
  bgbuttoncolor(darkgreen, width*0.13, height*0.51);
  bgbuttoncolor(sludge, width*0.2, height*0.51);
  bgbuttoncolor(darkred, width*0.27, height*0.51);

  //Player Colors
  fill(blue);
  textSize(70);
  stroke(black);
  text("Player Colors", width*0.2, height*0.65);
  tacR(width*0.2-200, width*0.2+200, height*0.8-100, height*0.8+100);
  rect(width*0.2, height*0.8, 400, 200);
  fill(rightpaddle);
  stroke(white);
  strokeWeight(2);
  arc(width*0.2+200, height*0.8, 200, 200, radians(90), radians(270));
  fill(leftpaddle);
  arc(width*0.2-200, height*0.8, 200, 200, radians(270), radians(450));
  fill(lightpurple);
  stroke(white);
  circle(width*0.2, height*0.8, 50);

  //Ball Diamater Slider
  fill(blue);
  text("Ball Size", width*0.6, height*0.3);
  fill(yellow);
  stroke(yellow);
  strokeWeight(10);
  line(width*0.45, height*0.8, width*0.75, height*0.8);
  strokeWeight(6);
  fill(blue);
  tactileCircle(sliderX, height*0.8, 25);
  circle(sliderX, height*0.8, 50);

  //Ball Example
  fill(lightpurple);
  stroke(white);
  strokeWeight(5);
  circle(width*0.6, height*0.5, balld);
  
  //AI on/off
  fill(blue);
  text("Players", width*0.85, height*0.3);
  tacR(width*0.85-100, width*0.85+100, height*0.45-50, height*0.45+50);
  if (AI == true) stroke(red);
  fill(blue);
  rect(width*0.85, height*0.45, 200, 100);
  fill(black);
  text("One", width*0.85, height*0.45);
  
  fill(blue);
  tacR(width*0.85-100, width*0.85+100, height*0.65-50, height*0.65+50);
  if(AI == false) stroke(red);
  rect(width*0.85, height*0.65, 200, 100);
  fill(black);
  text("Two", width*0.85, height*0.65);
  
  if (AI == true) {
   aibutton = red;
   twoplayerbutton = blue;
  } else {
   aibutton = blue;
   twoplayerbutton = red;
  }
  

  

  if (leftpink == true) {
    leftpaddle = pink;
    rightpaddle = green;
  } else if (leftpink == false) {
    leftpaddle = green;
    rightpaddle = pink;
  }
}

void optionsClicks() {
  
  //AI buttons
  if (mouseX > width*0.85-100 && mouseX < width*0.85+100 && mouseY > height*0.45-50 && mouseY < height*0.45+50) {
   AI = true; 
  } else if (mouseX > width*0.85-100 && mouseX < width*0.85+100 && mouseY > height*0.65-50 && mouseY < height*0.65+50) {
   AI = false; 
  }
  

  //background buttons
  buttonClick(width*0.13, height*0.4, cyan);
  buttonClick(width*0.2, height*0.4, brown);
  buttonClick(width*0.27, height*0.4, purple);

  buttonClick(width*0.13, height*0.51, darkgreen);
  buttonClick(width*0.2, height*0.51, sludge);
  buttonClick(width*0.27, height*0.51, darkred);



  if (mouseX > width*0.2-200 && mouseX < width*0.2+200 && mouseY > height*0.8-100 && mouseY < height*0.8+100) {
    if (leftpink == true) {
      leftpink = false;
    } else {
      leftpink = true;
    }
  }
  controlSlider();

  //gear/intro button
  if (dist(width*0.9, height*0.9, mouseX, mouseY) < 65 ) {
    alpha1 = -400;
    mode = 0;
  }
}

void optionsDragged() {
  controlSlider();
}

void optionsKBP() {
}

void optionsKBR() {
}
