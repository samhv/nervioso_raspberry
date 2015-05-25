class LedsLifes

	include Observable

	def initialize pin_leds
		super()
		@leds = pin_leds.map do |pin_led|
			pin_led = Led.new(pin_led)
		end
		@current_lifes = 0
		@max_lifes = @leds.length
	end

	def win_life
		puts "turn_on: #{@current_lifes}"
		puts "turn_on: #{@leds}"
		@leds[@current_lifes].turn_on
		@current_lifes = @current_lifes + 1
		if @max_lifes == @current_lifes
			notify_observers
		end
	end

	def lose_life
		if @current_lifes > 0
			@current_lifes = @current_lifes - 1
			@leds[@current_lifes].turn_off
		end
	end

	def lose_all_lifes
		@current_lifes = 0
		@leds.each do |led|
			led.turn_off
		end
	end

	def notify_observers
		for observer in @observers
			observer.notify self
		end
	end

end