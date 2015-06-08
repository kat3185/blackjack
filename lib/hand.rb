class Hand
attr_reader :hand, :deck

  def initialize(deck)
    @deck = deck
    @hand = []
    2.times do
      @hand << @deck.draw!
      puts "Player was dealt #{@hand.last.rank}#{@hand.last.suit}"
      end
  end

  def hit!
    @hand << @deck.draw!
  end

end
