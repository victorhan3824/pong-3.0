void intro() {
  theme.play();
  
  background(orange);
  fill(white);
  textSize(logoSize);
  
  if (logoSize >= height/3) logoExpansionVariable = -1;
  if (logoSize <= height/4) logoExpansionVariable = 1;
  logoSize = logoSize + logoExpansionVariable*height/700;
  
  text("P-O-N-G",width/2,height/3);
  //other stuff begins here ======================================================================================================================
  buttons();
  fill(black);
  textSize(0.025*width);
  text("SOLO",0.375*width,0.666*height);
  text("DUEL",0.625*width,0.666*height);
  
  //go to options menu
  toggleOptions();
}

void introClick() {
  //SOLO mode ====================================================================================================================================
  if (mouseX > 0.375*width-0.09375*width && mouseX < 0.46875*width && mouseY > 0.666*height-0.0625*height && mouseY < 0.7285*height) {
    mode = GAME;  
    AI = true;
  }
  //DUEL mode ====================================================================================================================================
  if (mouseX > 0.625*width-0.09375*width && mouseX < (0.625+0.09375)*width && mouseY > (0.666-0.0625)*height && mouseY < (0.666+0.0625)*height) {
    mode = GAME;
    AI = false;
  }
  //OPTIONS mode =================================================================================================================================
  if (mouseX > width/20 && mouseX < width/20+width*0.06 && mouseY > width/20 && mouseY < width/20+width*0.06) {
    mode = OPTIONS; 
  } 
}

void buttons() {
  strokeWeight(3);
  stroke(black);
  
  if (mouseX > 0.375*width-0.09375*width && mouseX < 0.46875*width && mouseY > 0.666*height-0.0625*height && mouseY < 0.7285*height) {
    fill(red);
  } else {
    fill(white);
  }
  rect(0.375*width,0.666*height,0.1875*width,0.125*height);
  
  if (mouseX > 0.625*width-0.09375*width && mouseX < (0.625+0.09375)*width && mouseY > (0.666-0.0625)*height && mouseY < (0.666+0.0625)*height) {
    fill(red);
  } else {
    fill(white);
  }  
  rect(0.625*width,0.666*height,0.1875*width,0.125*height);
}
