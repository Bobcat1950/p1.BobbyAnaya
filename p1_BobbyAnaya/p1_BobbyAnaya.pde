//Microwave States
boolean DoorOpen = false;
boolean MicrowaveOn = false;

//Microwave Door Setup
int baseX, baseY, doorX, doorY, windowX, windowY, handleX, handleY, doorOpenY,handleOpenY;
int windowCornerRad;
int baseXSize = 1300;
int baseYSize = 750;
int doorXSize = 860;
int doorYSize = 650;
int doorOpenYSize = 50;
int windowXSize = 840;
int windowYSize = 575;
int handleXSize = 560;
int handleYSize = 16;
color DefButColor, StartColor, StopColor, BaseColor, insideColor,currentColor, 
handleColor, insideOnColor, screenColor, displayColor;
color DefButHighlight, StartHighlight, StopHighlight, handleHighlight;

//Mouse Hovers
boolean handleOver = false;

//Microwave Interface 
int screenBaseX,screenBaseY,displayX, displayY;
int screenCornerRad = 25;
int screenBaseXSize = 340;
int screenBaseYSize = 650;
int displayXSize = 290;
int displayYSize = 100;

//InterFace Timer Buttons
color OnButtonColor;
int setClockX, setClockY,ampmX, ampmY, setTimerX, setTimerY, resetTimerX, resetTimerY;
int timerButtonSize = 72;

//Interface Keypad Buttons
int oneX, oneY, twoX, twoY, threeX, threeY, fourX, fourY, fiveX, fiveY, sixX, sixY, sevenX,
sevenY, eightX, eightY, nineX, nineY, cookTimeX, cookTimeY, zeroX, zeroY, add30sX, add30sY;
int keypadButtonSize = 70;

//Interface Accessibility Buttons
int endLightX, endLightY, volumeX, volumeY, dispButtonX, dispButtonY;
int accessButtonSize = 70;

void setup(){
  size(1500,800);
  endLightX = volumeX = dispButtonX = 1283;
  endLightY = 357;
  volumeY = 427;
  dispButtonY = 497;
  oneY= twoY= threeY = 322;
  fourY = fiveY = sixY = 392;
  sevenY = eightY= nineY = 462;
  cookTimeY= zeroY= add30sY = 532;
  oneX= fourX= sevenX= cookTimeX = 1061;
  twoX= fiveX= eightX= zeroX = 1131;
  threeX= sixX= nineX= add30sX = 1201;
  ampmX = 1133;
  ampmY = 225;
  setTimerX = 1205;
  setTimerY = 225;
  resetTimerX = 1277;
  resetTimerY = 225;
  setClockX = 1061;
  setClockY = 225;
  displayX = 1060;
  displayY = 100;
  screenBaseX = 1035;
  screenBaseY = 75;
  baseX = 100;
  baseY = 25;
  doorX = 150;
  doorY = 75;
  doorOpenY = 675;
  windowX = 160;
  windowY = 125;
  handleX = 300;
  handleY = 91;
  handleOpenY = 725;
  windowCornerRad = 25; 
  BaseColor = color(114);
  insideColor = color(195);
  insideOnColor = color(250,236,167);
  handleColor = color(0);
  screenColor = color(255);
  DefButColor = color(219);
  OnButtonColor = color(86,9,212);
  displayColor = color(144, 226, 255);
  handleHighlight = color(75);
  stroke(0);
}

void draw(){
  strokeWeight(3.5);
  update();
  fill(BaseColor);
  rect(baseX, baseY, baseXSize, baseYSize);
  if(!DoorOpen){
    rect(doorX, doorY, doorXSize, doorYSize);
    if(handleOver){
      fill(handleHighlight);
    }else{
      fill(handleColor);
    }
    rect(handleX, handleY, handleXSize, handleYSize);
    if(!MicrowaveOn){
      fill(insideColor);
    }else{
      fill(insideOnColor);
    }
    rect(windowX, windowY, windowXSize, windowYSize, windowCornerRad);
  }
  else{
    fill(insideColor);
    rect(doorX,doorY, doorXSize, doorYSize);
    fill(BaseColor);
    rect(doorX, doorOpenY, doorXSize, doorOpenYSize);
    if(!handleOver){
      fill(handleHighlight);
    }else{
      fill(handleColor);
    }
    rect(handleX, handleOpenY, handleXSize, handleYSize);
  }
  fill(screenColor);
  rect(screenBaseX, screenBaseY, screenBaseXSize, screenBaseYSize, screenCornerRad);
  fill(displayColor);
  rect(displayX, displayY, displayXSize, displayYSize);
  strokeWeight(1.5);
  fill(DefButColor);
  rect(setClockX, setClockY, timerButtonSize, timerButtonSize);
  rect(ampmX, ampmY, timerButtonSize, timerButtonSize);
  rect(setTimerX, setTimerY, timerButtonSize, timerButtonSize);
  rect(resetTimerX, resetTimerY, timerButtonSize, timerButtonSize);
  rect(oneX, oneY, keypadButtonSize, keypadButtonSize);
  rect(twoX, twoY, keypadButtonSize, keypadButtonSize);
  rect(threeX, threeY, keypadButtonSize, keypadButtonSize);
  rect(fourX, fourY, keypadButtonSize, keypadButtonSize);
  rect(fiveX, fiveY, keypadButtonSize, keypadButtonSize);
  rect(sixX, sixY, keypadButtonSize, keypadButtonSize);
  rect(sevenX, sevenY, keypadButtonSize, keypadButtonSize);
  rect(eightX, eightY, keypadButtonSize, keypadButtonSize);
  rect(nineX, nineY, keypadButtonSize, keypadButtonSize);
  rect(cookTimeX, cookTimeY, keypadButtonSize, keypadButtonSize);
  rect(zeroX, zeroY, keypadButtonSize, keypadButtonSize);
  rect(add30sX, add30sY, keypadButtonSize, keypadButtonSize);
  rect(endLightX, endLightY, accessButtonSize, accessButtonSize);
  rect(volumeX, volumeY, accessButtonSize, accessButtonSize);
  rect(dispButtonX, dispButtonY, accessButtonSize, accessButtonSize);
}

void update(){
  if(!DoorOpen && overHandle(handleX, handleY, handleXSize, handleYSize) ){
    handleOver = true;
  }
  else if(DoorOpen && !overHandle(handleX, handleOpenY, handleXSize, handleYSize) ){
    handleOver = true;
  }
  else{
    handleOver = false;
  }
}

void mousePressed(){
  if(!DoorOpen && overHandle(handleX, handleY, handleXSize, handleYSize) ){
    DoorOpen = true;
  }
  else if(DoorOpen && overHandle(handleX, handleOpenY, handleXSize, handleYSize) ){
    DoorOpen = false;
  }
}

boolean overHandle(int x, int y, int width, int height){
  if(mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height){
    return true;
  }
  else{
    return false;
  }
}
