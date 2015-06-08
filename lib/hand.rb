class Hand
attr_accessor :hand, :deck

  def initialize(deck)
    @deck = deck
    @hand = []
    2.times do
      @hand << @deck.draw!
      end
  end

  def hit!
    @hand << @deck.draw!
  end

end
