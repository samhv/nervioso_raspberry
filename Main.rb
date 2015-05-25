require "bundler/setup"
Bundler.require(:default, :development) 
require_relative "Headers.rb"

button1 = ButtonPlayer.new 22
button2 =  ButtonPlayer.new 23

ledsLifes1 = LedsLifes.new [17,18,4]
ledsLifes2 = LedsLifes.new [19,13,6]

buttonReset = ButtonReset.new 27
ledsNervious = LedsNervious.new [26], [20]

game = Nervious.new ledsNervious

player1 = Player.new button1, ledsLifes1, "Player 1", game
player2 = Player.new button2, ledsLifes2, "Player 2", game

buttonReset.register_observer game
button1.register_observer game
button2.register_observer game
ledsLifes1.register_observer game
ledsLifes2.register_observer game

buttonReset.run_thread
button1.run_thread
button2.run_thread

game.run_thread.join

puts "the game finished"