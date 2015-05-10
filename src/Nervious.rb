class Nervious

	include Observer
	include Runnable

	def initialize 
		super()
		@mutexButtons = Mutex.new
		@mutexLedsLifes = Mutex.new
		@players = Hash.new
		@ledsNervious = Hash.new
		@game_state = :none
		@games_states = [:will_lose, :will_win]
		@enable_state = :turn_on
		# @enable_states = [:turn_off, :turn_on]
	end

	def add_player name, button, leds
		@players[button] = name
		@players[leds] = name
		@ledsLifes[button] = leds
	end

	def run
		puts "starting game"
		sleep 2
		loop do
			sleep 5
			if @enable_state == :turn_on
				@game_state = @games_states.sample
				if @game_state == :will_lose
					@ledsNervious.turn_lose_on
					sleep 3
					@ledsNervious.turn_lose_off
				elsif @game_state == :will_win
					@ledsNervious.turn_win_on
					sleep 3
					@ledsNervious.turn_win_off
				end
			end
		end
	end

	def notify observable, data = nil
		if observable.is_a? ButtonPlayer
			@mutexButtons.synchronize do
				if @game_state == :will_win
					puts "win a life: #{@players[observable]}".light_green
					@ledsLifes[observable].win_life
					@game_state = :none
				elsif @game_state == :will_lose
					puts "lose a life: #{@players[observable]}".light_green
					@ledsLifes[observable].lose_life
				end
			end
		elsif observable.is_a? LedLifes
			@mutexLedsLifes.synchronize do
				if @enable_state == :turn_on
					puts "the winner is: #{@players[observable]}".light_green
					self.turn_off
				end
			end
		elsif observable.is_a? ButtonReset
			self.reset
		end
	end

	private
		def reset
			puts "reseting...".light_green
			turn_off
			sleep 3
			turn_on
		end
		def turn_off
			@enable_state = :turn_off
			@ledsNervious.turn_off
			@ledsLifes.each_value do |leds|
				leds.lose_all_lifes
			end 
		end
		def turn_on
			@enable_state = :turn_on
		end

end