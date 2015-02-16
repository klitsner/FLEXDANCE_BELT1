
//Displays and updates GUI
//
//newBackground(): Draws background
//display(int threshold): draws and updates meters 
//update(int threshold): meter turns red if corresponding sensor is triggered
//selection(int i, String s): highlights the current selected sound pallette

class GUI {
  int X;
  int go = 1;

  float heightVariable;

  float rectHeight = 180;
  int sceneDisplay = 1;

  color text =#4ECEB8;
  color meter =#4ECEB8;
  color button =#4ECEB8;
  color main = #FFFFFF;
  color outline1 = #FFFFFF ;
  color outline2 = #FFFFFF ;
  color meterBackground =#F25E5E;

  boolean playing = false;

  GUI(float th, int x) {
    X = x;
  }

  void newBackground() {
    fill(main);
    strokeWeight(0);
    stroke(outline2);
    rect(0, 0, width, height);
    //background
    fill(color(0, 0, 0));
    rect(0, 240, 660, displayHeight-240);

    fill(color(255, 255, 255));
    rect(0, 0, 660, 240);
  }

  void update(float h) {
    heightVariable = map(h, 700, 0, 0, rectHeight-37);
    if (playing == true) {
      outline2 = #F25E5E ;
      meterBackground =#F25E5E;
    } else {
      outline2 = #4ECEB8;
      meterBackground =#4ECEB8;
    }
  }
  
  
  void display(float threshold) {

    //flexValues
    textFont(font, 16);
    fill(color(0, 0, 0));
    text("Leg", 170 *(1), 28);
    text("Neck", 170 *(2), 28);
    text("Arm", 170 *(3), 28);

    // Meter Background
    fill(meterBackground);
    stroke(outline2);
    strokeWeight(10);
    rect( 170*(X+1)-20, 40, 40, rectHeight+10, 3);

    // Meter Bar 
    fill(outline1);
    stroke(outline1);
    strokeWeight(5);
    rect( 10+170*(X+1)-20, 60+heightVariable, 20, 160-heightVariable, 2);

    //Meter Threshold
    stroke(outline1);
    strokeWeight(5);
    threshold=map(threshold, 0, 600, 40, 180);
    line(170*(X+1)-24, threshold, 44+170 *(X+1), threshold);

    //Display Current SoundScene
    soundScene();
  }



  void soundScene() {

    if (scene==1) {
      sceneDisplay = 240;
    }
    if (scene==2) {
      sceneDisplay = 339;
    }
    if (scene==3) {
      sceneDisplay = 438;
    }
    if (scene==4) {
      sceneDisplay = 537;
    }
    if (scene==5) {
      sceneDisplay = 636;
    }
    if (scene==6) {
      sceneDisplay = 735;
    }

    fill(#646464);
    noStroke();
    rect(0, sceneDisplay, height, 95);
  }

  int sceneSelection() {
    return scene;
  }


  void selection(int i, String s) {
    fill(255);
    textFont(font, 16);
    strokeWeight(0);
    if (4>i) {
      text(s, 170 *(X+1), 265+(i*22));
    } else
      if (4<=i && i<8) {
      text(s, 170 *(X+1), 275+(i*22));
    } else
      if (8<=i && i<12) {
      text(s, 170 *(X+1), 285+(i*22));
    } else
      if (12<=i && i<16) {
      text(s, 170 *(X+1), 295+(i*22));
    } else
      if (16<=i && i<20) {
      text(s, 170 *(X+1), 305+(i*22));
    } else
      if (20<=i && i<24) {
      text(s, 170 *(X+1), 315+(i*22));
    }

    if (24<=i && i<28) {
      text(s, 170 *(X+1), 265-528+(i*22));
    } else
      if (28<=i && i<32) {
      text(s, 170 *(X+1), 275-528+(i*22));
    } else
      if (32<=i && i<36) {
      text(s, 170 *(X+1), 285-528+(i*22));
    } else
      if (36<=i && i<40) {
      text(s, 170 *(X+1), 295-528+(i*22));
    } else
      if (40<=i && i<44) {
      text(s, 170 *(X+1), 305-528+(i*22));
    } else
      if (44<=i && i<48) {
      text(s, 170 *(X+1), 315-528+(i*22));
    }
    
        if (48<=i && i<52) {
      text(s, 170 *(X+1), 265-1056+(i*22));
    } else
      if (52<=i && i<56) {
      text(s, 170 *(X+1), 275-1056+(i*22));
    } else
      if (56<=i && i<60) {
      text(s, 170 *(X+1), 285-1056+(i*22));
    } else
      if (60<=i && i<64) {
      text(s, 170 *(X+1), 295-1056+(i*22));
    } else
      if (64<=i && i<68) {
      text(s, 170 *(X+1), 305-1056+(i*22));
    } else
      if (68<=i && i<72) {
      text(s, 170 *(X+1), 315-1056+(i*22));
    }
    
    //// Selected Sound
    if (4>i) {
      text(s, 170 *(X+1), 265+(i*22));
    } else
      if (4<=i && i<8) {
      text(s, 170 *(X+1), 275+(i*22));
    } else
      if (8<=i && i<12) {
      text(s, 170 *(X+1), 285+(i*22));
    } else
      if (12<=i && i<16) {
      text(s, 170 *(X+1), 295+(i*22));
    } else
      if (16<=i && i<20) {
      text(s, 170 *(X+1), 305+(i*22));
    } else
      if (20<=i && i<24) {
      text(s, 170 *(X+1), 315+(i*22));
    }
  }



  boolean play(int p) {
    if (p == 1) {
      playing = true;
    } else if (p == 2) {
      playing = false;
    }
    return playing;
  }

  int X() {
    return X;
  }
}
