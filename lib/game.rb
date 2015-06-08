require_relative 'hand'


class Game

  def initialize(name, deck)
    @computer_name = "Dealer"
    @player_name = name
    @deck = deck
  end

end
