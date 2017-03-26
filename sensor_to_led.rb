require 'artoo'

# sets Arduino port
connection :arduino, adaptor: :firmata, port: '/dev/cu.usbmodem14111'

# sets up analog sensor on pin A0
device :sensor, driver: :analog_sensor, pin: 0, interval: 0.25, upper: 900, lower: 200

# sets up LED on pin 8
device :led, :driver => :led, :pin => 2

work do
  puts "I'm working!"
  puts "Reading sensor in analog pin #{ sensor.pin }"
  puts "Reading intervals every => #{ sensor.interval }"
  puts "Initial sensor value => #{ sensor.analog_read(0) }"
  puts "Sensor upper trigger set at value => #{ sensor.upper }"
  puts "Sensor lower trigger set at value => #{ sensor.lower }"

  on sensor, :upper => proc {
    puts "UPPER LIMIT REACHED!"
    led.off
  }

  on sensor, :lower => proc {
    puts "LOWER SENSOR LIMIT REACHED!"
    led.on
  }

end
