// Sensor class contains functions for reading and comparing flex sensor values
// use boolean 'trigger' in triggering samples

class Sensor {
  int sensor;
  int threshold;
  int hold;
  boolean play;
  Sensor (int s, int t) {
    threshold = t;
    sensor = s;
    hold = 0;
  }


  void update() {
    if (hold == 1) {
      play = false;
    }

    if (reading()<threshold && hold == 0) {
      play = true;
      hold = 1;
    }
    if (reading()>threshold) {
      hold = 0;
    }
  }

  boolean trigger() {
    if (play== true);
    return play;
  }

  float reading() {
    return arduino.analogRead(sensor);
  }
  
  float threshold(){
    return threshold;
  }
  
  int id(){
    return sensor;
  }
  
}
