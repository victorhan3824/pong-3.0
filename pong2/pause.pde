void pause() {
  pausing();
  noStroke();
  
  float x = width/2;
  float y = height/8;
  
  fill(gray); //triangle
  triangle(x-height/72,y-height/72,x+height/72,y,x-height/72,y+height/72);
  
  fill(lightBlue); //the text
  textSize(height/5);
  text("PAUSED",width/2,height/2);
}

void pauseClick() {
  if (mouseX > width/2-height/24 && mouseX < width/2+height/24 && mouseY > height/8-height/12 && mouseY < height/8+height/24) {
    mode = GAME;  
    theme.play();
  }
}
