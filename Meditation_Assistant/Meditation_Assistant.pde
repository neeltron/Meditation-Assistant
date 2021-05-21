PImage bg;
PImage icon;
void setup() {
  size(1600, 1000);
  bg = loadImage("bg.jpg");
  icon = loadImage("over.png");
}
void draw() {
  background(bg);
  fill(255, 196, 145);
  rect(400, 100, 800, 800, 100);
  image(icon, 575, 150);
  fill(0);
  textSize(32);
  text("Welcome to Meditation Assistant!", 550, 600);
}
