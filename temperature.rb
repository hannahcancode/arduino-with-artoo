require 'artoo'

# sets Arduino port
connection :arduino, adaptor: :firmata, port: '/dev/cu.usbmodem14111'

# sets up analog sensor on pin A1
device :sensor, driver: :analog_sensor, pin: 1
device :board, :driver => :device_info

work do

  every(3) do #every 3 seconds

    #conversion for an LM35 temperature sensor
    conversion = 500.0/1025.0
    temp = (sensor.analog_read(1)) * conversion
    puts "the temp is #{temp}"
  end

end
