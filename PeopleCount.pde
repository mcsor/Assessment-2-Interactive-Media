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



int peopleOnFloor(Table in, Table out) {
  int counter = 0;
  if (i < in.getRowCount()) {
    int peopleIn = in.getInt(i, 1);
    int peopleOut =out.getInt(i, 1);
    counter = peopleIn - peopleOut;
  }
  return counter;
}
