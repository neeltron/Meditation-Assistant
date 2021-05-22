
import oscP5.*;
import java.awt.*;
import java.awt.Toolkit;


OscP5 oscP5;
Robot bob;  


float meditation;

void setup(){
  meditation = 0;
  oscP5 = new OscP5(this, 7771); // Start listening for incoming messages at port 7771

  try { // Try and create a new robot named bob
    bob = new Robot();
  }
  catch (AWTException e) { // If there is an error, print it out to the console
    e.printStackTrace();
  }
}


void draw(){
  println(meditation);  
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
