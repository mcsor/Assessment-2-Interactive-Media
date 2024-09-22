
ArrayList<Leaf> leaves = new ArrayList<Leaf>();

Leaf_Images leafType;
String[] types = {"alder", "beech", "birch", "ash", "chestnut", "sycamore"};


// Define the Leaf class
class Leaf {
  float x, y;         // Position of the leaf
  float angle;        // Angle for swaying motion
  float swayAmount;   // Amplitude of the sway (left-right motion)
  float fallSpeed;    // Vertical falling speed
  float size;         // Size of the leaf
  float startingX;    // Point to sway from
  String type;        //Type of leaf based on the Leaf Images class
  float rotation;     //Rotation of the leaf

  Leaf(float x, float y, float swayAmount, float fallSpeed, float size) {
    this.x = x;
    this.startingX = x;
    this.y = y;
    this.angle = 0;             // Start angle for swaying
    this.swayAmount = swayAmount;
    this.fallSpeed = fallSpeed;
    this.size = size;
    this.type = types[int(random(0,types.length-1))];
    this.rotation = random(0,180);
  }
}

Leaf myLeaf;

void setupLeaf() {
  int numLeaves = 10;
  size(400, 400);
  
  leafType = new Leaf_Images();
  
  for (int i = 0; i < numLeaves; i++) {
    // create leaves with parameters (x-pos, y-pos, swayAmount, fallSpeed, size)
    leaves.add(new Leaf(random(0, width), random(0, height/8), 20, random(1.5,2), 100));
  }
}

void drawLeaf() {
  background(255);
  
  // Call the function to apply falling and swaying to the leaf
  for (Leaf leaf : leaves) {
    applyFalling(leaf);
  }
}

// Function to apply falling and swaying to a Leaf object
void applyFalling(Leaf leaf) {
  // Calculate swaying motion using sine wave
  float sway = sin(leaf.angle) * leaf.swayAmount;
  // Update leaf position
  if (leaf.y < height - height/20) {
    leaf.x = leaf.startingX + sway;
    leaf.y += leaf.fallSpeed;
  }
  // Draw the leaf (circle placeholder)
  fill(0, 250, 155);
  noStroke();
  
  //draw leaf with parameters (x, y, rotation, size, type of leaf)
  leafType.drawLeaf(leaf.x, leaf.y, leaf.rotation + 15*sin(leaf.angle), 2, leaf.type);
  // Update the angle for swaying motion
  leaf.angle += 0.03;  
}
