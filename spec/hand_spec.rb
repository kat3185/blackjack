require_relative '../lib/hand'


describe Hand do
  let(:deck) { Deck.new }
  let(:new_hand) { Hand.new(deck) }
  describe '#initialize' do
    it 'should contain two cards' do
      expect(new_hand.hand.count).to eq(2)
    end
  end
  describe '#hit' do
    it 'should draw a card from the deck and put it in the hand' do
      new_hand.hit!
      expect(new_hand.hand.count).to eq(3)
    end

  end
end
