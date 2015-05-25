class Led

	def initialize pin_led
		@pin = PiPiper::Pin.new :pin => pin_led, :direction => :out
		#puts "led #{@pin_event} initialized"
	end

	def turn_on
		puts "turn_on: #{@pin}".red
		@pin.update_value true
	end

	def turn_off
		@pin.update_value false
	end

end