//Microwave States
boolean DoorOpen = false;
boolean MicrowaveOn = false;
boolean LightStatus = false;
int Volume = 0;
int FontSize = 0;
boolean Locked = false;

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
color selectedColor;
color DefButColor, StartColor, StopColor, BaseColor, insideColor,currentColor, 
handleColor, insideOnColor, screenColor, displayColor, openColor;
color DefButHighlight, StartHighlight, StopHighlight, handleHighlight, openHighlight;

//Mouse Hovers
boolean handleOver, openButtonOver, startOver, stopOver, oneOver, twoOver, threeOver, fourOver,
fiveOver, sixOver, sevenOver, eightOver, nineOver, cookTimeOver, zeroOver, add30sOver,
endLightOver, volumeOver, dispButtonOver, resetTimerOver, setTimerOver, ampmOver, setClockOver;


//Microwave Interface 
int screenBaseX,screenBaseY,displayX, displayY;
int screenCornerRad = 25;
int screenBaseXSize = 340;
int screenBaseYSize = 650;
int displayXSize = 290;
int displayYSize = 100;

//InterFace Timer Buttons
int setClockX, setClockY,ampmX, ampmY, setTimerX, setTimerY, resetTimerX, resetTimerY;
int timerButtonSize = 72;

//Interface Keypad Buttons
int oneX, oneY, twoX, twoY, threeX, threeY, fourX, fourY, fiveX, fiveY, sixX, sixY, sevenX,
sevenY, eightX, eightY, nineX, nineY, cookTimeX, cookTimeY, zeroX, zeroY, add30sX, add30sY;
int keypadButtonSize = 70;

//Interface Accessibility Buttons
int endLightX, endLightY, volumeX, volumeY, dispButtonX, dispButtonY;
int accessButtonSize = 70;

//Start/Stop/Open Buttons
int openX, openY, startX, startY, stopX, stopY;
int startstopSize = 75;
int openSize = 100;

