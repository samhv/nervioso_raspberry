class Player
	
	def initialize buttonPlayer, ledsLifes, name, game
		@buttonPlayer = buttonPlayer
		@ledsLifes = ledsLifes
		@name = name
		self.play game
	end

	def play game
		game.register_observer @buttonPlayer
		game.register_observer @ledsLifes
		game.add_player @name, @buttonPlayer, @ledsLifes
	end

end