void options() {
  background(orange);
  
  //go back home ===============================================================================================
  toggleOptions();
  
  //select difficulty
  fill(white);
  textSize(0.04*width);
  text("Difficulty:",width/4,200);
  
  difficultyButton(width/2,"Normal");
  difficultyButton(width*0.75,"Difficult");
}

void optionsClick() {
  //go back to intro mode ======================================================================================
  if (mouseX > width/20 && mouseX < width/20+width*0.06 && mouseY > width/20 && mouseY < width/20+width*0.06) {
    mode = INTRO; 
  } 
  
  //select difficulty ==========================================================================================
  //normie mode
  if (mouseX > width/2-0.09375*width && mouseX < width/2+0.09375*width && mouseY > 200-0.0625*height && mouseY < 200+0.0625*height) {
    difficulty = 0;  
  } 
  //hard mode 
  if (mouseX > width*0.75-0.09375*width && mouseX < width*0.75+0.09375*width && mouseY > 200-0.0625*height && mouseY < 200+0.0625*height) {
    difficulty = 1;  
  } 
}

void difficultyButton(float x, String t) {
  //tactile ====================================================================================================
  if (mouseX > x-0.09375*width && mouseX < x+0.09375*width && mouseY > 200-0.0625*height && mouseY < 200+0.0625*height) {
    fill(red);
  } else {
    fill(white);
  }
  
  rect(x,200,0.1875*width,0.125*height);
  //the text ====================================================================================================
  fill(black);
  textSize(0.025*width);
  text(t,x,200);
}
