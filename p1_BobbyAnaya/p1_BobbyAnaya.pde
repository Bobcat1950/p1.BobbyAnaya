//Microwave States
boolean DoorOpen = false;
boolean MicrowaveOn = false;
boolean LightStatus = false;
String Volume = "High"; //Mute, Low, High
int FontSize = 0; //0-Small 5-Medium 10-Large
boolean Locked = false;
boolean DefaultState = true;
boolean CookingState = false;
boolean TimerState = false;
boolean ClockSet = false;
boolean ResetTimerState = false;
int cookTimeStage = 0;
int timerTimeStage = 0;
int clockTimeStage = 0;
boolean AM = true;
String ClockTime;

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
handleColor, insideOnColor, screenColor, displayColor, openColor,endLightOn;
color DefButHighlight, StartHighlight, StopHighlight, handleHighlight, openHighlight, 
endLightOnHighlight;

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

//Time values
int CookTimeMinutes, CookTimeSeconds, TimerMinutes, TimerSeconds;
int ClockHours = 0;
int ClockMinutes = 0;
int ClockSeconds = 0;
String ClockNotSet = "Set Clock Please";
int time;
int clockTime;
int secondsRemaining;
int tenMinutes,singleMinutes,tenSeconds,singleSeconds;

void setup(){
  size(1500,800);
  time = millis();
  clockTime = millis();
  CookTimeMinutes = CookTimeSeconds = TimerMinutes = TimerSeconds = 0;
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
  endLightOn = color(137,209,212);
  endLightOnHighlight = color(181,242,245);
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
  }else{
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
  if(LightStatus){
    fill(endLightOver ? endLightOnHighlight : endLightOn);
  }else{
  fill(endLightOver ? DefButHighlight : DefButColor);
  }
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
  
  //Setting up Display
  if(DefaultState){
    if(!ClockSet){
      textSize(25 + FontSize);
      text(ClockNotSet, displayX+145, displayY+50);
    }
    else if(ClockSet){
      textSize(25 + 3*FontSize);
      ClockTime = ClockHours + ":" + (ClockMinutes < 10 ? "0" : "") + ClockMinutes;
      if(AM){
        text(ClockTime + "  AM", displayX+145, displayY+50);
      }
      else{
        text(ClockTime + "  PM", displayX+145, displayY+50);
      }
    }
  }
  if(CookingState){
    textSize(25 + 4*FontSize);
    text(CookTimeMinutes + ":" + (CookTimeSeconds<10 ? "0" : "") + CookTimeSeconds, displayX+145, displayY+50);
  }
  if(TimerState){
    textSize(25 + 4*FontSize);
    text(TimerMinutes + ":" + (TimerSeconds<10 ? "0" : "") + TimerSeconds, displayX+145, displayY+50);
  }
  if(ResetTimerState){
    textSize(25 + 2*FontSize);
    text("Reset Timer?", displayX+145, displayY+50);
  }
  switch(cookTimeStage){
    case 1:
      textSize(25 + 5*FontSize);
      text("__:__", displayX+145, displayY+50);
      break;
    case 2:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "_:__", displayX+145, displayY+50);
      break;
    case 3:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "" + singleMinutes + ":__", displayX+145, displayY+50);
      break;
    case 4:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "" + singleMinutes + ":" + tenSeconds + "_", displayX+145, displayY+50);
      break;
    case 5:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "" + singleMinutes + ":" + tenSeconds + "" + singleSeconds, displayX+145, displayY+50);
      break;
  }
  switch(timerTimeStage){
    case 1:
      textSize(25 + 5*FontSize);
      text("__:__", displayX+145, displayY+50);
      break;
    case 2:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "_:__", displayX+145, displayY+50);
      break;
    case 3:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "" + singleMinutes + ":__", displayX+145, displayY+50);
      break;
    case 4:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "" + singleMinutes + ":" + tenSeconds + "_", displayX+145, displayY+50);
      break;
    case 5:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "" + singleMinutes + ":" + tenSeconds + "" + singleSeconds, displayX+145, displayY+50);
      break;
  }
  switch(clockTimeStage){
    case 1:
      textSize(25 + 5*FontSize);
      text("__:__", displayX+145, displayY+50);
      break;
    case 2:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "_:__", displayX+145, displayY+50);
      break;
    case 3:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "" + singleMinutes + ":__", displayX+145, displayY+50);
      break;
    case 4:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "" + singleMinutes + ":" + tenSeconds + "_", displayX+145, displayY+50);
      break;
    case 5:
      textSize(25 + 5*FontSize);
      text(tenMinutes + "" + singleMinutes + ":" + tenSeconds + "" + singleSeconds, displayX+145, displayY+50);
      break;
  }
}

