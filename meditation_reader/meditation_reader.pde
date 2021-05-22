import processing.sound.*;
import oscP5.*;
import java.awt.*;
import java.awt.Toolkit;

SoundFile song;
OscP5 oscP5;
Robot bob;  

float meditation;
float volume;

void setup() {
  volume = 0;
  meditation = 0;
  oscP5 = new OscP5(this, 7771);
  song = new SoundFile(this, "../../Desktop/rainforest.wav");
  song.play();
  try {
    bob = new Robot();
  }
  catch (AWTException e) {
    e.printStackTrace();
  }
}

void draw() {
  println(meditation);  
  volumeControl(meditation);
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
