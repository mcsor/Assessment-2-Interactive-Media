PImage img;

void setup() {
  frameRate(2);
   size(700, 700);
  img = loadImage("tree.png", "png");
  img.resize(0, 700);
  image(img, 0, 0);
  //Level 1 data (4. of febuary 2019 to 10. of february)
  table01_11In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC01.11+%28In%29", "csv");
  table01_11Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC01.11+%28Out%29", "csv");
  table01_12In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC01.12+%28In%29", "csv");
  table01_12Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC01.12+%28Out%29", "csv");
  table01_13In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC01.13+%28In%29", "csv");
  table01_13Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC01.13+%28Out%29", "csv");

  //level 9 data (4. of febuary 2019 to 10. of february)
  table09_26In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC09.26+%28In%29", "csv");
  table09_26Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC09.26+%28Out%29", "csv");
  table09_27In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC09.27+%28In%29", "csv");
  table09_27Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC09.27+%28Out%29", "csv");
  table09_28In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC09.28+%28In%29", "csv");
  table09_28Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC09.28+%28Out%29", "csv");
  table09_29In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC09.29+%28In%29", "csv");
  table09_29Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC09.29+%28Out%29", "csv");

  //level 9 data (4. of febuary 2019 to 10. of february)
  table11_31In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC11.31+%28In%29", "csv");
  table11_31Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC11.31+%28Out%29", "csv");
  table11_32In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC11.32+%28In%29", "csv");
  table11_32Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC11.32+%28Out%29", "csv");
  table11_33In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC11.33+%28In%29", "csv");
  table11_33Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2019-02-04T00%3A00&rToDate=2019-02-10T23%3A59%3A59&rFamily=people&rSensor=+PC11.33+%28Out%29", "csv");

  println(table01_11In.getRowCount() == table09_26In.getRowCount());
  println(table09_26In.getRowCount() == table11_33In.getRowCount());
}


void draw() {
  background(250);
  textSize(30);
  fill(0);
  image(img, 0, 0);
  drawBush(111, 619, 37, level1Counter);
  //drawBush(292, 556, 22, int(random(70)));
  //drawBush(234, 499, 10, int(random(70)));
  //drawBush(122, 474, 35, int(random(70)));
  //drawBush(265, 400, 25, int(random(70)));
  drawBush(118, 372, 39, level9Counter);
  //drawBush(125, 259, 39, int(random(70)));
  //drawBush(254, 275, 38, int(random(70)));
  //drawBush(251, 275, 38, int(random(70)));
  //drawBush(258, 150, 38, int(random(70)));
  //drawBush(251, 275, 38, int(random(70)));
  drawBush(188, 71, 38, level11Counter);
  delay(200);
  
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
