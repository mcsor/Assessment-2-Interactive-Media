// import libraries
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;

// UI functions

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
  } 
  else if (theEvent.isController()) {
    float level = theEvent.getController().getValue();
    if (level == 0.0) {
      println("Level 1");
      levelNum = 1;
    } else if (level == 1.0) {
      println("Level 9");
      levelNum = 9;
    } else if (level == 2.0) {
      println("Level 11");
      levelNum = 11;
    }
    
    println("levelNum = " + levelNum);
    
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
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
  } catch (ParseException e) {
    println("Error parsing date: " + e.getMessage());
  }
  
  //println("date = " + newDate);
  println("time = " + time);
}
