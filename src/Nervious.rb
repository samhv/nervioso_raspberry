class Nervious

	include Observer
	include Observable
	include Runnable

	def initialize ledsNervious
		super()
		@mutexButtons = Mutex.new
		@mutexLedsLifes = Mutex.new
		@players = Hash.new
		@ledsNervious = ledsNervious
		@ledsLifes = Hash.new
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
		turn_on
		loop do
			if @enable_state == :turn_on
				@game_state = @games_states.sample
				if @game_state == :will_lose
					@ledsNervious.turn_lose_on
					sleep 1
					@ledsNervious.turn_lose_off
				elsif @game_state == :will_win
					@ledsNervious.turn_win_on
					sleep 1
					@ledsNervious.turn_win_off
				end
			end
			sleep 6
		end
	end

	def notify observable, data = nil
		#puts "notify: #{observable}, #{data}"
		if observable.is_a? ButtonPlayer
			@mutexButtons.synchronize do
				if @game_state == :will_win
					puts "win a life: #{@players[observable]}".light_green
					@ledsLifes[observable].win_life
					@game_state = :none
					WinSong.new.play
				elsif @game_state == :will_lose
					puts "lose a life: #{@players[observable]}".light_green
					@ledsLifes[observable].lose_life
					LoseSong.new.play
				end
			end
		elsif observable.is_a? LedsLifes
			@mutexLedsLifes.synchronize do
				if @enable_state == :turn_on
					puts "the winner is: #{@players[observable]}".light_green
					self.turn_off
					MatchSong.new.play
				end
			end
		elsif observable.is_a? ButtonReset
			self.reset
		end
	end

	def reset
		puts "reseting...".light_green
		self.turn_off
		sleep 3
		self.turn_on
	end
	
	def turn_off
		@ledsNervious.turn_off
		GameSong.stop
		@enable_state = :turn_off
	end

	def turn_on
		@ledsLifes.each_value do |leds|
			leds.lose_all_lifes
		end
		InicioSong.new.play
		sleep 3
		puts "started game".light_green
		PlayingSong.new.loop_play
		@enable_state = :turn_on
	end

end