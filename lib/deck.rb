require 'pry'
require_relative 'card'

class Deck
  attr_accessor :deck

  def suits
    suits = ["♠", "♥", "♦", "♣"]
    suits
  end

  def ranks
    ranks = {
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 9,
      '10' => 10,
      'J' => 10,
      'Q' => 10,
      'K' => 10,
      'A' => 11
    }
    ranks
  end

  def initialize
    @deck = []
    suits.each do |suit|
      ranks.each do |rank, value|
        @deck << Card.new(rank, suit, value)
      end
    end
    @deck.to_a.shuffle!
  end

  def draw!
    @deck.pop
  end

end
