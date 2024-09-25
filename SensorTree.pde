// import libraries
import controlP5.*;

// global variables
PImage img;
int levelNum = 0;
ControlP5 cp5;
DropdownList levels;

void setup() {
  frameRate(30);
  size(635, 1141, P2D);
  img = loadImage("tree.png", "png");
  image(img, 0, 0);
  initZoom();
  
  loadData();
  println(table01_11In.getRowCount() == table09_26In.getRowCount());
  println(table09_26In.getRowCount() == table11_33In.getRowCount());
  
  cp5 = new ControlP5(this);
  
  // create dropdown list for floor levels
  levels = cp5.addDropdownList("levels")
    .setPosition(500, 300)
    ;
    
  customizeDropdown(levels);
}


void draw() {
  drawZoom();
  //background(250);
  //textSize(30);
  fill(0);
  //image(img, 0, 0);
 drawBush(mapToScreenX(180), mapToScreenY(1017), 37, level1Counter, "beech", scale);
  drawBush(mapToScreenX(414), mapToScreenY(676), 39, level9Counter, "beech", scale);
  drawBush(mapToScreenX(291), mapToScreenY(145), 38, level11Counter, "beech", scale);
  
  // check which floor level to show
  if (levelNum == 1) {
    tx = 121;
    ty = 888;
    newScale = constrain(scale *  1.1 , minScale, maxScale);
    tx -= (mouseX/newScale - mouseX/scale);
    ty -= (mouseY/newScale - mouseY/scale);
    scale = newScale;
  } else if (levelNum == 9) {
    tx = 353;
    ty = 551;
    newScale = constrain(scale *  1.1 , minScale, maxScale);
    tx -= (mouseX/newScale - mouseX/scale);
    ty -= (mouseY/newScale - mouseY/scale);
    scale = newScale;
  } else if (levelNum == 11) {
    tx = 233;
    ty = 11;
    newScale = constrain(scale *  1.1 , minScale, maxScale);
    tx -= (mouseX/newScale - mouseX/scale);
    ty -= (mouseY/newScale - mouseY/scale);
    scale = newScale;
  } else if (levelNum ==-99) {
    newScale = constrain(scale *  0.9 , minScale, maxScale);
    tx -= (mouseX/newScale - mouseX/scale);
    ty -= (mouseY/newScale - mouseY/scale);
    scale = newScale;
  }
  //drawLeaf(200, 200, 120, 10,  "beech");
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
  i++;
  text("Time: " +  time, 350, 50);
  text("People on floor 1: " + level1Counter, 350, 100);
  text("People on floor 9: " + level9Counter, 350, 150);
  text("People on floor 11: " + level11Counter, 350, 200);
}
