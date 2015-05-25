class LedsNervious

	def initialize pin_leds_win, pin_leds_lose
		super()
		@leds_win = pin_leds_win.map do |pin_led| 
						pin_led = Led.new(pin_led)
					end
		@leds_lose = pin_leds_lose.map do |pin_led|
						pin_led = Led.new(pin_led)
					end
	end

	def turn_win_on
		@leds_win.each do |led|
			led.turn_on
		end
	end

	def turn_lose_on
		@leds_lose.each do |led|
			led.turn_on
		end
	end

	def turn_lose_off
		@leds_lose.each do |led|
			led.turn_off
		end
	end

	def turn_win_off
		@leds_win.each do |led|
			led.turn_off
		end
	end

	def turn_off
		turn_lose_off
		turn_win_off
	end

	def turn_on
		turn_lose_on
		turn_win_on		
	end

end