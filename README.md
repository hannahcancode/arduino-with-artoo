# Exercises in Artoo on Arduino

This repository holds little programs that I have built to do various things on Arduino, using the Ruby library Artoo.

## Installation

If you would like to clone this repository and run them yourself:

1. You will need an Arduino wired up correctly. I may eventually create some diagrams for wiring but for the time being they will be fairly simple to wire up based on the comments.

2. Follow the installation instructions on [Artoo getting started page](http://artoo.io/documentation/getting-started/).

2. run:

   ``$ gem install artoo-arduino``

   to install artoo for the arduino platform.

3. Check you're on the right port by running:

   ``$ gort scan serial``

   if you're on a different port, make sure you change this in the code.

4. With your arduino connected, in terminal run:

   `` $ ruby name_of_file.rb ``


## Files

  1. sensor_to_led.rb

      * This program takes input from an analog photo sensor, and turns an LED on or off depending on the intensity.

      * The sensor is connected on A0 and the LED is connected on pin 8.

  2. display.rb

      * This program sets up an 8x8 display and turns columns and rows on and off to make the LEDs 'dance'.

      * I limited the number of rows to 5 (missing R1, R2 and R8) to suit the number of pins available on my arduino. If you have more pins available (including potentially analog pins that have digital i/o) you can add these rows back in.

      * Your 8 x 8 display may have different wiring - you can use trial and error to work out which pins connect to which columns and rows if you can't find documentation. Adjust the pins to suit your display.

  3. sensor_to_display.rb

      * Similar sensor_to_led.rb, this program takes input from an analog photo sensor, and turn rows of LEDs on or off depending on the intensity. The columns will 'dance' across the display.

      * The sensor is connected on A0 and the LEDs are connected as above in display.rb (n.b. this uses one less row than display.rb (misses R1, R2, R7 and R8) to avoid hitting pin 2, which is Tx on my arduino).

  4. temperature.rb

      * This program gets a voltage reading from an LM35 temperature sensor, converts it to degrees Celcius and prints it in terminal.

      * The sensor is connected on A1. If you are using a different temperature sensor you may need to adjust the conversion from voltage.

  5. tiltsensor.rb

      * This program checks for movement using a tilt sensor, which acts like a button. Upon movement it will alert the user audibly (limited support) and lights up an LED for a visual indication. The LED is turned off when movement stops.

      * The sensor is connected on A2 and the LED is connected on digital 5.
