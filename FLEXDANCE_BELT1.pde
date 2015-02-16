//Flex Sensor Movement to Sound
//Code By Samson Klitsner

/* Notes: 
 * Recieving Xbee module must be connected via serial port in order to run program
 * ableton midi-mapped file must be opened for drone section
 * Use midi stroke to map controller to keystrokes in keyevents section
 */

import themidibus.*;
import processing.serial.*;
import processing.sound.*;
import cc.arduino.*;

MidiBus myBus;
MidiBus outputBus;

Arduino xbee;
Serial myPort;

GUI[] gui;
SoundFile[] file;
SoundFile[] introSound;

//IMPORTANT: Number of sensors in use/being read
int sensors = 3;
int scene =1;
PFont font;

/////
////Virtual Midi device
/////
int note;
int velocity;

int dronePhase=1;
int pitch = 0;
int distortion = 0;
int gate = 0;
////

Sensor[] flexSensor = new Sensor[sensors];
int[] threshold = new int[sensors];
float[] amplitude = new float[sensors];
float[] introAmplitude = new float[sensors];
int[] introCounter = new int[sensors];
String[] soundFiles = new String[72];

color off = color(4, 79, 111);
color on = color(84, 145, 158);
////////////////////////////////////
///////////SCENES///////////////////
////////////////////////////////////
boolean intro=true;
boolean sceneTwo=false;
boolean sceneThree=false;
boolean droneInitialize=false;

void setup() {
  size(660, displayHeight);
  font = loadFont("MuseoSans-100-16.vlw");
  textFont(font, 16);

  // Prints out the available serial ports.
  println(Arduino.list());
  println(Serial.list());

  xbee = new Arduino(this, Arduino.list()[7], 9600);

  file = new SoundFile[sensors];
  introSound = new SoundFile[sensors];

  ///MidiBus Setup
  MidiBus.list(); 
  // myBus = new MidiBus(this, 2, 2);
  outputBus= new MidiBus(this, 0, 1);
  ////

  //Loads sound files
  for (int i = 0; i <sensors; i++) {
    file[i] = new SoundFile(this, (i+1) + ".wav");
  }
  for (int i = 0; i <sensors; i++) {
    introSound[i] = new SoundFile(this, "introSound0.wav");
  }

  //Set threshold values for each sensor to trigger:
  flexSensor[0] = new Sensor(0, 470);
  flexSensor[1] = new Sensor(1, 455);
  flexSensor[2] = new Sensor(2, 290);




  ////////////////////////////////////////////////////////////////////////////////////
  ////////Declaration of all Sound files, consolidated for better file management/////
  /////////////////////int///////////////////////////////////////////////////////////////

  ///First Sensor///  Centerpieces, Upfront pieces, Main Synths
  soundFiles[0] = "tonalNote1" ;
  soundFiles[1] = "voxChop" ;
  soundFiles[2] = "vox1" ;
  soundFiles[3] = "chorusEcho" ;

  soundFiles[4] = "bigGong" ;
  soundFiles[5] = "gamelan3" ;
  soundFiles[6] = "WN1" ;
  soundFiles[7] = "tangerine" ;

  soundFiles[8] = "brushSnare" ;
  soundFiles[9] = "trumpet1" ;
  soundFiles[10] = "squeak" ;
  soundFiles[11] = "windUp" ;

  soundFiles[12] = "guitar1" ;
  soundFiles[13] = "hardSnare" ;
  soundFiles[14] = "snareOff" ;
  soundFiles[15] = "ride" ;

  soundFiles[16] = "seaRustle" ;
  soundFiles[17] = "traffic" ;
  soundFiles[18] = "spaceBass" ;
  soundFiles[19] = "children" ;

  soundFiles[20] = "trumpet2" ;
  soundFiles[21] = "guitar1" ;
  soundFiles[22] = "radioVoices" ;
  soundFiles[23] = "micdrop1" ;

  ///Second Sensor/// Bass, Kicks, Heaviness
  soundFiles[24] = "tonalNote2" ;
  soundFiles[25] = "voxSnippet" ;
  soundFiles[26] = "vox2" ;
  soundFiles[27] = "chorusKick";

  soundFiles[28] = "gamelan1" ;
  soundFiles[29] = "gamelan4" ;
  soundFiles[30] = "gamelan4" ;
  soundFiles[31] = "rimshot2" ;

  soundFiles[32] = "brushLoop" ;
  soundFiles[33] = "trumpet2" ;
  soundFiles[34] = "smallMetals" ;
  soundFiles[35] = "signal1" ;

  soundFiles[36] = "guitar2" ;
  soundFiles[37] = "bathtub1" ;
  soundFiles[38] = "hardKick" ;
  soundFiles[39] = "boatDock" ;

  soundFiles[40] = "whale" ;
  soundFiles[41] = "seagulls" ;
  soundFiles[42] = "subway" ;
  soundFiles[43] = "sandpaper" ;

  soundFiles[44] = "carCrash" ;
  soundFiles[45] = "trumpet1" ;
  soundFiles[46] = "ride" ;
  soundFiles[47] = "micdrop1" ;

  //Third Sensor///Percs and Details
  soundFiles[48] = "glitchRhythmic" ;
  soundFiles[49] = "fullVoice" ;
  soundFiles[50] = "vox3" ;
  soundFiles[51] = "chorusChord" ;

  soundFiles[52] = "gamelan2" ;
  soundFiles[53] = "chant" ;
  soundFiles[54] = "glitch2" ;
  soundFiles[55] = "808bell" ;

  soundFiles[56] = "trumpet1" ;
  soundFiles[57] = "trumpets3" ;
  soundFiles[58] = "ride" ;
  soundFiles[59] = "twinkle" ;

  soundFiles[60] = "hardKick" ;
  soundFiles[61] = "brokenBottle" ;
  soundFiles[62] = "trickle" ;
  soundFiles[63] = "waterDrop" ;

  soundFiles[64] = "underWater" ;
  soundFiles[65] = "seaRustle" ;
  soundFiles[66] = "honk";
  soundFiles[67] = "seaRustle" ;

  soundFiles[68] = "trumpets3" ;
  soundFiles[69] = "brokenBottle" ;
  soundFiles[70] = "rideCrash" ;
  soundFiles[71] = "micdrop1" ;


  // arrays for intro transition
  for (int i = 0; i <sensors; i++) {
    amplitude[i] = 0;
  }
  for (int i = 0; i <sensors; i++) {
    introAmplitude[i] = 1;
  }
  for (int i = 0; i <sensors; i++) {
    introCounter[i] = 0;
  }
  // GUI
  gui = new GUI[sensors];
  for (int i = 0; i <sensors; i++) {
    gui[i] = new GUI(flexSensor[i].threshold(), i);
  }
}


