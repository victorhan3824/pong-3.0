void game() {
  background(brown);
  strokeWeight(3);
  stroke(white);
  line(width/2,0,width/2,height);
  
  //paddles =======================================================
  fill(red);
  circle(redX,redY,pD);
  fill(blue);
  circle(blueX,blueY,pD);
  
  //pausing ======================================================
  pausing();
  noStroke();
  fill(gray);
  square(width/2,height/8,height/36);
  
  //move paddles and ball =========================================
  if (timer < 0) {
    if (wKey == true && redY >= 0) redY = redY - height/120;
    if (sKey == true && redY <= height) redY = redY + height/120;
    
    if (AI == false) { //check should AI be involved depending on gamemode
      if (upKey == true && blueY >= 0) blueY = blueY - height/120;
      if (downKey == true && blueY <= height) blueY = blueY + height/120;
    } else { //AI code
      /*
      if the ball is on the right side() {
        if ball is above te right paddle, move up
        if ball is below the right paddle, move down
      }
      */
      if (ballX >= width*0.4) {
        if (ballY < blueY) blueY = blueY - height/120;
        if (ballY > blueY) blueY = blueY + height/120;
      }
    }
    
    ballX = ballX + vx; 
    ballY = ballY + vy;
    }
  
  bounceAway();
  scoreDetermine();
  display();
  //gameover ========================================================
  if (redScore == 3 || blueScore == 3) {
    mode = GAMEOVER;
    //reset the winner sound
    win.rewind();
  }
}

void gameClick() {
  if (mouseX > width/2-height/24 && mouseX < width/2+height/24 && mouseY > height/8-height/12 && mouseY < height/8+height/24) {
    mode = PAUSE;  
    theme.pause();
  }
}

//custom functions when mode = GAME =======================

void display() {
  //ball display ==========================================
  fill(pink);
  stroke(white);
  circle(ballX, ballY, bD);
  //display score board ===================================
  textSize(28);
  fill(red);
  text("Score: " + redScore, width/4,height/12);
  fill(blue);
  text("Score: " + blueScore, width*0.75,height/12);
  timer = timer - 1; //timing control
}

void bounceAway() {
  //check collision and ball bouncing away from the paddle=
  if (dist(redX,redY,ballX,ballY) <= pD/2 + bD/2) { //===
    vx = (ballX - redX)/10;
    vy = (ballY - redY)/10;
    bump.rewind();
    bump.play();
  }
   if (dist(blueX,blueY,ballX,ballY) <= pD/2 + bD/2) { //==
    vx = (ballX - blueX)/10;
    vy = (ballY - blueY)/10;
    bump.rewind();
    bump.play();
  }
  //bounce off the walls ==================================
  if (ballY < bD/2 || ballY > height-bD/2 ) {
    bounce.rewind();
    bounce.play();
    vy = vy * -1;
  }
}

void scoreDetermine() {
  //determining scoring ===================================
  if (ballX <= -bD) {
    goal.rewind();
    goal.play();
    
    blueScore = blueScore + 1;
    timer = 50; 
    if (blueScore < 3) roundReset();
  }  
  if (ballX >= width+bD) { //===================================
    goal.rewind();
    goal.play();
  
    redScore = redScore + 1;//
    timer = 50; //==============
    if (redScore < 3) roundReset();
  }
}

void roundReset() {
  ballX = width/2;
  ballY = height/2;
  
  //determine the direction and speed of the ball=
  float angle = random(-PI/4, PI/4);
  float leftRight = random(0, 1);
  if (leftRight > 0.5) {
    angle += PI; 
  }
  float hyp = 7;
  vx = cos(angle)*hyp;
  vy = sin(angle)*hyp;
  // =============================================
  
  redX = 0;
  redY = height/2;

  blueX = width;
  blueY = height/2;  
}
