Table table01_11In;
Table table01_11Out;
Table table01_12In;
Table table01_12Out;
Table table01_13In;
Table table01_13Out;

Table table09_26In;
Table table09_26Out;
Table table09_27In;
Table table09_27Out;
Table table09_28In;
Table table09_28Out;
Table table09_29In;
Table table09_29Out;

Table table11_31In;
Table table11_31Out;
Table table11_32In;
Table table11_32Out;
Table table11_33In;
Table table11_33Out;

int level1Counter = 0;
int level9Counter = 0;
int level11Counter = 0;
int i = 0;
String time;

void setup() {
  frameRate(2);
  size(400, 400);
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
  background(255);
  textSize(30);
  fill(0);
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
  text("Time: " +  time, 20, 50);
  text("People on floor 1: " + level1Counter, 20, 100);
  text("People on floor 9: " + level9Counter, 20, 150);
  text("People on floor 11: " + level11Counter, 20, 200);
}

int peopleOnFloor(Table in, Table out) {
  int counter = 0;
  if (i < in.getRowCount()) {
    int peopleIn = in.getInt(i, 1);
    int peopleOut =out.getInt(i, 1);
    counter = peopleIn - peopleOut;
  }
  return counter;
}