void draw() {  
  int channel = 0;
  int velocity = 127;
  int number = 0;
  int value = 90;
  textAlign(CENTER);
  for (int i = 0; i<sensors; i++) {
    gui[i].newBackground();
  }
  /////////////////////////////displays and updates the Flex Sensor values//////////
  for (int i = 0; i<sensors; i++) {
    gui[i].update(flexSensor[i].reading());
    gui[i].display(flexSensor[i].threshold());
    flexSensor[i].update();
    for (int n = 0; n<24; n++) {
      gui[0].selection(n, soundFiles[n]);
    }
    for (int n = 24; n<48; n++) {
      gui[1].selection(n, soundFiles[n]);
    }
    for (int n = 48; n<72; n++) {
      gui[2].selection(n, soundFiles[n]);
    }
    //////////////////////////////////
    ///////////Intro Section//////////
    //////////////////////////////////
    ///// Allows time for communication to initialize before sensors are read
    if (millis()>4000) {
      int soloIntroSound = 7;
      if (intro==true) {
        if (flexSensor[i].trigger() == true) {
          introCounter[i]++;
          gui[i].play(1);
          if (introCounter[i]<soloIntroSound) {
            amplitude[i]=0;
          } else if (introCounter[i]>=soloIntroSound) {
            if (amplitude[i]<.20) {
              amplitude[i]+= .05;
            } else if (amplitude[i]>=.20) {
              amplitude[i]+= .1;
            }
          }
          if (amplitude[i]>.5) {
            introAmplitude[i]-= .15;
          }
          if (amplitude[i]>1) {
            amplitude[i]=1;
          }
          if (introAmplitude[i]<0) {
            introAmplitude[i]=0;
          }
          introSound[i].amp(introAmplitude[i]);
          file[i].amp(amplitude[i]);
          introSound[i].play();
          file[i].play();
        } else {
          gui[i].play(2);
        }
      }
      ////////////////////////////////////////
      ///////////Interactive Section//////////
      ////////////////////////////////////////
      if (sceneTwo==true) {
        file[i].amp(1);
        if (flexSensor[i].trigger() == true) {
          file[i].play(1, 1);
          gui[i].play(1);
        } else {
          gui[i].play(2);
        }
        for (int n = 0; n<24; n++) {
          gui[0].selection(n, soundFiles[n]);
        }
        for (int n = 24; n<48; n++) {
          gui[1].selection(n, soundFiles[n]);
        }
        for (int n = 48; n<72; n++) {
          gui[2].selection(n, soundFiles[n]);
        }
        //////////////////////////////////////////////////////////
        ////////////////Programmed Interactions///////////////////
        //////////////////////////////////////////////////////////
      }
    }
  }
  if (sceneThree==true) {
    if (droneInitialize==false) {
      outputBus.sendControllerChange(channel, 2, 1);
      outputBus.sendControllerChange(channel, 4, 1);
      outputBus.sendControllerChange(channel, 5, 1);
      outputBus.sendControllerChange(channel, 6, 127);
      droneInitialize=true;
    }
    //Distortion variable is going to control the transition through the different sections
    float gateMultiplier= (map(flexSensor[0].reading(), 0, height, 1, 4));
    float distortionMultiplier= (map(flexSensor[1].reading(), 290, 220, 1, 4));
    float pitchMultiplier= (map(flexSensor[2].reading(), 0, width, 3, 7));
    println(flexSensor[1].reading());
    ///////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////
    if (flexSensor[0].reading()<flexSensor[0].threshold()) {
      if (frameCount%7==0) {
        gate += (gateMultiplier);
      }
    } else {
      if (frameCount%10==0) {
        gate= gate-5;
      }
    }
    gate = floor(constrain(gate, 1, 127));
    ///////////////////////////////////////////////////////////////
    ////////////DISTORTION/DRONE MODIFIER///////////////////////////////////////
    ///////////////////////////////////////////////////////////////
    if (frameCount%7==0) {
      if (flexSensor[1].reading()<flexSensor[1].threshold()) {
        distortion += 4;
        println("eyy");
      } else {
        distortion= distortion-3;
      }
    }
    distortion = floor(constrain(distortion, 1, 127));
    if (distortion>=127) {
      dronePhase++;
      distortion=0;
    }
    ///////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////
    if (frameCount%7==0) {
      if (flexSensor[2].reading()<flexSensor[2].threshold()) {
        pitch += (pitchMultiplier);
      }
    } else {
      if (frameCount%10==0) {
        pitch= pitch-4;
      }
    }
    pitch = floor(constrain(pitch, 1, 127));
    outputBus.sendControllerChange(channel, 1, gate);
    outputBus.sendControllerChange(channel, 3, pitch);
    if (dronePhase==1) {
      println(dronePhase, distortion, gate);
      outputBus.sendControllerChange(channel, 2, distortion);
    }
    if (dronePhase==2) {
      outputBus.sendControllerChange(channel, 4, distortion);
    }
    if (dronePhase==3) {
      outputBus.sendControllerChange(channel, 5, distortion);
    }
    if (dronePhase==4) {
      println(dronePhase, distortion, gate);
      outputBus.sendControllerChange(channel, 6, (127-distortion));
    }
    if (dronePhase==5) {
      println(dronePhase, distortion, gate);
      outputBus.sendControllerChange(channel, 2, (127-distortion));
    }
    if (dronePhase==6) {
      outputBus.sendControllerChange(channel, 4, (127-distortion));
    }
  }
  println(dronePhase, distortion, gate);
}

//Midi scene shifting//
void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  if (number==21) {
    if (1<=value && value<=10) {
      scene=1;
    }
    if (11<=value && value<=40) {
      scene=2;
    }
    if (41<=value && value<=60) {
      scene=3;
    }
    if (61<=value && value<=80) {
      scene=4;
    }
    if (81<=value && value<=110) {
      scene=5;
    }
    if (111<=value && value<=127) {
      scene=6;
    }
  }
}
