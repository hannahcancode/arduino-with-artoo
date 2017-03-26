require 'artoo'

# sets Arduino port
connection :arduino, adaptor: :firmata, port: '/dev/cu.usbmodem14111'

LEDS = 8

# sets up row and column pins
# rows are limited by number of digital ports available,
# add more pins below if you have more digital i/o pins

row_pins = [7, 11, 1, 6, 4]
col_pins = [8, 9, 12, 5, 13, 3, 2, 10]

device :board, :driver => :device_info

LEDS.times do |i|
  device "led_col_#{i+1}", :driver => :led, :pin => col_pins[i]
  if i < row_pins.length
    device "led_row_#{i+1}", :driver => :led, :pin => row_pins[i]
  end
end

work do

  #makes lists of rows and colums
  cols = devices.to_a.select {|d| d[1].name.include?('led_col') }
  rows = devices.to_a.select {|d| d[1].name.include?('led_row') }

  # sets all the columns to on so LEDs aren't on
  cols.length.times do |i|
    cols[i][1].on
  end

  #sets all the rows to on so LEDs will be on when the
  #associated column is off. Column off + Row on = LED on.
  rows.length.times do |i|
    rows[i][1].on
  end

  #loops through the array and make a pattern from the columns
  current = 0
  every(0.1) do
    led = cols[current % LEDS][1]
    led.on? ? led.off : led.on
    current += 1
  end

end
