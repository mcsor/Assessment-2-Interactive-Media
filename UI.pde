// import libraries
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;

DropdownList levels;
DropdownList startDateChooser;
DropdownList endDateChooser;
Button button;
// UI functions

void setupUI() {
  cp5 = new ControlP5(this);
  
  // create dropdown list for floor levels
  levels = cp5.addDropdownList("levels")
    .setPosition(875, 25)
    .setLabel("Level Selection")
    ;
    
  DropdownList startDateChooser = cp5.addDropdownList("fromDate")
    .setPosition(875, 125)
    .setBarHeight(30)
    .setItemHeight(20)
    .addItem("2019-02-04",0)
    .addItem("2019-02-05",1)
    .addItem("2019-02-06",2);

  // Create dropdown list for end date (toDate)
  DropdownList endDateChooser = cp5.addDropdownList("toDate")
    .setPosition(875, 225)
    .setBarHeight(30)
    .setItemHeight(20)
    .addItem("2019-02-10", 0)
    .addItem("2019-02-11", 1)
    .addItem("2019-02-12", 2);

  // Set initial date selection
  startDateChooser.setValue(0);  // Select first item by default
  endDateChooser.setValue(0);
    
  button = cp5.addButton("reset")
    .setPosition(875,325)
    .onPress(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      println(fromDate + ": "+toDate);
      loadData();   //re-loads the tables
      i = 0;
      }
    }
  )
  ;
  
    button = cp5.addButton("Pause")
    .setPosition(800,50)
    .onPress(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      isPaused = true;
    }
  }
  );
  
    button = cp5.addButton("Play")
    .setPosition(800,25)
    .onPress(new CallbackListener() {
    public void controlEvent(CallbackEvent event) {
      isPaused = false;
    }
  }
  );
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
  ddl.addItem("Full Tree", 3);

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
  } else if (theEvent.isController() && theEvent.getController().getName().equals("levels")) {
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
     if (theEvent.isFrom("fromDate")) {
    float date = theEvent.getController().getValue();
    switch (int(date))
    {
     case 0:
     fromDate = "2019-02-04";
     break;
     case 1:
     fromDate = "2019-02-05";
     break;
     case 2:
     fromDate = "2019-02-06";
     break;
    }
    println("Selected fromDate: " + fromDate);
  }

  // Handle the end date dropdown
  if (theEvent.isFrom("toDate")) {
    float date = theEvent.getController().getValue();
    switch(int(date))
    {
     case 0:
     toDate = "2019-02-10";
     break;
     case 1:
     toDate = "2019-02-11";
     break;
     case 2:
     toDate = "2019-02-12";
     break;
    }
    
    println("Selected toDate: " + toDate);
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
