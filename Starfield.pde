Particle[] parts = new Particle[1000];
boolean start = false;

void setup()
{
  size(400, 600);
  for (int i = 0; i < parts.length; i++) {
    parts[i] = new Particle();
  }
  parts[0] = new OddballParticle();
}

void draw()
{
  background(40, 30, 20);
  for (int i = parts.length - 1; i >= 0; i--) {
    parts[i].move();
    parts[i].show();
  }
}

void mousePressed() {
  start = true;
  for (int i = 1; i < parts.length; i++) {
    parts[i].myX = mouseX;
    parts[i].myY = mouseY;
    parts[i].myAngle = Math.random() * 2 * Math.PI; 
    parts[i].mySpeed = Math.random() * 6;          
  }
}

class Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  
  Particle() {
    myX = 200;
    myY = 200;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = 0;
    
    myColor = color((int)(Math.random() * 100) + 155, (int)(Math.random() * 100) + 155, (int)(Math.random() * 100));
  }
  
  void move() {
    if (start) {
      mySpeed += 0.00005; 
      myX += Math.cos(myAngle) * mySpeed;
      myY += Math.sin(myAngle) * mySpeed;
    } else {
      myX = mouseX;
      myY = mouseY;
    }
  }
  
  void show() {
    if (start) {
      fill(myColor, 180);
      noStroke();
      ellipse((float)myX, (float)myY, 6, 6);
    }
  }
}

class OddballParticle extends Particle
{
  OddballParticle() {
    super();
    myColor = color(110, 75, 45);
  }
  
  void move() {
    myX = mouseX;
    myY = mouseY;
  }
  
  void show() {
    fill(myColor);
    stroke(70, 45, 20); 
    strokeWeight(2);
    ellipse ((float)myX, (float)myY, 24, 20);
  }
}