void setup(){
  size(1500,800);
  handleOver=openButtonOver=startOver=stopOver=oneOver=twoOver=threeOver=fourOver=fiveOver=
  sixOver=sevenOver=eightOver=nineOver=cookTimeOver=zeroOver=add30sOver=endLightOver=volumeOver
  =dispButtonOver=resetTimerOver=setTimerOver=ampmOver=setClockOver=false;
  startX = 1216;
  startY = 623;
  stopX = 1291;
  stopY = 623;
  openX = 1131;
  openY = 663;
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
  DefButHighlight = color(239);
  displayColor = color(144, 226, 255);
  handleHighlight = color(75);
  openColor = color(77,77,142);
  openHighlight = color(111,111,206);
  StartColor = color(13,189,54);
  StartHighlight = color(16,223,64);
  StopColor = color(189,29,29);
  StopHighlight = color(229,36,36);
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
  fill(setClockOver ? DefButHighlight : DefButColor);
  rect(setClockX, setClockY, timerButtonSize, timerButtonSize);
  fill(ampmOver ? DefButHighlight : DefButColor);
  rect(ampmX, ampmY, timerButtonSize, timerButtonSize);
  fill(setTimerOver ? DefButHighlight : DefButColor);
  rect(setTimerX, setTimerY, timerButtonSize, timerButtonSize);
  fill(resetTimerOver ? DefButHighlight : DefButColor);
  rect(resetTimerX, resetTimerY, timerButtonSize, timerButtonSize);
  fill(oneOver ? DefButHighlight : DefButColor);
  rect(oneX, oneY, keypadButtonSize, keypadButtonSize);
  fill(twoOver ? DefButHighlight : DefButColor);
  rect(twoX, twoY, keypadButtonSize, keypadButtonSize);
  fill(threeOver ? DefButHighlight : DefButColor);
  rect(threeX, threeY, keypadButtonSize, keypadButtonSize);
  fill(fourOver ? DefButHighlight : DefButColor);
  rect(fourX, fourY, keypadButtonSize, keypadButtonSize);
  fill(fiveOver ? DefButHighlight : DefButColor);
  rect(fiveX, fiveY, keypadButtonSize, keypadButtonSize);
  fill(sixOver ? DefButHighlight : DefButColor);
  rect(sixX, sixY, keypadButtonSize, keypadButtonSize);
  fill(sevenOver ? DefButHighlight : DefButColor);
  rect(sevenX, sevenY, keypadButtonSize, keypadButtonSize);
  fill(eightOver ? DefButHighlight : DefButColor);
  rect(eightX, eightY, keypadButtonSize, keypadButtonSize);
  fill(nineOver ? DefButHighlight : DefButColor);
  rect(nineX, nineY, keypadButtonSize, keypadButtonSize);
  fill(cookTimeOver ? DefButHighlight : DefButColor);
  rect(cookTimeX, cookTimeY, keypadButtonSize, keypadButtonSize);
  fill(zeroOver ? DefButHighlight : DefButColor);
  rect(zeroX, zeroY, keypadButtonSize, keypadButtonSize);
  fill(add30sOver ? DefButHighlight : DefButColor);
  rect(add30sX, add30sY, keypadButtonSize, keypadButtonSize);
  fill(endLightOver ? DefButHighlight : DefButColor);
  rect(endLightX, endLightY, accessButtonSize, accessButtonSize);
  fill(volumeOver ? DefButHighlight : DefButColor);
  rect(volumeX, volumeY, accessButtonSize, accessButtonSize);
  fill(dispButtonOver ? DefButHighlight : DefButColor);
  rect(dispButtonX, dispButtonY, accessButtonSize, accessButtonSize);
  fill(openButtonOver ? openHighlight : openColor);
  ellipse(openX, openY, openSize, openSize);
  fill(startOver ? StartHighlight : StartColor);
  rect(startX, startY, startstopSize, startstopSize);
  fill(stopOver ? StopHighlight : StopColor);
  rect(stopX, stopY, startstopSize, startstopSize);
  fill(0);
  textSize(30);
  textAlign(CENTER,CENTER);
  text('1', oneX+35, oneY+35);
  text('2', twoX+35, twoY+35);
  text('3', threeX+35, threeY+35);
  text('4', fourX+35, fourY+35);
  text('5', fiveX+35, fiveY+35);
  text('6', sixX+35, sixY+35);
  text('7', sevenX+35, sevenY+35);
  text('8', eightX+35, eightY+35);
  text('9', nineX+35, nineY+35);
  text('0', zeroX+35, zeroY+35);
  textSize(25);
  text("Open\nDoor",openX, openY);
  textSize(20);
  text("Cook\nTime", cookTimeX+35, cookTimeY+35);
  text("Add\n30s", add30sX+35, add30sY+35);
  text("Start/\nLock",startX+37.5, startY+37.5);
  text("Stop/\nUnlock",stopX+37.5, stopY+37.5);
  text("Set\nClock",setClockX+36, setClockY+36);
  text("AM/\nPM", ampmX+36, ampmY+36);
  text("Set\nTimer", setTimerX+36, setTimerY+36);
  text("Reset\nTimer",resetTimerX+36, resetTimerY+36);
  textSize(15);
  text("End\nTimer\nLight",endLightX+35,endLightY+35);
  text("Volume\nOptions",volumeX+35, volumeY+35);
  text("Display\nSize", dispButtonX+35, dispButtonY+35);
  
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
  openButtonOver = overOpen(openX, openY, openSize);
  startOver = overButton(startX, startY, startstopSize, startstopSize);
  stopOver = overButton(stopX, stopY, startstopSize, startstopSize);
  oneOver = overButton(oneX, oneY, keypadButtonSize, keypadButtonSize);
  twoOver = overButton(twoX, twoY, keypadButtonSize, keypadButtonSize);
  threeOver = overButton(threeX, threeY, keypadButtonSize, keypadButtonSize);
  fourOver = overButton(fourX, fourY, keypadButtonSize, keypadButtonSize);
  fiveOver = overButton(fiveX, fiveY, keypadButtonSize, keypadButtonSize);
  sixOver = overButton(sixX, sixY, keypadButtonSize, keypadButtonSize);
  sevenOver = overButton(sevenX, sevenY, keypadButtonSize, keypadButtonSize);
  eightOver = overButton(eightX, eightY, keypadButtonSize, keypadButtonSize);
  nineOver = overButton(nineX, nineY, keypadButtonSize, keypadButtonSize);
  cookTimeOver = overButton(cookTimeX, cookTimeY, keypadButtonSize, keypadButtonSize);
  zeroOver = overButton(zeroX, zeroY, keypadButtonSize, keypadButtonSize);
  add30sOver = overButton(add30sX, add30sY, keypadButtonSize, keypadButtonSize);
  endLightOver = overButton(endLightX, endLightY, accessButtonSize, accessButtonSize);
  volumeOver = overButton(volumeX, volumeY, accessButtonSize, accessButtonSize);
  dispButtonOver = overButton(dispButtonX, dispButtonY, accessButtonSize, accessButtonSize);
  resetTimerOver = overButton(resetTimerX, resetTimerY, timerButtonSize, timerButtonSize);
  setTimerOver = overButton(setTimerX, setTimerY, timerButtonSize, timerButtonSize);
  ampmOver = overButton(ampmX, ampmY, timerButtonSize, timerButtonSize);
  setClockOver = overButton(setClockX, setClockY, timerButtonSize, timerButtonSize);
}

void mousePressed(){
  if(!DoorOpen && overHandle(handleX, handleY, handleXSize, handleYSize) ){
    DoorOpen = true;
  }
  else if(DoorOpen && overHandle(handleX, handleOpenY, handleXSize, handleYSize) ){
    DoorOpen = false;
  }
  if(overOpen(openX, openY, openSize))
  {
    DoorOpen = !DoorOpen;
  }
}

boolean overHandle(int x, int y, int w, int h){
  if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h){
    return true;
  }
  else{
    return false;
  }
}

boolean overOpen(int x, int y, int diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2){
    return true;
  }else{
    return false;
  }
}

boolean overButton(int x, int y, int w, int h){
  if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h){
    return true;
  }else{
    return false;
  }
}
