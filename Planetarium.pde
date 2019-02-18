Planet[] planets;
float starAngle;
PImage backgroundImage;
Rocket rocket;

void setup() {
  size(1200, 800, P3D);
  imageMode(CENTER);
  backgroundImage = loadImage("images/universe.jpg");
  rocket = new Rocket(50);
  starAngle = 0;

  planets = new Planet[5];

  planets[0] = new Planet("Mercury", 0.2, -35, 2, 0.11, "x", "");
  planets[1] = new Planet("Venus", 0.35, 24, 1.5, 0.15, "y", "");
  planets[2] = new Planet("Earth", 0.25, 104, 1, 0.17, "z", "moon");
  planets[3] = new Planet("Mars", 0.32, -5, 0.74, 0.2, "x", "");
  planets[4] = new Planet("Jupiter", 0.45, -67, 0.66, 0.22, "y", "");
}

void draw() {
  background(0);
  showTextMessages();

  pushMatrix();
  translate(mouseX, mouseY, -1000);
  image(backgroundImage, 0, 0);
  popMatrix();

  translate(width / 2, height / 2, 0);

  pushMatrix();
  rotateX(radians(-35));
  rotateY(radians(starAngle));
  scale(0.5);
  sphere(100);

  textSize(60);
  translate(-80, -125, 0);
  text("SUN", 0, 0, 0);  
  popMatrix();

  starAngle += 0.25;

  for (Planet planet : planets) planet.show();

  rocket.show();

  if (keyPressed) {
    if (key == 'w' || key == 'W') rocket.move(0, -10, 0);
    if (key == 's' || key == 'S') rocket.move(0, 10, 0);
    if (key == 'a' || key == 'A') rocket.move(-10, 0, 0);
    if (key == 'd' || key == 'D') rocket.move(10, 0, 0);
    if (key == CODED) {
      if (keyCode == UP)
        rocket.move(0, 0, -10);
      if (keyCode == DOWN)
        rocket.move(0, 0, 10);
    }
  }
}

void showTextMessages() {
  textSize(20);
  text("You can move the universe's wallpaper with the mouse.", 10, 30, 0);
  text("You can move the box with the keyboard.", 10, 60, 0);
  text("To move right/left press d/a", 10, 90, 0);
  text("To move up/down press w/s", 10, 120, 0);
  text("To move forward/backward press DOWN/UP", 10, 150, 0);
}
