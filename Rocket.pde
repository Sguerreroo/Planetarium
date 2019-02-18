class Rocket {

  float dimension, shiftX, shiftY, shiftZ;
  
  Rocket(float dimension) {
    this.dimension = dimension;
    this.shiftX = -100;
    this.shiftY = -100;
    this.shiftZ = 0;
  }
  
  void show() {
    pushMatrix();
    translate(shiftX, shiftY, shiftZ);
    box(this.dimension);
    
    textSize(20);
    translate(-this.dimension / 2, -this.dimension, 0);
    text("Rocket", 0, 0, 0); 
    popMatrix();
  }
  
  void move(float x, float y, float z) {
    this.shiftX += x;
    this.shiftY += y;
    this.shiftZ += z;    
  }
  
}
