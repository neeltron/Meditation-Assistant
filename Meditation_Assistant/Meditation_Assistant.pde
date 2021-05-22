import controlP5.*;
ControlP5 cp5;

String[] textfieldNames = {"username"};

PImage bg;
PImage icon;
String username;
int screenNo;

void setup() {
  screenNo = 0;
  size(1600, 1000);
  bg = loadImage("bg.jpg");
  icon = loadImage("over.png");
  cp5 = new ControlP5(this);
  background(bg);
  fill(255, 196, 145);
  stroke(255, 196, 145);
  rect(400, 100, 800, 800, 100);
  image(icon, 575, 150);
  fill(0);
  textSize(32);
  text("Welcome to Meditation Assistant!", 550, 600);
  for(String name: textfieldNames){
    cp5.addTextfield(name)
       .setPosition(600,650)
       .setSize(400,40)
       .setFont(createFont("arial", 20))
       .setFocus(true)
       .setColor(0)
       .setColorBackground(0xffffffff)
       ;
     cp5.addButton("submit")
       .setPosition(800, 750)
       .setSize(100, 40)
       .setValue(0)
       .activateBy(ControlP5.RELEASE)
       ;
  }
}
void draw() {
  if(screenNo == 2) {
    cp5.get("username").hide();
    cp5.get("submit").hide();
    background(bg);
    println(username);
  }
}
void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
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