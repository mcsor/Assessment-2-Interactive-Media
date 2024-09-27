
ArrayList<Leaf> leaves = new ArrayList<Leaf>();

//Leaf_Images leafType;
String[] types = {"alder", "beech", "birch", "ash", "chestnut", "sycamore"};


// Define the Leaf class
class Leaf {
  float x, y;         // Position of the leaf
  float angle;        // Angle for swaying motion
  float swayAmount;   // Amplitude of the sway (left-right motion)
  float fallSpeed;    // Vertical falling speed
  float startingX;    // Point to sway from
  float startingY;
  float size;         // Leaf Size
  float maxSize;      // for calculation of leaf growth
  String type;        //Type of leaf based on the Leaf Images class
  float rotation;     //Rotation of the leaf
  String ID;          //ID for knowing which floor the leaf is on
  boolean isFalling;  //Determines if the leaf is in the falling stage for 
  int age;            //how many iterations
  color colour;       //leaf colour
  int red = 100;
  int green = 255;
  int blue = 100;

  int opacity = 255;

  Leaf(float x, float y, float swayAmount, float fallSpeed, float size, String id) {
    this.x = x;
    this.startingX = x;
    this.y = y;
    this.startingY = y;
    this.size = size;
    this.maxSize = size;
    this.angle = 0;             // Start angle for swaying
    this.swayAmount = swayAmount;
    this.fallSpeed = fallSpeed;
    this.type = types[int(random(0,types.length-1))];
    this.rotation = random(0,180);
    this.ID = id;
    this.isFalling = false;
    this.age = 0;
    this.colour = color(this.red,this.green,this.blue, this.opacity);
  }
}

void drawLeaf() {

  applyFalling();
  // Call the function to apply falling and swaying to the leaf
  for (int i = 0; i < leaves.size(); i++) {
    Leaf leaf = leaves.get(i);
    if (leaf.isFalling) {
      falling(leaf);
      shrinkLeaf(leaf);
    }
    removeLeaf(leaf);
    
    fill(leaf.colour);

    leaf.age++;
    growLeaf(leaf);
    
    if (leaf.ID == "falling") {
     drawLeaf(mapToScreenX(leaf.x), mapToScreenY(leaf.y), leaf.rotation + 20*sin(leaf.angle), leaf.size, "birch");
    }
    else {
      drawLeaf(mapToScreenX(leaf.x), mapToScreenY(leaf.y), leaf.rotation + 20*sin(leaf.angle), leaf.size, "birch");
    }
    
  }
  
}






// Function to apply falling and swaying to a Leaf object
void falling(Leaf leaf) {
  // Calculate swaying motion using sine wave
  float sway = sin(leaf.angle) * leaf.swayAmount;
  // Update leaf position
  leaf.x = leaf.startingX + sway;
  leaf.y += leaf.fallSpeed;
  
  
  constrain(leaf.red, 0, 255);
  leaf.red += 20;
  constrain(leaf.blue, 0, 255);
  leaf.blue -=5;
  constrain(leaf.green, 30, 255);
  leaf.green -=3;
  constrain(leaf.opacity, 0, 255);
  
  leaf.colour = color(leaf.red, leaf.green, leaf.blue, leaf.opacity);

  //fill(leaf.colour);
  // Update the angle for swaying motion
  leaf.angle += 0.2;
  
  removeLeaf(leaf);
}



//creating Leaves when there is a new person/people on the floor
void createLeaf() {

    if (level1Counter > prevLevel1Counter) {
      
      for (int i = prevLevel1Counter; i < level1Counter; i++) {
        // create leaves with parameters (x-pos, y-pos, swayAmount, fallSpeed, size, ID)
        //leaves.add(new Leaf(random(width/4.9,width/2.717), random(height/2.1,height/1.41), random(10,20), random(4.0,5), random(1.2,1.8), "F1"));
        leaves.add(new Leaf(random(191,360), random(476,726), random(10,20), random(4.0,5), random(1.2,1.8), "F1"));
      }
  }
    if (level9Counter > prevLevel9Counter) {
        for (int i = prevLevel9Counter; i < level9Counter; i++) {
          leaves.add(new Leaf(random(width/1.56,width/1.268), random(height/2.96,height/1.71), 20, random(4.0,5), random(1.2,1.8), "F9"));
      }
    
    }
    if (level11Counter > prevLevel11Counter) {
      for (int i = prevLevel11Counter; i < level11Counter; i++) {
          leaves.add(new Leaf(random(width/3.4,width/2.16), random(height/10.75,height/4.166), 20, random(4.0,5), random(1.2,1.8), "F11"));
      }
    
    }
      
}

//removing leaves when they get to the bottom of the screen
void removeLeaf(Leaf fallingLeaf) {
  if (fallingLeaf.y > (fallingLeaf.startingY + height/5)) {
    leaves.remove(fallingLeaf);  
  
  } 
}



//Select a random leaf to drop from a floor - representing somebody leaving
Leaf randomLeaf(String targetID) {
  // Create a temporary list to store leaves with the matching ID
  ArrayList<Leaf> matchingLeaves = new ArrayList<Leaf>();

  // Iterate through the list of leaves and collect those with the matching ID
  for (Leaf leaf : leaves) {
    if (leaf.ID.equals(targetID)) {
      matchingLeaves.add(leaf);
    }
  }

  // If there are no matching leaves, return null or handle accordingly
  if (matchingLeaves.size() == 0) {
    return null;
  }

  // Select a random leaf from the matching leaves list
  int randomIndex = int(random(0, matchingLeaves.size()));
  matchingLeaves.get(randomIndex).ID = "falling";
  return matchingLeaves.get(randomIndex);
  

}


//apply falling to a leaf when someone leaves a floor
void applyFalling() {
  if (level1Counter < prevLevel1Counter) {
    for (int i = prevLevel1Counter; i > level1Counter; i--) {
      randomLeaf("F1").isFalling = true;
    }
  }
  if (level9Counter < prevLevel9Counter) {
    for (int i = prevLevel9Counter; i > level9Counter; i--) {
      randomLeaf("F9").isFalling = true;
    }
  }
  if (level11Counter < prevLevel11Counter) {
    for (int i = prevLevel11Counter; i > level11Counter; i--) {
      randomLeaf("F11").isFalling = true;
    }
  }

}

//growing the leaf when it is first created
void growLeaf(Leaf leaf) {

  if (leaf.age < 5) {
   leaf.size = leaf.maxSize/(5-leaf.age); 
  }
  
  else {
   leaf.size = leaf.maxSize;
  }
   
}

// Function to gradually shrink the leaf size when it is falling
void shrinkLeaf(Leaf leaf) {
  // Decrease the size gradually while the leaf is falling
  if (leaf.size > 0.1) {
    leaf.size -= 0.15; // Adjust the decrement value to control shrink rate
  } else {
    leaf.size = 0.1;  // Minimum size to prevent negative values
  }
}
