require 'artoo'

# sets Arduino port
connection :arduino, adaptor: :firmata, port: '/dev/cu.usbmodem14111'

# sets up tilt sensor (as a 'button') on digital pin 2 and led on digital 5
device :button, :driver => :button, :pin => 2, :interval => 0.20
device :led, :driver => :led, :pin => 5
device :board, :driver => :device_info

work do

  on button, :push    => proc {
    led.on
    system('say "Stop stealing my arduino!"')
  }
  on button, :release    => proc {
    led.off
  }

end
