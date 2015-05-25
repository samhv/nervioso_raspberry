class GameSong

	def initialize(song)
		@song = song
	end
	def play
		Thread.new{system("mpg321 #{@song}")}
	end
	def self.stop
		system("pkill -f mpg321")
	end
	def loop_play
		Thread.new{system("mpg321 #{@song} -l 0")}
	end
end