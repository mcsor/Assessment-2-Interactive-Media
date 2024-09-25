float tx, ty;
float tw, th;
float scale;
float xratio, yratio;
float minScale, maxScale;
float newScale;
float zoomFactor;

void initZoom() {
  xratio = float(width) / img.width;
  yratio = float(height) / img.height;
  
  //minumum scale is calculated to prevent texture wrapping
  minScale = max(xratio, yratio);
  maxScale = 5;
  
  //start zoomed out
  scale = minScale;
}

void drawZoom() {
  //calculate width/height of the region of interest in the texture
  tw = img.width / scale * xratio;
  th = img.height / scale * yratio;
  
  //limit the left-top texcoords to prevent texture wrapping
  tx = constrain(tx, 0, img.width-tw);
  ty = constrain(ty, 0, img.height-th);
 
  //draw textured rectangle 
  beginShape();
  texture(img);
  vertex(0, 0, tx, ty);
  vertex(width, 0, tx+tw, ty);
  vertex(width, height, tx+tw, ty+th);
  vertex(0, height, tx, ty+th);
  endShape();
}

void mouseDragged() {
  //move left-top texcoord using scaled mouse delta
  tx -= (mouseX-pmouseX)/scale;
  ty -= (mouseY-pmouseY)/scale;
}

void mouseWheel(MouseEvent event) {
  //zoom factor needs to be between about 0.99 and 1.01 to be able to multiply so add 1
  zoomFactor = -event.getCount()*.05 + 1; 
  newScale = constrain(scale * zoomFactor, minScale, maxScale);
  
  //next two lines are the most important lines of the code.
  //subtract mouse in 'old' scale from mouse in 'new' scale and apply that to position.
  tx -= (mouseX/newScale - mouseX/scale);
  ty -= (mouseY/newScale - mouseY/scale);
  scale = newScale;
}

float mapToScreenX(float imgX) {
  return (imgX - tx) * (width / tw);
}

// Function to map the bush's y-coordinate from the original image to the screen based on zoom and pan
float mapToScreenY(float imgY) {
  return (imgY - ty) * (height / th);
}
