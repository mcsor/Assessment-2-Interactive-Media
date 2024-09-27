// import libraries
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;

// UI functions

void setupUI() {
  cp5 = new ControlP5(this);
  
  // create dropdown list for floor levels
  levels = cp5.addDropdownList("levels")
    .setPosition(500, 300)
    .setLabel("Level Selection")
    ;
    
  startDateChooser = cp5.addDropdownList("fromDate")
    .setPosition(500, 400)
    .setLabel("Start Date")
    ;
    
  endDateChooser = cp5.addDropdownList("toDate")
    .setPosition(500, 500)
    .setLabel("End Date")
    ;
    
  dateChooser();  
  customizeDropdown(levels);

}


void customizeDropdown(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.getCaptionLabel().set("levels");

  // value 0 = level 1
  ddl.addItem("Level 1", 0);
  // value 1 = level 9
  ddl.addItem("Level 9", 1);
  // value 2 = level 11
  ddl.addItem("Level 11", 2);
  ddl.addItem("FullTree", 3);

  //ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

void controlEvent(ControlEvent theEvent) {
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } else if (theEvent.isController()) {
    float level = theEvent.getController().getValue();


    switch (int(level)) {
      case 0:
        println("Level 1");
        levelNum = 1;
        break;
    
      case 1:
        println("Level 9");
        levelNum = 9;
        break;
    
      case 2:
        println("Level 11");
        levelNum = 11;
        break;
    
      case 3:
        println("Full Tree");
        levelNum = -99;
        break;
    }
        
        println("levelNum = " + levelNum);
    
        println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
        showFloor();
   }
}

// split time string to get date and time of data
void findTime() {
  String timeStr = table01_11In.getString(0, 0);
  String[] arrOfStr = timeStr.split(" ");
  String date = arrOfStr[0];
  String time = arrOfStr[1];

  String format = "yyyy-MM-dd HH:mm:ss";
  SimpleDateFormat sdf = new SimpleDateFormat(format);
  try {
    Date newDate = sdf.parse(timeStr);
    println("date = " + newDate);
  }
  catch (ParseException e) {
    println("Error parsing date: " + e.getMessage());
  }

  //println("date = " + newDate);
  println("time = " + time);
}

void dateChooser()
{
  // a convenience function to customize a DropdownList
  startDateChooser.setPosition(500, 400);
  startDateChooser.setBackgroundColor(color(190));
  startDateChooser.setItemHeight(20);
  startDateChooser.setBarHeight(15);
  startDateChooser.getCaptionLabel().set("start date");
  startDateChooser.addItem("2019-02-04", "2019-02-04");
  startDateChooser.addItem("2019-02-03", "2019-02-03");
  startDateChooser.addItem("2019-02-02", "2019-02-02");
  startDateChooser.addItem("2019-02-01", "2019-02-01");
  startDateChooser.setColorBackground(color(60));
  startDateChooser.setColorActive(color(255, 128));
  //startDateChooser.onPress(new CallbackListener() {
  //  public void controlEvent(CallbackEvent event) {
  //    loadData();   //re-loads the tables
  //  }
  //}
  //);


  endDateChooser.getCaptionLabel().set("end date");
  endDateChooser.setBackgroundColor(color(190));
  endDateChooser.setItemHeight(20);
  endDateChooser.setBarHeight(15);
  endDateChooser.addItem("2019-02-10", "2019-02-10");
  endDateChooser.addItem("2019-02-9", "2019-02-9");
  endDateChooser.addItem("2019-02-8", "2019-02-8");
  endDateChooser.addItem("2019-02-7", "2019-02-7");
  endDateChooser.setColorBackground(color(60));
  endDateChooser.setColorActive(color(255, 128));
  //endDateChooser.onPress(new CallbackListener() {
  //  public void controlEvent(CallbackEvent event) {
  //    loadData();   //re-loads the tables
  //  }
  //}
  //);
}
