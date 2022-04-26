//aflqv
///bgmrw
////chnsx
/////djoty
//////ekpuz

void gameover() {
  theme.pause();
  win.play();
  textSize(0.3571428571428571*height);

  if (redScore == 3) {
    fill(pink);
    text("RED\nWIN!",width/2,height/2);
  }
  if (blueScore == 3) {
    fill(lightBlue);
    text("BLUE\nWIN!",width/2,height/2);
  }
  
  textSize(height/35);
  fill(white);
  text("Click to continue",width/2,height/35);
}

void gameoverClick() {
  mode = INTRO;
  theme.rewind();
  if (blueScore > redScore) {
    blueScore = -1;
    redScore = 0;
  } else {
    redScore = -1;
    blueScore = 0;
  }
}
