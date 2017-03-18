# Exercises in Artoo on Arduino

This repository holds little programs that I have built to do various things on Arduino, using the Ruby library Artoo.

## Installation

If you would like to clone this repository and run them yourself:

1. You will need an Arduino wired up correctly. I may eventually create some diagrams for wiring but for the time being they will be fairly simple to wire up based on the comments.

2. Follow the installation instructions on [Artoo getting started page](http://artoo.io/documentation/getting-started/).

2. run:

   ``$ bundle install``

   to download the required gems.

3. Check you're on the right port by running:

   ``$ gort scan serial``

   if you're on a different port, make sure you change this in the code.

4. With your arduino connected, in terminal run:

   `` $ ruby name_of_file.rb ``


## Files

  1. sensor_to_led.rb

   * This program takes input from an analog photo sensor, and turns an LED on or off depending on the intensity.

   * The sensor is connected on A0 and the LED is connected on pin 8.
