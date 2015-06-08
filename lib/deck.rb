require 'pry'
require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
  suits = ["♠", "♥", "♦", "♣"]
  ranks = {
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "J" => 10,
    "Q" => 10,
    "K" => 10,
    "A" => 11
    }


    @deck = []
    suits.each do |suit|
      ranks.each do |rank, value|
        @deck << Card.new(rank, suit, value)
      end
    end
    @deck.shuffle!
  end

  def draw!
    @deck.pop
  end


end
