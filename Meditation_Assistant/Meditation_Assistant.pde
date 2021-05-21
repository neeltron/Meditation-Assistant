PImage bg;
void setup() {
  size(1600, 1000);
  bg = loadImage("bg.jpg");
}
void draw() {
  background(bg);
  fill(253, 142, 75);
  rect(400, 100, 800, 800, 100);
}
