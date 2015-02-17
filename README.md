# Flex Sensor/Xbee Processing Sketch
* This is the processing sketch that is used in a Sound + Dance project that uses movement to trigger and manipulate soundd
* The sketch uses firmata to get flex sensor values from a wireless Xbee module and trigger audio samples.
* Thresholds are set in the sketch. Once the corresponding flex sensor reaches that value a sound sample is triggered.
* Triggerable sounds are selected and updated through a the GUI using a Midi controller or keystrokes.

# GUI 
<img src = "https://cloud.githubusercontent.com/assets/9808027/6224604/3685f7d6-b633-11e4-8b5b-5975b51b7c6a.png">

# To Run:
 * Recieving Xbee module or Arduino must be connected via serial port
 * Ableton midi-mapped file must be opened for drone section
 * Use midi stroke to map Midi controller to keystrokes in keyEvents section
 * 
