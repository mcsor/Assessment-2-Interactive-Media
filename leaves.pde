
void drawLeaf(float x, float y, float rotation, float size, String leafType) {
  if (leafType == "alder") {
    float leafWidth = 14*size;
    float leafLength = 20*size;
    float stemLength = 0.8*size;
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    beginShape();
    vertex(0, 0);
    vertex(0, leafLength);
    ellipse(0, leafLength*0.63, leafWidth, leafLength*0.75);
    endShape();
    popMatrix();
  }
  if (leafType == "beech") {
    float leafWidth = 18*size;
    float leafLength = 20*size;
    float stemLength = 1*size;
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    beginShape();
    vertex(0, 0);
    vertex(0, leafLength);
    bezierVertex(leafWidth, -stemLength, -leafWidth, -stemLength, 0, +leafLength);
    endShape();
    popMatrix();
  }
  if (leafType == "birch") {
    float leafWidth = 26*size;
    float leafLength = 20*size;
    float stemLength = 0.8*size;
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    beginShape();
    vertex(0, 0);
    vertex(0, leafLength);
    bezierVertex(leafWidth, -stemLength, -leafWidth, -stemLength, 0, +leafLength);
    endShape();
    popMatrix();
  }
  if (leafType == "ash") {
    float leafLength = 12*size;
    float smallLeafSize = 0.3*size;
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    drawLeaf(0, leafLength, -9, smallLeafSize, "beech");
    drawLeaf(0, leafLength, 84, smallLeafSize, "beech");
    drawLeaf(0, leafLength, 276, smallLeafSize, "beech");
    drawLeaf(0, leafLength*0.7, 82, smallLeafSize, "beech");
    drawLeaf(0, leafLength*0.7, 272, smallLeafSize, "beech");
    drawLeaf(0, leafLength*0.4, 79, smallLeafSize, "beech");
    drawLeaf(0, leafLength*0.4, 278, smallLeafSize, "beech");
    beginShape();
    vertex(0, leafLength);
    vertex(0, 0);
    endShape();
    popMatrix();
  }
  if (leafType == "chestnut") {
    float leafLength = 8*size;
    float smallLeafSize = 0.5*size;
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    drawLeaf(0, leafLength, 0, smallLeafSize, "beech");
    drawLeaf(0, leafLength*0.5, 48, smallLeafSize, "beech");
    drawLeaf(0, leafLength*0.5, 312, smallLeafSize, "beech");
    drawLeaf(0, leafLength*0.5, 120, smallLeafSize*0.5, "beech");
    drawLeaf(0, leafLength*0.5, 240, smallLeafSize*0.5, "beech");
    beginShape();
    vertex(0, leafLength);
    vertex(0, 0);
    endShape();
    popMatrix();
  }
  if (leafType == "sycamore") {
    float leafWidth = 14*size;
    float leafLength = 18*size;
    float stemLength = 4*size;
    pushMatrix();
    translate(x, y);
    rotate(radians(rotation));
    beginShape();
    vertex(0, leafLength);
    vertex(-leafWidth*0.2, leafLength*0.70);
    vertex(-leafWidth*0.5, leafLength*0.8);
    vertex(-leafWidth*0.3, leafLength*0.45);
    vertex(-leafWidth*0.5, leafLength*0.3);
    vertex(0, stemLength);
    vertex(0, leafLength);
    vertex(leafWidth*0.2, leafLength*0.70);
    vertex(leafWidth*0.5, leafLength*0.8);
    vertex(leafWidth*0.3, leafLength*0.45);
    vertex(leafWidth*0.5, leafLength*0.3);
    vertex(0, stemLength);
    vertex(0, 0);
    endShape(CLOSE);
    line(0, leafLength*0.4, -leafWidth*0.5, leafLength*0.8);
    line(0, leafLength*0.4, -leafWidth*0.5, leafLength*0.3);
    line(0, leafLength*0.4, leafWidth*0.5, leafLength*0.8);
    line(0, leafLength*0.4, leafWidth*0.5, leafLength*0.3);
    popMatrix();
  }
}

void drawBush(int x, int y, int bushRadius, int leafCount) {
  //randomSeed(leafCount*bushRadius);
  float rotation = 0;
  float rotationAmount = 360/map(leafCount, 1, 500, 1, 360);
  String[] leafTypes = {"ash", "beech", "birch", "alder", "chestnut", "sycamore"};
  for (int i = 0; i < leafCount; i++) {
    String leafType = leafTypes[int(random(0, leafTypes.length))];
    fill(81, random(50, 255), random(84, 88));
    drawLeaf(x+random(-bushRadius, bushRadius), y+random(-bushRadius, bushRadius), rotation, 1.5, leafType);
    rotation += rotationAmount;
  }
}
