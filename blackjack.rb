require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/hand'
require_relative 'lib/game'

class Blackjack
  def initialize
    print 'What is your name? '
    @game = Game.new(gets.chomp)
  end

  def play
    @game.play_game
  end
end

Blackjack.new.play
