import controlP5.*;
ControlP5 cp5;

String[] textfieldNames = {"username"};

PImage bg;
PImage icon;
PImage caricature;
String username;
int screenNo = 0;
int meditation = 75;
int plotX = 400;
int flagcheck = 0;

void setup() {
  size(1600, 1000);
  bg = loadImage("bg.jpg");
  icon = loadImage("over.png");
  caricature = loadImage("caric.png");
  cp5 = new ControlP5(this);
  if (screenNo == 3) {
    flagcheck = 1;
    background(bg);
    fill(255, 196, 145);
    stroke(255, 196, 145);
    rect(400, 100, 800, 800, 50);
    loop();
  } else {
    background(bg);
    fill(255, 196, 145);
    stroke(255, 196, 145);
    rect(400, 100, 800, 800, 100);
    image(icon, 575, 150);
    fill(0);
    textSize(32);
    text("Welcome to Meditation Assistant!", 550, 600);
    for (String name : textfieldNames) {
      cp5.addTextfield(name)
        .setPosition(600, 650)
        .setSize(400, 40)
        .setFont(createFont("arial", 20))
        .setFocus(true)
        .setColor(0)
        .setColorBackground(0xffffffff)
        ;
      cp5.addButton("submit")
        .setPosition(750, 720)
        .setSize(100, 40)
        .setFont(createFont("arial", 20))
        .setValue(0)
        .activateBy(ControlP5.RELEASE)
        ;
    }
  }
}
void draw() {
  if (screenNo == 2) {
    cp5.get("username").hide();
    cp5.get("submit").hide();
    background(255, 196, 145);
    println(username);
    image(caricature, 450, 150);
    text("Connect your headset and click anywhere to begin", 400, 600);
    if (mousePressed == true) {
      screenNo = 3;
    }
  }
  if (screenNo == 3) {
    if (flagcheck == 0) {
      setup();
    }
    plotX++;
    fill(0);
    stroke(0);
    point(plotX, 1000 - meditation * 10);
  }
}
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
      +theEvent.getName()+"': "
      +theEvent.getStringValue()
      );
    username = theEvent.getStringValue();
  }
}
void submit() {
  screenNo++;
}
