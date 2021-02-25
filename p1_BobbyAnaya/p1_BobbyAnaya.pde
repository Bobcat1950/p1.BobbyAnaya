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
color DefButColor, StartColor, StopColor, DisplayBkgColor, BaseColor, insideColor,
currentColor, handleColor;
color DefButHighlight, StartHighlight, StopHighlight, handleHighlight;
boolean DoorOpen = false;
boolean handleOver = false;

void setup(){
  size(1500,800);
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
  BaseColor = color(63,54,149);
  insideColor = color(195);
  handleColor = color(0);
  handleHighlight = color(75);
  stroke(0);
  strokeWeight(3.5);
}

void draw(){
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
    fill(insideColor);
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
