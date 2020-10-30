void score() {
  ballx = width/2;
  bally = height/2;
  timer = 100;
  ballvx = random(-5, 5);
  ballvy = random(-5, 5);
}

void paktc() {
  //fill(255, 255, 0, alpha1);
  //textSize(75);
  //text(x, width/2, height*0.8);
  
  if (alpha1 > 255) {
    fadeOut = true;
  } else if (alpha1 < 0) {
    fadeOut = false;
  }
  
  if (fadeOut == true) {
    alpha1 = alpha1-3;
  } else if (fadeOut == false) {
    alpha1 = alpha1 + 3;
  }
}

void tactileCircle (float x, float y, float r) {
  if (dist(x,y,mouseX,mouseY) < r) { 
    stroke(tac);
  } else {
    stroke(0);
  }
}

void tacR (float x, float x2, float y, float y2) {
  if (mouseX > x && mouseX < x2 && mouseY > y && mouseY < y2) {
    stroke(tac);
  } else {
    stroke (0);
  }
}

void bgbuttoncolor(color a, float b, float c) {
 fill(a);
  stroke(black);
  strokeWeight(5);
  tacR(b-50, b+50, c-50, c+50); 
  if (bgdynamic == a) stroke(red);
 square(b, c, 100);
}

void buttonClick(float x, float y, color a) {
  if (mouseX > x-50 && mouseX < x+50 && mouseY > y-50 && mouseY < y+50) {
    bgdynamic = a;
  }
}

void controlSlider() {
  if (mouseX > width*0.45 && mouseX < width*0.75 && mouseY > height*0.8-50 && mouseY < height*0.8+50) {
    sliderX = mouseX;
  }
  
  balld = map(sliderX, width*0.45, width*0.75, 25, 200);
}
