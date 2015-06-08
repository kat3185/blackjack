require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/hand'
require_relative 'lib/game'





game_one = Game.new("Yourname")

game_one.deal_computer_hand
game_one.deal_player_hand
game_one.play_game