void update(){
  if(CookingState){
    MicrowaveOn = CookingState;
  }else if(DefaultState){
    MicrowaveOn = !DefaultState;
  }else if(ResetTimerState){
    MicrowaveOn = !ResetTimerState;
  }
  if(CookingState){
    if(secondcheck()){
      CookTimeSeconds -= 1;
    }
  }else if(TimerState){
    if(secondcheck()){
      TimerSeconds -= 1;
    }
  }
  if(ClockSet){
    if(clockTickCheck()){
      ClockSeconds += 1;
    }
  }
  if(CookingState){
    secondsRemaining = CookTimeSeconds + (CookTimeMinutes*60);
  }else if(TimerState){
    secondsRemaining = TimerSeconds + (TimerMinutes*60);
  }
  if(ClockSeconds >= 60){
    ClockMinutes += ClockSeconds/60;
    ClockSeconds = ClockSeconds%60;
  }
  if(ClockMinutes >= 60){
    ClockHours += ClockMinutes/60;
    ClockMinutes = ClockMinutes%60;
  }
  if(ClockHours >= 13){
    ClockHours = ClockHours%13;
  }
  if(ClockHours == 0){
    ClockHours += 1;
  }
  if(CookTimeSeconds >=60){
    CookTimeMinutes += CookTimeSeconds/60;
    CookTimeSeconds = CookTimeSeconds%60;
  }
  if(CookTimeMinutes >=60){
    CookTimeMinutes = CookTimeMinutes%60;
  }
  if(CookTimeSeconds < 0 && CookTimeMinutes > 0){
    CookTimeMinutes -= 1;
    CookTimeSeconds +=60;
  }
  if(TimerSeconds >=60){
    TimerMinutes += TimerSeconds/60;
    TimerSeconds = TimerSeconds%60;
  }
  if(TimerMinutes >=60){
    TimerMinutes = TimerMinutes%60;
  }
  if(TimerSeconds < 0 && TimerMinutes > 0){
    TimerMinutes -= 1;
    TimerSeconds +=59;
  }
  if(CookingState && secondsRemaining <= 0){
    Locked = false;
    CookingState = false;
    DefaultState = true;
    if(LightStatus)
    {
      insideColor = color(118,236,240);
    }
  }
  if(TimerState && secondsRemaining <= 0){
    Locked = false;
    TimerState = false;
    ResetTimerState = true;
    if(LightStatus && !TimerState)
    {
      insideColor = color(118,236,240);
    }
  }
  if(TimerState){
    insideColor = color(195);
  }
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
  if(!DoorOpen && overHandle(handleX, handleY, handleXSize, handleYSize) && !Locked ){
    DoorOpen = true;
  }
  else if(DoorOpen && overHandle(handleX, handleOpenY, handleXSize, handleYSize) ){
    DoorOpen = false;
  }
  if(overOpen(openX, openY, openSize) && !Locked)
  {
    DoorOpen = !DoorOpen;
  }
  if(overButton(oneX, oneY, keypadButtonSize, keypadButtonSize) && DefaultState && !DoorOpen){
    CookTimeMinutes = 1;
    DefaultState = false;
    CookingState = true;
    Locked = true;
    time = millis()/1000;
  }else if(overButton(twoX, twoY, keypadButtonSize, keypadButtonSize) && DefaultState && !DoorOpen){
    CookTimeMinutes = 2;
    DefaultState = false;
    CookingState = true;
    Locked = true;
    time = millis()/1000;
  }else if(overButton(threeX, threeY, keypadButtonSize, keypadButtonSize) && DefaultState && !DoorOpen){
    CookTimeMinutes = 3;
    DefaultState = false;
    CookingState = true;
    Locked = true;
    time = millis()/1000;
  }else if(overButton(fourX, fourY, keypadButtonSize, keypadButtonSize) && DefaultState && !DoorOpen){
    CookTimeMinutes = 4;
    DefaultState = false;
    CookingState = true;
    Locked = true;
    time = millis()/1000;
  }else if(overButton(fiveX, fiveY, keypadButtonSize, keypadButtonSize) && DefaultState && !DoorOpen){
    CookTimeMinutes = 5;
    DefaultState = false;
    CookingState = true;
    Locked = true;
    time = millis()/1000;
  }else if(overButton(sixX, sixY, keypadButtonSize, keypadButtonSize) && DefaultState && !DoorOpen){
    CookTimeMinutes = 6;
    DefaultState = false;
    CookingState = true;
    Locked = true;
    time = millis()/1000;
  }else if(overButton(sevenX, sevenY, keypadButtonSize, keypadButtonSize) && DefaultState && !DoorOpen){
    CookTimeMinutes = 7;
    DefaultState = false;
    CookingState = true;
    Locked = true;
    time = millis()/1000;
  }else if(overButton(eightX, eightY, keypadButtonSize, keypadButtonSize) && DefaultState && !DoorOpen){
    CookTimeMinutes = 8;
    DefaultState = false;
    CookingState = true;
    Locked = true;
    time = millis()/1000;
  }else if(overButton(nineX, nineY, keypadButtonSize, keypadButtonSize) && DefaultState && !DoorOpen){
    CookTimeMinutes = 9;
    DefaultState = false;
    CookingState = true;
    Locked = true;
    time = millis()/1000;
  }else if(overButton(add30sX, add30sY, keypadButtonSize, keypadButtonSize) && DefaultState && !DoorOpen){
    CookTimeSeconds = 30;
    DefaultState = false;
    CookingState = true;
    Locked = true;
    time = millis()/1000;
  }else if(overButton(add30sX, add30sY, keypadButtonSize, keypadButtonSize) && CookingState && !DoorOpen){
    CookTimeSeconds += 30;
  }else if(overButton(startX, startY, startstopSize, startstopSize) && cookTimeStage == 5 && !DoorOpen){
    Locked = true;
    CookingState = true;
    cookTimeStage = 0;
    CookTimeMinutes = tenMinutes*10 + singleMinutes;
    CookTimeSeconds = tenSeconds*10 + singleSeconds;
    time = millis()/1000;
  }else if(overButton(startX, startY, startstopSize, startstopSize) && timerTimeStage == 5){
    TimerState = true;
    timerTimeStage = 0;
    TimerMinutes = tenMinutes*10 + singleMinutes;
    TimerSeconds = tenSeconds*10 + singleSeconds;
    time = millis()/1000;
  }else if(overButton(startX, startY, startstopSize, startstopSize) && clockTimeStage == 5){
    ClockSet = true;
    DefaultState = true;
    clockTimeStage = 0;
    ClockHours = tenMinutes*10 + singleMinutes;
    ClockMinutes = tenSeconds*10 + singleSeconds;
    ClockSeconds = 0;
    clockTime = millis()/1000;
  }else if(overButton(startX, startY, startstopSize, startstopSize) && DefaultState && !DoorOpen){
    Locked = true;
  }else if(overButton(stopX, stopY, startstopSize, startstopSize)){
    Locked = false;
    CookTimeMinutes = 0;
    CookTimeSeconds = 0;
    TimerMinutes = 0;
    TimerSeconds = 0;
    CookingState = false;
    TimerState = false;
    ResetTimerState = false;
    cookTimeStage = 0;
    timerTimeStage = 0;
    clockTimeStage = 0;
    DefaultState = true;
    insideColor = color(195);
  }else if(overButton(ampmX, ampmY, timerButtonSize, timerButtonSize)){
    AM = !AM;
  }else if(overButton(endLightX, endLightY, accessButtonSize, accessButtonSize)){
    LightStatus = !LightStatus;
  }else if(overButton(volumeX, volumeY, accessButtonSize, accessButtonSize)){
    if(Volume == "High"){
      Volume = "Low";
    }else if(Volume == "Low"){
      Volume = "Mute";
    }else if(Volume == "Mute"){
      Volume = "High";
    }
  }else if(overButton(dispButtonX, dispButtonY, accessButtonSize, accessButtonSize)){
    if(FontSize == 0){
      FontSize = 5;
    }else if(FontSize == 5){
      FontSize = 10;
    }else if(FontSize == 10){
      FontSize = 0;
    }
  }else if(overButton(cookTimeX, cookTimeY, keypadButtonSize, keypadButtonSize) && DefaultState && !DoorOpen){
    cookTimeStage += 1;
    DefaultState = false;
  }else if(overButton(setTimerX, setTimerY, timerButtonSize, timerButtonSize) && DefaultState){
    timerTimeStage += 1;
    DefaultState = false;
  }else if(overButton(resetTimerX, resetTimerY, timerButtonSize, timerButtonSize) && ResetTimerState){
    TimerState = true;
    ResetTimerState = false;
    TimerMinutes = tenMinutes*10 + singleMinutes;
    TimerSeconds = tenSeconds*10 + singleSeconds;
    time = millis()/1000;
  }else if(overButton(setClockX, setClockY, timerButtonSize, timerButtonSize) && DefaultState){
    clockTimeStage += 1;
    DefaultState = false;
  }//Setting Cook Time
  else if(overButton(zeroX, zeroY, keypadButtonSize, keypadButtonSize) && (cookTimeStage>0) && !DoorOpen){
    switch(cookTimeStage){
      case 1:
        tenMinutes = 0;
        cookTimeStage += 1;
        break;
      case 2:
        singleMinutes = 0;
        cookTimeStage += 1;
        break;
      case 3:
        tenSeconds = 0;
        cookTimeStage +=1;
        break;
      case 4:
        singleSeconds = 0;
        cookTimeStage += 1;
        break;
      }
    }else if(overButton(oneX, oneY, keypadButtonSize, keypadButtonSize) && (cookTimeStage>0) && !DoorOpen){
    switch(cookTimeStage){
      case 1:
        tenMinutes = 1;
        cookTimeStage += 1;
        break;
      case 2:
        singleMinutes = 1;
        cookTimeStage += 1;
        break;
      case 3:
        tenSeconds = 1;
        cookTimeStage +=1;
        break;
      case 4:
        singleSeconds = 1;
        cookTimeStage += 1;
        break;
      }
    }else if(overButton(twoX, twoY, keypadButtonSize, keypadButtonSize) && (cookTimeStage>0) && !DoorOpen){
    switch(cookTimeStage){
      case 1:
        tenMinutes = 2;
        cookTimeStage += 1;
        break;
      case 2:
        singleMinutes = 2;
        cookTimeStage += 1;
        break;
      case 3:
        tenSeconds = 2;
        cookTimeStage +=1;
        break;
      case 4:
        singleSeconds = 2;
        cookTimeStage += 1;
        break;
      }
    }else if(overButton(threeX, threeY, keypadButtonSize, keypadButtonSize) && (cookTimeStage>0) && !DoorOpen){
    switch(cookTimeStage){
      case 1:
        tenMinutes = 3;
        cookTimeStage += 1;
        break;
      case 2:
        singleMinutes = 3;
        cookTimeStage += 1;
        break;
      case 3:
        tenSeconds = 3;
        cookTimeStage +=1;
        break;
      case 4:
        singleSeconds = 3;
        cookTimeStage += 1;
        break;
      }
    }else if(overButton(fourX, fourY, keypadButtonSize, keypadButtonSize) && (cookTimeStage>0) && !DoorOpen){
    switch(cookTimeStage){
      case 1:
        tenMinutes = 4;
        cookTimeStage += 1;
        break;
      case 2:
        singleMinutes = 4;
        cookTimeStage += 1;
        break;
      case 3:
        tenSeconds = 4;
        cookTimeStage +=1;
        break;
      case 4:
        singleSeconds = 4;
        cookTimeStage += 1;
        break;
      }
    }else if(overButton(fiveX, fiveY, keypadButtonSize, keypadButtonSize) && (cookTimeStage>0) && !DoorOpen){
    switch(cookTimeStage){
      case 1:
        tenMinutes = 5;
        cookTimeStage += 1;
        break;
      case 2:
        singleMinutes = 5;
        cookTimeStage += 1;
        break;
      case 3:
        tenSeconds = 5;
        cookTimeStage +=1;
        break;
      case 4:
        singleSeconds = 5;
        cookTimeStage += 1;
        break;
      }
    }else if(overButton(sixX, sixY, keypadButtonSize, keypadButtonSize) && (cookTimeStage>0) && !DoorOpen){
    switch(cookTimeStage){
      case 1:
        tenMinutes = 6;
        cookTimeStage += 1;
        break;
      case 2:
        singleMinutes = 6;
        cookTimeStage += 1;
        break;
      case 3:
        tenSeconds = 6;
        cookTimeStage +=1;
        break;
      case 4:
        singleSeconds = 6;
        cookTimeStage += 1;
        break;
      }
    }else if(overButton(sevenX, sevenY, keypadButtonSize, keypadButtonSize) && (cookTimeStage>0) && !DoorOpen){
    switch(cookTimeStage){
      case 1:
        tenMinutes = 7;
        cookTimeStage += 1;
        break;
      case 2:
        singleMinutes = 7;
        cookTimeStage += 1;
        break;
      case 3:
        tenSeconds = 7;
        cookTimeStage +=1;
        break;
      case 4:
        singleSeconds = 7;
        cookTimeStage += 1;
        break;
      }
    }else if(overButton(eightX, eightY, keypadButtonSize, keypadButtonSize) && (cookTimeStage>0) && !DoorOpen){
    switch(cookTimeStage){
      case 1:
        tenMinutes = 8;
        cookTimeStage += 1;
        break;
      case 2:
        singleMinutes = 8;
        cookTimeStage += 1;
        break;
      case 3:
        tenSeconds = 8;
        cookTimeStage +=1;
        break;
      case 4:
        singleSeconds = 8;
        cookTimeStage += 1;
        break;
      }
    }else if(overButton(nineX, nineY, keypadButtonSize, keypadButtonSize) && (cookTimeStage>0) && !DoorOpen){
    switch(cookTimeStage){
      case 1:
        tenMinutes = 9;
        cookTimeStage += 1;
        break;
      case 2:
        singleMinutes = 9;
        cookTimeStage += 1;
        break;
      case 3:
        tenSeconds = 9;
        cookTimeStage +=1;
        break;
      case 4:
        singleSeconds = 9;
        cookTimeStage += 1;
        break;
      }
    }//Setting Timer
    else if(overButton(zeroX, zeroY, keypadButtonSize, keypadButtonSize) && (timerTimeStage>0)){
    switch(timerTimeStage){
      case 1:
        tenMinutes = 0;
        timerTimeStage += 1;
        break;
      case 2:
        singleMinutes = 0;
        timerTimeStage += 1;
        break;
      case 3:
        tenSeconds = 0;
        timerTimeStage +=1;
        break;
      case 4:
        singleSeconds = 0;
        timerTimeStage += 1;
        break;
      }
    }else if(overButton(oneX, oneY, keypadButtonSize, keypadButtonSize) && (timerTimeStage>0)){
    switch(timerTimeStage){
      case 1:
        tenMinutes = 1;
        timerTimeStage += 1;
        break;
      case 2:
        singleMinutes = 1;
        timerTimeStage += 1;
        break;
      case 3:
        tenSeconds = 1;
        timerTimeStage +=1;
        break;
      case 4:
        singleSeconds = 1;
        timerTimeStage += 1;
        break;
      }
    }else if(overButton(twoX, twoY, keypadButtonSize, keypadButtonSize) && (timerTimeStage>0)){
    switch(timerTimeStage){
      case 1:
        tenMinutes = 2;
        timerTimeStage += 1;
        break;
      case 2:
        singleMinutes = 2;
        timerTimeStage += 1;
        break;
      case 3:
        tenSeconds = 2;
        timerTimeStage +=1;
        break;
      case 4:
        singleSeconds = 2;
        timerTimeStage += 1;
        break;
      }
    }else if(overButton(threeX, threeY, keypadButtonSize, keypadButtonSize) && (timerTimeStage>0)){
    switch(timerTimeStage){
      case 1:
        tenMinutes = 3;
        timerTimeStage += 1;
        break;
      case 2:
        singleMinutes = 3;
        timerTimeStage += 1;
        break;
      case 3:
        tenSeconds = 3;
        timerTimeStage +=1;
        break;
      case 4:
        singleSeconds = 3;
        timerTimeStage += 1;
        break;
      }
    }else if(overButton(fourX, fourY, keypadButtonSize, keypadButtonSize) && (timerTimeStage>0)){
    switch(timerTimeStage){
      case 1:
        tenMinutes = 4;
        timerTimeStage += 1;
        break;
      case 2:
        singleMinutes = 4;
        timerTimeStage += 1;
        break;
      case 3:
        tenSeconds = 4;
        timerTimeStage +=1;
        break;
      case 4:
        singleSeconds = 4;
        timerTimeStage += 1;
        break;
      }
    }else if(overButton(fiveX, fiveY, keypadButtonSize, keypadButtonSize) && (timerTimeStage>0)){
    switch(timerTimeStage){
      case 1:
        tenMinutes = 5;
        timerTimeStage += 1;
        break;
      case 2:
        singleMinutes = 5;
        timerTimeStage += 1;
        break;
      case 3:
        tenSeconds = 5;
        timerTimeStage +=1;
        break;
      case 4:
        singleSeconds = 5;
        timerTimeStage += 1;
        break;
      }
    }else if(overButton(sixX, sixY, keypadButtonSize, keypadButtonSize) && (timerTimeStage>0)){
    switch(timerTimeStage){
      case 1:
        tenMinutes = 6;
        timerTimeStage += 1;
        break;
      case 2:
        singleMinutes = 6;
        timerTimeStage += 1;
        break;
      case 3:
        tenSeconds = 6;
        timerTimeStage +=1;
        break;
      case 4:
        singleSeconds = 6;
        timerTimeStage += 1;
        break;
      }
    }else if(overButton(sevenX, sevenY, keypadButtonSize, keypadButtonSize) && (timerTimeStage>0)){
    switch(timerTimeStage){
      case 1:
        tenMinutes = 7;
        timerTimeStage += 1;
        break;
      case 2:
        singleMinutes = 7;
        timerTimeStage += 1;
        break;
      case 3:
        tenSeconds = 7;
        timerTimeStage +=1;
        break;
      case 4:
        singleSeconds = 7;
        timerTimeStage += 1;
        break;
      }
    }else if(overButton(eightX, eightY, keypadButtonSize, keypadButtonSize) && (timerTimeStage>0)){
    switch(timerTimeStage){
      case 1:
        tenMinutes = 8;
        timerTimeStage += 1;
        break;
      case 2:
        singleMinutes = 8;
        timerTimeStage += 1;
        break;
      case 3:
        tenSeconds = 8;
        timerTimeStage +=1;
        break;
      case 4:
        singleSeconds = 8;
        timerTimeStage += 1;
        break;
      }
    }else if(overButton(nineX, nineY, keypadButtonSize, keypadButtonSize) && (timerTimeStage>0)){
    switch(timerTimeStage){
      case 1:
        tenMinutes = 9;
        timerTimeStage += 1;
        break;
      case 2:
        singleMinutes = 9;
        timerTimeStage += 1;
        break;
      case 3:
        tenSeconds = 9;
        timerTimeStage +=1;
        break;
      case 4:
        singleSeconds = 9;
        timerTimeStage += 1;
        break;
      }
    }else if(overButton(zeroX, zeroY, keypadButtonSize, keypadButtonSize) && (clockTimeStage>0)){
    switch(clockTimeStage){
      case 1:
        tenMinutes = 0;
        clockTimeStage += 1;
        break;
      case 2:
        singleMinutes = 0;
        clockTimeStage += 1;
        break;
      case 3:
        tenSeconds = 0;
        clockTimeStage +=1;
        break;
      case 4:
        singleSeconds = 0;
        clockTimeStage += 1;
        break;
      }
    }else if(overButton(oneX, oneY, keypadButtonSize, keypadButtonSize) && (clockTimeStage>0)){
    switch(clockTimeStage){
      case 1:
        tenMinutes = 1;
        clockTimeStage += 1;
        break;
      case 2:
        singleMinutes = 1;
        clockTimeStage += 1;
        break;
      case 3:
        tenSeconds = 1;
        clockTimeStage +=1;
        break;
      case 4:
        singleSeconds = 1;
        clockTimeStage += 1;
        break;
      }
    }else if(overButton(twoX, twoY, keypadButtonSize, keypadButtonSize) && (clockTimeStage>0)){
    switch(clockTimeStage){
      case 1:
        tenMinutes = 2;
        clockTimeStage += 1;
        break;
      case 2:
        singleMinutes = 2;
        clockTimeStage += 1;
        break;
      case 3:
        tenSeconds = 2;
        clockTimeStage +=1;
        break;
      case 4:
        singleSeconds = 2;
        clockTimeStage += 1;
        break;
      }
    }else if(overButton(threeX, threeY, keypadButtonSize, keypadButtonSize) && (clockTimeStage>0)){
    switch(clockTimeStage){
      case 1:
        tenMinutes = 3;
        clockTimeStage += 1;
        break;
      case 2:
        singleMinutes = 3;
        clockTimeStage += 1;
        break;
      case 3:
        tenSeconds = 3;
        clockTimeStage +=1;
        break;
      case 4:
        singleSeconds = 3;
        clockTimeStage += 1;
        break;
      }
    }else if(overButton(fourX, fourY, keypadButtonSize, keypadButtonSize) && (clockTimeStage>0)){
    switch(clockTimeStage){
      case 1:
        tenMinutes = 4;
        clockTimeStage += 1;
        break;
      case 2:
        singleMinutes = 4;
        clockTimeStage += 1;
        break;
      case 3:
        tenSeconds = 4;
        clockTimeStage +=1;
        break;
      case 4:
        singleSeconds = 4;
        clockTimeStage += 1;
        break;
      }
    }else if(overButton(fiveX, fiveY, keypadButtonSize, keypadButtonSize) && (clockTimeStage>0)){
    switch(clockTimeStage){
      case 1:
        tenMinutes = 5;
        clockTimeStage += 1;
        break;
      case 2:
        singleMinutes = 5;
        clockTimeStage += 1;
        break;
      case 3:
        tenSeconds = 5;
        clockTimeStage +=1;
        break;
      case 4:
        singleSeconds = 5;
        clockTimeStage += 1;
        break;
      }
    }else if(overButton(sixX, sixY, keypadButtonSize, keypadButtonSize) && (clockTimeStage>0)){
    switch(clockTimeStage){
      case 1:
        tenMinutes = 6;
        clockTimeStage += 1;
        break;
      case 2:
        singleMinutes = 6;
        clockTimeStage += 1;
        break;
      case 3:
        tenSeconds = 6;
        clockTimeStage +=1;
        break;
      case 4:
        singleSeconds = 6;
        clockTimeStage += 1;
        break;
      }
    }else if(overButton(sevenX, sevenY, keypadButtonSize, keypadButtonSize) && (clockTimeStage>0)){
    switch(clockTimeStage){
      case 1:
        tenMinutes = 7;
        clockTimeStage += 1;
        break;
      case 2:
        singleMinutes = 7;
        clockTimeStage += 1;
        break;
      case 3:
        tenSeconds = 7;
        clockTimeStage +=1;
        break;
      case 4:
        singleSeconds = 7;
        clockTimeStage += 1;
        break;
      }
    }else if(overButton(eightX, eightY, keypadButtonSize, keypadButtonSize) && (clockTimeStage>0)){
    switch(clockTimeStage){
      case 1:
        tenMinutes = 8;
        clockTimeStage += 1;
        break;
      case 2:
        singleMinutes = 8;
        clockTimeStage += 1;
        break;
      case 3:
        tenSeconds = 8;
        clockTimeStage +=1;
        break;
      case 4:
        singleSeconds = 8;
        clockTimeStage += 1;
        break;
      }
    }else if(overButton(nineX, nineY, keypadButtonSize, keypadButtonSize) && (clockTimeStage>0)){
    switch(clockTimeStage){
      case 1:
        tenMinutes = 9;
        clockTimeStage += 1;
        break;
      case 2:
        singleMinutes = 9;
        clockTimeStage += 1;
        break;
      case 3:
        tenSeconds = 9;
        clockTimeStage +=1;
        break;
      case 4:
        singleSeconds = 9;
        clockTimeStage += 1;
        break;
      }
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

boolean secondcheck(){
  if(((millis()/1000) - time) >= 1){
    time = millis()/1000;
    return true;
  }
  else{
    return false;
  }
}

boolean clockTickCheck(){
  if(((millis()/1000) - clockTime) >= 1){
    clockTime = millis()/1000;
    if(ClockHours == 11 && ClockMinutes == 59 && ClockSeconds == 59){
      AM = !AM;
    }
    return true;
  }else{
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
