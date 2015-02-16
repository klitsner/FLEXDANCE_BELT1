int mainVolume=127;

//With midi contoroller, use program 'MidiStroke' to map keystrokes to midi controller
//use keystrokes to select triggerable samples from on screen selection


void keyPressed() {
  fill(color(0, 0, 255));
  if (gui[0].sceneSelection()==1) {

    gui[0].selection(0, soundFiles[0]);
    gui[0].selection(1, soundFiles[1]);
    gui[0].selection(2, soundFiles[2]);
    gui[0].selection(3, soundFiles[3]);

    if (key == 'q' ) {
      file[0] = new SoundFile(this, soundFiles[0]+".wav");
    }
    if (key == 'w' ) {
      file[0] = new SoundFile(this, soundFiles[1]+".wav");
    }
    if (key == 'e' ) {
      file[0] = new SoundFile(this, soundFiles[2]+".wav");
    }
    if (key == 'r') {
      file[0] = new SoundFile(this, soundFiles[3]+".wav");
    }
  }

  if (gui[0].sceneSelection()==2) {

    gui[0].selection(4, soundFiles[4]);
    gui[0].selection(5, soundFiles[5]);
    gui[0].selection(6, soundFiles[6]);
    gui[0].selection(7, soundFiles[7]);

    if (key == 'q' ) {
      file[0] = new SoundFile(this, soundFiles[4]+".wav");
    }
    if (key == 'w' ) {
      file[0] = new SoundFile(this, soundFiles[5]+".wav");
    }
    if (key == 'e' ) {
      file[0] = new SoundFile(this, soundFiles[6]+".wav");
    }
    if (key == 'r' ) {
      file[0] = new SoundFile(this, soundFiles[7]+".wav");
    }
  }


  if (gui[0].sceneSelection()==3) {
    gui[0].selection(8, soundFiles[8]);
    gui[0].selection(9, soundFiles[9]);
    gui[0].selection(10, soundFiles[10]);
    gui[0].selection(11, soundFiles[11]);


    if (key == 'q' ) {
      file[0] = new SoundFile(this, soundFiles[8]+".wav");
    }
    if (key == 'w' ) {
      file[0] = new SoundFile(this, soundFiles[9]+".wav");
    }
    if (key == 'e' ) {
      file[0] = new SoundFile(this, soundFiles[10]+".wav");
    }
    if (key == 'r' ) {
      file[0] = new SoundFile(this, soundFiles[11]+".wav");
    }
  }


  if (gui[0].sceneSelection()==4) {
    gui[0].selection(12, soundFiles[12]);
    gui[0].selection(13, soundFiles[13]);
    gui[0].selection(14, soundFiles[14]);
    gui[0].selection(15, soundFiles[15]);


    if (key == 'q' ) {
      file[0] = new SoundFile(this, soundFiles[12]+".wav");
    }
    if (key == 'w' ) {
      file[0] = new SoundFile(this, soundFiles[13]+".wav");
    }
    if (key == 'e' ) {
      file[0] = new SoundFile(this, soundFiles[14]+".wav");
    }
    if (key == 'r' ) {
      file[0] = new SoundFile(this, soundFiles[15]+".wav");
    }
  }


  if (gui[0].sceneSelection()==5) {
    gui[0].selection(16, soundFiles[16]);
    gui[0].selection(17, soundFiles[17]);
    gui[0].selection(18, soundFiles[18]);
    gui[0].selection(19, soundFiles[19]);



    if (key == 'q' ) {
      file[0] = new SoundFile(this, soundFiles[16]+".wav");
    }
    if (key == 'w' ) {
      file[0] = new SoundFile(this, soundFiles[17]+".wav");
    }
    if (key == 'e' ) {
      file[0] = new SoundFile(this, soundFiles[18]+".wav");
    }
    if (key == 'r' ) {
      file[0] = new SoundFile(this, soundFiles[19]+".wav");
    }
  }


  if (gui[0].sceneSelection()==6) {

    gui[0].selection(20, soundFiles[20]);
    gui[0].selection(21, soundFiles[21]);
    gui[0].selection(22, soundFiles[22]);
    gui[0].selection(23, soundFiles[23]);


    if (key == 'q' ) {
      file[0] = new SoundFile(this, soundFiles[20]+".wav");
    }
    if (key == 'w' ) {
      file[0] = new SoundFile(this, soundFiles[21]+".wav");
    }
    if (key == 'e' ) {
      file[0] = new SoundFile(this, soundFiles[22]+".wav");
    }
    if (key == 'r' ) {
      file[0] = new SoundFile(this, soundFiles[23]+".wav");
    }
  }


  // switch hats
  if (gui[1].sceneSelection()==1) {

    gui[1].selection(0, soundFiles[24]);
    gui[1].selection(1, soundFiles[25]);
    gui[1].selection(2, soundFiles[26]);
    gui[1].selection(3, soundFiles[27]);


    if (key == 'a' ) {
      file[1] = new SoundFile(this, soundFiles[24]+".wav");
    }
    if (key == 's' ) {
      file[1] = new SoundFile(this, soundFiles[25]+".wav");
    }
    if (key == 'd' ) {
      file[1] = new SoundFile(this, soundFiles[26]+".wav");
    }
    if (key == 'f' ) {
      file[1] = new SoundFile(this, soundFiles[27]+".wav");
    }
  }


  if (gui[1].sceneSelection()==2) {

    gui[1].selection(0, soundFiles[28]);
    gui[1].selection(1, soundFiles[29]);
    gui[1].selection(2, soundFiles[30]);
    gui[1].selection(3, soundFiles[31]);


    if (key == 'a' ) {
      file[1] = new SoundFile(this, soundFiles[28]+".wav");
    }
    if (key == 's' ) {
      file[1] = new SoundFile(this, soundFiles[29]+".wav");
    }
    if (key == 'd' ) {
      file[1] = new SoundFile(this, soundFiles[30]+".wav");
    }
    if (key == 'f' ) {
      file[1] = new SoundFile(this, soundFiles[31]+".wav");
    }
  }

  if (gui[1].sceneSelection()==3) {

    gui[1].selection(0, soundFiles[32]);
    gui[1].selection(1, soundFiles[33]);
    gui[1].selection(2, soundFiles[34]);
    gui[1].selection(3, soundFiles[35]);



    if (key == 'a' ) {
      file[1] = new SoundFile(this, soundFiles[32]+".wav");
    }
    if (key == 's' ) {
      file[1] = new SoundFile(this, soundFiles[33]+".wav");
    }
    if (key == 'd' ) {
      file[1] = new SoundFile(this, soundFiles[34]+".wav");
    }
    if (key == 'f' ) {
      file[1] = new SoundFile(this, soundFiles[35]+".wav");
    }
  }


  if (gui[1].sceneSelection()==4) {

    gui[1].selection(0, soundFiles[36]);
    gui[1].selection(1, soundFiles[37]);
    gui[1].selection(2, soundFiles[38]);
    gui[1].selection(3, soundFiles[39]);


    if (key == 'a' ) {
      file[1] = new SoundFile(this, soundFiles[36]+".wav");
    }
    if (key == 's' ) {
      file[1] = new SoundFile(this, soundFiles[37]+".wav");
    }
    if (key == 'd' ) {
      file[1] = new SoundFile(this, soundFiles[38]+".wav");
    }
    if (key == 'f' ) {
      file[1] = new SoundFile(this, soundFiles[39]+".wav");
    }
  }


  if (gui[1].sceneSelection()==5) {

    gui[1].selection(0, soundFiles[40]);
    gui[1].selection(1, soundFiles[41]);
    gui[1].selection(2, soundFiles[42]);
    gui[1].selection(3, soundFiles[43]);


    if (key == 'a' ) {
      file[1] = new SoundFile(this, soundFiles[40]+".wav");
    }
    if (key == 's' ) {
      file[1] = new SoundFile(this, soundFiles[41]+".wav");
    }
    if (key == 'd' ) {
      file[1] = new SoundFile(this, soundFiles[42]+".wav");
    }
    if (key == 'f' ) {
      file[1] = new SoundFile(this, soundFiles[43]+".wav");
    }
  }


  if (gui[1].sceneSelection()==6) {

    gui[1].selection(0, soundFiles[44]);
    gui[1].selection(1, soundFiles[45]);
    gui[1].selection(2, soundFiles[46]);
    gui[1].selection(3, soundFiles[47]);


    if (key == 'a' ) {
      file[1] = new SoundFile(this, soundFiles[44]+".wav");
    }
    if (key == 's' ) {
      file[1] = new SoundFile(this, soundFiles[45]+".wav");
    }
    if (key == 'd' ) {
      file[1] = new SoundFile(this, soundFiles[46]+".wav");
    }
    if (key == 'f' ) {
      file[1] = new SoundFile(this, soundFiles[47]+".wav");
    }
  }


  if (gui[2].sceneSelection()==1) {

    gui[2].selection(0, soundFiles[48]);
    gui[2].selection(1, soundFiles[49]);
    gui[2].selection(2, soundFiles[50]);
    gui[2].selection(3, soundFiles[51]);



    if (key == 'z' ) {
      file[2] = new SoundFile(this, soundFiles[48]+".wav");
    }

    if (key == 'x' ) {
      file[2] = new SoundFile(this, soundFiles[49]+".wav");
    }

    if (key == 'c' ) {
      file[2] = new SoundFile(this, soundFiles[50]+".wav");
    }
    if (key == 'v' ) {
      file[2] = new SoundFile(this, soundFiles[51]+".wav");
    }
  }


  if (gui[2].sceneSelection()==2) {

    gui[2].selection(0, soundFiles[52]);
    gui[2].selection(1, soundFiles[53]);
    gui[2].selection(2, soundFiles[54]);
    gui[2].selection(3, soundFiles[55]);



    if (key == 'z' ) {
      file[2] = new SoundFile(this, soundFiles[52]+".wav");
    }
    if (key == 'x' ) {
      file[2] = new SoundFile(this, soundFiles[53]+".wav");
    }
    if (key == 'c' ) {
      file[2] = new SoundFile(this, soundFiles[54]+".wav");
    }
    if (key == 'v' ) {
      file[2] = new SoundFile(this, soundFiles[55]+".wav");
    }
  }


  if (gui[2].sceneSelection()==3) {
    gui[2].selection(0, soundFiles[56]);
    gui[2].selection(1, soundFiles[57]);
    gui[2].selection(2, soundFiles[58]);
    gui[2].selection(3, soundFiles[59]);




    if (key == 'z' ) {
      file[2] = new SoundFile(this, soundFiles[56]+".wav");
    }
    if (key == 'x' ) {
      file[2] = new SoundFile(this, soundFiles[57]+".wav");
    }
    if (key == 'c' ) {
      file[2] = new SoundFile(this, soundFiles[58]+".wav");
    }
    if (key == 'v' ) {
      file[2] = new SoundFile(this, soundFiles[59]+".wav");
    }
  }


  if (gui[2].sceneSelection()==4) {

    gui[2].selection(0, soundFiles[60]);
    gui[2].selection(1, soundFiles[61]);
    gui[2].selection(2, soundFiles[62]);
    gui[2].selection(3, soundFiles[63]);



    if (key == 'z' ) {
      file[2] = new SoundFile(this, soundFiles[60]+".wav");
    }
    if (key == 'x' ) {
      file[2] = new SoundFile(this, soundFiles[61]+".wav");
    }
    if (key == 'c' ) {
      file[2] = new SoundFile(this, soundFiles[62]+".wav");
    }
    if (key == 'v' ) {
      file[2] = new SoundFile(this, soundFiles[63]+".wav");
    }
  }


  if (gui[2].sceneSelection()==5) {

    gui[2].selection(0, soundFiles[64]);
    gui[2].selection(1, soundFiles[65]);
    gui[2].selection(2, soundFiles[66]);
    gui[2].selection(3, soundFiles[67]);



    if (key == 'z' ) {
      file[2] = new SoundFile(this, soundFiles[64]+".wav");
    }
    if (key == 'x' ) {
      file[2] = new SoundFile(this, soundFiles[65]+".wav");
    }
    if (key == 'c' ) {
      file[2] = new SoundFile(this, soundFiles[66]+".wav");
    }
    if (key == 'v' ) {
      file[2] = new SoundFile(this, soundFiles[67]+".wav");
    }
  }


  if (gui[2].sceneSelection()==6) {

    gui[2].selection(0, soundFiles[68]);
    gui[2].selection(1, soundFiles[69]);
    gui[2].selection(2, soundFiles[70]);
    gui[2].selection(3, soundFiles[71]);


    if (key == 'z' ) {
      file[2] = new SoundFile(this, soundFiles[68]+".wav");
    }
    if (key == 'x' ) {
      file[2] = new SoundFile(this, soundFiles[69]+".wav");
    }
    if (key == 'c' ) {
      file[2] = new SoundFile(this, soundFiles[70]+".wav");
    }
    if (key == 'v' ) {
      file[2] = new SoundFile(this, soundFiles[71]+".wav");
    }
  }




  if (key== '2') {
    intro=false;
    sceneTwo=true;
    sceneThree=false;


  }
  if (key== '3') {
    note= 1;
    velocity= 100;
    outputBus.sendNoteOn(0, note, velocity);


    intro=false;
    sceneTwo=false;
    sceneThree=true;
  }
  if (key== ',') {
    note= 2;
    velocity= 100;
    outputBus.sendNoteOn(0, note, velocity);
  }

  if (key== '5') {
    scene=1;
  }
  if (key== '6') {
    scene=2;
  }
  if (key== '7') {
    scene=3;
  }
  if (key== '8') {
    scene=4;
  }
  if (key== '9') {
    scene=5;
  }
  if (key== '0') {
    scene=6;
  }
}


void keyReleased()
{
  outputBus.sendNoteOff(0, note, velocity);
}
