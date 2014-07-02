import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress yunaddr;

void setup() {
  size(200, 200);
  oscP5 = new OscP5(this, 11000);
  yunaddr = new NetAddress("arduino.local", 10000); 
}

void draw() {
  background(100, 0, 100);
}

void keyPressed() { // click the window to send the OSC message

  switch (key) {
  case 'b':
    send_rgb_blob();
    break;  
  }
}

void send_rgb_blob() {
  byte[] bb;
  bb = new byte[6];

  bb[0]= (byte) 200;
  bb[1]= (byte) 150;
  bb[2]= (byte) 100;
  bb[3]= (byte) 10;
  bb[4]= (byte) 100;
  bb[5]= (byte) 255;

  OscMessage msg = new OscMessage("/blob");
  msg.add(bb); 
  msg.print();

  oscP5.send(msg, yunaddr);
  //msg.print();
}
