class Planet {
  
  String name, axisRotation, moon;
  float scale, inclination, speedRotation, distance, radius, angle, moonAngle;
  int direction;
  
  Planet(String name, float scale, float inclination, float speedRotation, float distance, String axisRotation, String moon) {
    this.name = name;
    this.scale = scale;
    this.inclination = inclination;
    this.speedRotation = speedRotation;
    this.distance = distance;
    this.axisRotation = axisRotation;
    this.moon = moon;
    this.radius = 100;
    this.angle = 0;
    this.moonAngle = 0;
    this.direction = chooseRandomDirection();
  }
  
  void show() {
    pushMatrix();
    if (axisRotation.equals("x")) {
      rotateX(radians(this.angle));
      translate(0, this.direction * height * this.distance, 0);
    } else if (axisRotation.equals("y")) {
      rotateY(radians(this.angle));
      translate(this.direction * width * this.distance, 0, 0);
    } else {
      rotateZ(radians(this.angle));
      translate(this.direction * width * this.distance, 0, 0);
    }
    scale(this.scale);
    sphere(this.radius);
    
    pushMatrix();
    textSize(100);
    translate(-this.radius / 2, -(this.radius + 10), 0);
    text(this.name, 0, 0, 0);
    popMatrix();
    
    if (moon.equals("moon")) {
      rotateY(radians(moonAngle));
      translate(width * 0.15, 0, 0);
      scale(0.35);
      sphere(100);
      
      textSize(200);
      translate(-this.radius / 2, -(this.radius + 10), 0);
      text("Moon", 0, 0, 0); 
      
      moonAngle += 0.5;
    }
    
    popMatrix();
    angle += speedRotation;
  }
  
}

int chooseRandomDirection() {
  return random(-1, 1) > 0 ? 1 : -1;
}
