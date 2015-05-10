require "bundler/setup"
Bundler.require(:default, :development) 
require_relative "Headers.rb"

game = Nervious.new

button1 = ButtonPlayer.new 0
button2 =  ButtonPlayer.new 0

ledsLifes1 = LedsLifes.new [0,0,0,0,0]
ledsLifes2 = LedsLifes.new [0,0,0,0,0]

player1 = Player.new button1, ledsLifes1, "Player 1", game
player2 = Player.new button2, ledsLifes2, "Player 2", game

buttonReset = ButtonReset.new 0
ledsNervious = LedsNervious.new [0,0,0,0,0]

buttonReset.register_observer game
ledsNervious.register_observer game

button1.run_thread
button2.run_thread
game.run_thread.join

puts "the game finished"