int numLeaves = 10;
ArrayList<Leaf> leaves = new ArrayList<Leaf>();
PImage leafImage;

// Define the Leaf class
class Leaf {
  float x, y;         // Position of the leaf
  float angle;        // Angle for swaying motion
  float swayAmount;   // Amplitude of the sway (left-right motion)
  float fallSpeed;    // Vertical falling speed
  float size;         // Size of the leaf
  float startingX;    // Point to sway from

  Leaf(float x, float y, float swayAmount, float fallSpeed, float size) {
    this.x = x;
    this.startingX = x;
    this.y = y;
    this.angle = 0;             // Start angle for swaying
    this.swayAmount = swayAmount;
    this.fallSpeed = fallSpeed;
    this.size = size;
  }
}

Leaf myLeaf;

void setup() {
  size(400, 400);
  
  //leafImage = loadImage("Name of Leaf Image File");
  
  
  for (int i = 0; i < numLeaves; i++) {
    // create leaves with parameters (x-pos, y-pos, swayAmount, fallSpeed, size)
    leaves.add(new Leaf(random(0, width), random(0, height/8), random(50), random(1.5,2), random(15,20)));
  }
}

void draw() {
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
  ellipse(leaf.x, leaf.y, leaf.size, leaf.size);
  //image(leafImage, leaf.x, leaf.y, leaf.size, leaf.size);
  
  // Update the angle for swaying motion
  leaf.angle += 0.03;  
}

void mousePressed() {
leaves.add(new Leaf(random(0, width), random(0, height/8), random(50), random(1.5,2), random(15,20)));
};
