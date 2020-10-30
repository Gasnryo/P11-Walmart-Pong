void mousePressed() {
  if (mode == 0) {
    introClicks();
  } else if (mode == 1) {
    gameClicks();
  } else if (mode == 2) {
    pauseClicks();
  } else if (mode == 3) {
    gameoverClicks();
  } else if (mode == 4) {
   optionsClicks(); 
  }
}

void mouseDragged() {
  if (mode == 0) {
    //introDragged();
  } else if (mode == 1) {
    //gameDragged();
  } else if (mode == 2) {
    //pauseDragged();
  } else if (mode == 3) {
    //gameoverDragged();
  } else if (mode == 4) {
   optionsDragged(); 
  }
}
