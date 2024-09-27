// import libraries
import controlP5.*;

// global variables
PImage img;
int levelNum = 0;
ControlP5 cp5;
DropdownList levels;
DropdownList startDateChooser;
DropdownList endDateChooser;

void setup() {
  frameRate(60);
  size(1000, 1000, P2D);
  img = loadImage("tree.png", "png");
  image(img, 0, 0);
  initZoom();
  setupUI();

  
  loadData();
  println(table01_11In.getRowCount() == table09_26In.getRowCount());
  println(table09_26In.getRowCount() == table11_33In.getRowCount());
  
  
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
  
  text("Time: " +  time, 10, 50);
  text("People on floor 1: " + level1Counter, 10, 100);
  text("People on floor 9: " + level9Counter, 10, 150);
  text("People on floor 11: " + level11Counter, 10, 200);
  
  delay(100);
}
