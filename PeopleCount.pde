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

Boolean isLoaded = false; //check if data is loaded
String toDate = "2019-02-10";
String fromDate = "2019-02-04";


int peopleOnFloor(Table in, Table out) {
  int counter = 0;
  if (i < in.getRowCount()) {
    int peopleIn = in.getInt(i, 1);
    int peopleOut =out.getInt(i, 1);
    counter = peopleIn - peopleOut;
  }
  return counter;
}

void dumpTables() //Unloads all tables
{
  table01_11In.clearRows();
  table01_11Out.clearRows();
  table01_12In.clearRows();
  table01_12Out.clearRows();
  table01_13In.clearRows();
  table01_13Out.clearRows();
  table09_26In.clearRows();
  table09_26Out.clearRows();
  table09_27In.clearRows();
  table09_27Out.clearRows();
  table09_28In.clearRows();
  table09_28Out.clearRows();
  table09_29In.clearRows();
  table09_29Out.clearRows();
  table11_31In.clearRows();
  table11_31Out.clearRows();
  table11_32In.clearRows();
  table11_32Out.clearRows();
  table11_33In.clearRows();
  table11_33Out.clearRows();
}

void loadData()
{
  if (isLoaded == true)
  {
    dumpTables();
  }
  table01_11In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC01.11+%28In%29", "csv");
  table01_11Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC01.11+%28Out%29", "csv");
  table01_12In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC01.12+%28In%29", "csv");
  table01_12Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC01.12+%28Out%29", "csv");
  table01_13In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC01.13+%28In%29", "csv");
  table01_13Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC01.13+%28Out%29", "csv");

  //level 9 data (4. of febuary 2019 to 10. of february)
  table09_26In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC09.26+%28In%29", "csv");
  table09_26Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC09.26+%28Out%29", "csv");
  table09_27In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC09.27+%28In%29", "csv");
  table09_27Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC09.27+%28Out%29", "csv");
  table09_28In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC09.28+%28In%29", "csv");
  table09_28Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC09.28+%28Out%29", "csv");
  table09_29In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC09.29+%28In%29", "csv");
  table09_29Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC09.29+%28Out%29", "csv");

  //level 11 data (4. of febuary 2019 to 10. of february)
  table11_31In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC11.31+%28In%29", "csv");
  table11_31Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC11.31+%28Out%29", "csv");
  table11_32In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC11.32+%28In%29", "csv");
  table11_32Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC11.32+%28Out%29", "csv");
  table11_33In = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC11.33+%28In%29", "csv");
  table11_33Out = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate="+fromDate+"T00%3A00&rToDate="+toDate+"T23%3A59%3A59&rFamily=people&rSensor=+PC11.33+%28Out%29", "csv");
  isLoaded = true;
}
