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
  oscP5 = new OscP5(this, 7771); // Start listening for incoming messages at port 7771
  song = new SoundFile(this, "rainforest.wav");
  song.play();


  try { // Try and create a new robot named bob
    bob = new Robot();
  }
  catch (AWTException e) { // If there is an error, print it out to the console
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
  // Print the address and typetag of the message to the console
  // println("OSC Message received! The address pattern is " + theMessage.addrPattern() + ". The typetag is: " + theMessage.typetag());

  // Check for Attention messages only
  //println(theMessage);
  /*if (theMessage.checkAddrPattern("/signal") == true) {
   currentSignal = theMessage.get(0).floatValue();
   println("The signal quality is at: " + currentSignal);
   }*/

  if (theMessage.checkAddrPattern("/meditation") == true) {
    meditation = theMessage.get(0).floatValue();
    //println("Your attention is at: " + meditation);
  }
}
