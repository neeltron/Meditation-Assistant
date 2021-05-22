import controlP5.*;
import processing.sound.*;
import oscP5.*;
import java.awt.*;
import java.awt.Toolkit;

SoundFile song;
ControlP5 cp5;
OscP5 oscP5;
Robot bob; 

String[] textfieldNames = {"username"};

PImage bg;
PImage icon;
PImage play;
PImage caricature;

String username;

int screenNo = 0;
float meditation = 75;
float volume;
int plotX = 400;
int flagcheck = 0;
int time;
int delay = 1000;
int seconds = 0;
int minutes = 0;

void setup() {
  size(1600, 1000);
  bg = loadImage("bg.jpg");
  icon = loadImage("over.png");
  caricature = loadImage("caric.png");
  play = loadImage("play.png");
  volume = 0;
  time = millis();
  song = new SoundFile(this, "../../Desktop/rainforest.wav");
  cp5 = new ControlP5(this);
  oscP5 = new OscP5(this, 7771);
  try {
    bob = new Robot();
  }
  catch (AWTException e) {
    e.printStackTrace();
  }
  if (screenNo == 3) {
    flagcheck = 1;
    background(bg);
    fill(255, 196, 145);
    stroke(255, 196, 145);
    rect(400, 100, 800, 800, 50);
    song.play();
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
    if (millis() - time >= delay) {
      time = millis();
      seconds++;
      if(seconds % 60 == 0) {
        minutes++;
        seconds = 0;
      }
    }
    fill(255, 196, 145);
    stroke(255, 196, 145);
    rect(430, 120, 200, 100);
    fill(0);
    stroke(0);
    text("Timer: " + str(minutes) + ":" + str(seconds), 430, 160);
    strokeWeight(3);
    rect(plotX, 1000 - meditation * 5, 10, meditation * 5 - 100);
    volumeControl(meditation);
    if (plotX == 1200) {
      flagcheck = 0;
      plotX = 400;
    }
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

void volumeControl(float med) {
  volume = map(med, 0, 100, 0.8, 0.05);
  song.amp(volume);
}

void oscEvent(OscMessage theMessage) {
  if (theMessage.checkAddrPattern("/meditation") == true) {
    meditation = theMessage.get(0).floatValue();
  }
}
