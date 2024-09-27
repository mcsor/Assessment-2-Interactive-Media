// import libraries
import controlP5.*;
import processing.sound.*;
SoundFile sound1;

// global variables
PImage img;
int levelNum = 0;
ControlP5 cp5;
DropdownList levels;
DropdownList startDateChooser;
DropdownList endDateChooser;
boolean level1 = false;
boolean level9 = false;
boolean level11 = false;

void setup() {
  frameRate(60);
  size(1000, 1000, P2D);
  img = loadImage("tree.png", "png");
  image(img, 0, 0);
  sound1 = new SoundFile(this, "soundeffect.mp3");
  initZoom();
  setupUI();

  
  loadData();
  println(table01_11In.getRowCount() == table09_26In.getRowCount());
  println(table09_26In.getRowCount() == table11_33In.getRowCount());
  
    sound1.play();

}


void draw() {

  drawZoom();
  //background(250);
  //textSize(30);

  //image(img, 0, 0);
 //drawBush(mapToScreenX(1151), mapToScreenY(2160), 235, level1Counter, "beech", scale);
 // drawBush(mapToScreenX(2505), mapToScreenY(1534), 377, level9Counter, "beech", scale);
 // drawBush(mapToScreenX(1358), mapToScreenY(667), 261, level11Counter, "beech", scale);
  prevLevel1Counter = level1Counter;
  prevLevel9Counter = level9Counter;
  prevLevel11Counter = level11Counter;
  
 
  
  
  if (i < table01_11In.getRowCount()) {
    level1Counter += peopleOnFloor(table01_11In, table01_11Out) + peopleOnFloor(table01_12In, table01_12Out) + peopleOnFloor(table01_13In, table01_13Out);
    level9Counter += peopleOnFloor(table09_26In, table09_26Out) + peopleOnFloor(table09_28In, table09_28Out); //only using data from stairs down and classroom since the other data seems to add many people during night
    level11Counter += peopleOnFloor(table11_31In, table11_31Out) + peopleOnFloor(table11_32In, table11_32Out) + peopleOnFloor(table11_33In, table11_33Out);

    if (level1Counter <= 0) {
      level1Counter = 0;
    }
    if (level9Counter <= 0) {
      level9Counter = 0;
    }
    if (level11Counter <= 0) {
      level11Counter = 0;
    }
    time = table01_11In.getString(i, 0);
  }
  createLeaf();
  drawLeaf();
  i++;
  fill(0);
  textSize(20);
  //text("mouseX " + mouseX, 10, 10);
  //text("MouseY " + mouseY, 10, 50);
  
  switch(levelNum){
    case 1:
      level1 = true;
      level9 = false;
      level11 = false;
      break;
    case 9:
      level9 = true;
      level1 = false;
      level11 = false;
      break;
    case 11:
      level11 = true;
      level9 = false;
      level1 = false;
      break;
    case -99:
      level1 = false;
      level9 = false;
      level11 = false;
      break;
    
  }
   if(level9 == true){
    text("Time: " +  time, 765, 50);
  } else {
    text("Time: " +  time, 10, 50);
  }
  
  if(level1 == true){
    text("People on floor 1: " + level1Counter, 10, 100);
  }
  if(level9 == true){
    text("People on floor 9: " + level9Counter, 810, 100);
  }
  if(level11 == true){
    text("People on floor 11: " + level11Counter, 10, 100);
  }
  
  delay(100);
  
  //sound
  float volume = map(level1Counter+level9Counter+level11Counter, 0, 100, 0, 1);
  sound1.amp(volume);

}
