PImage img;

void setup() {
  size(380, 700);
  img = loadImage("tree.png", "png");
  img.resize(0, 700);
  image(img, 0, 0);
}

void draw() {
  image(img, 0, 0);
  drawBush(111, 619, 37, int(random(70)));
  drawBush(292, 556, 22, int(random(70)));
  drawBush(234, 499, 10, int(random(70)));
  drawBush(122, 474, 35, int(random(70)));
  drawBush(265, 400, 25, int(random(70)));
  drawBush(118, 372, 39, int(random(70)));
  drawBush(125, 259, 39, int(random(70)));
  drawBush(254, 275, 38, int(random(70)));
  drawBush(251, 275, 38, int(random(70)));
  drawBush(258, 150, 38, int(random(70)));
  drawBush(251, 275, 38, int(random(70)));
  drawBush(188, 71, 38, int(random(70)));
  delay(200);
  
  //drawLeaf(200, 200, 120, 10,  "beech");
 
}
