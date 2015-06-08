require_relative '../lib/deck'
require 'rspec'


describe Deck do
  let(:test_deck) { Deck.new }
  describe '#initialize' do
    it 'should have 52 cards in an array' do
      what = test_deck
      expect(what.deck.count).to eq(52)
    end
    it 'should have the seven of spades' do
      expect(test_deck.deck.include?(Card.new('7', 7, '♠')))
    end
    it 'should have the king of spades' do
      expect(test_deck.deck.include?(Card.new('K', 10, '♠')))
    end
  end
  describe '#draw!' do
    it 'should draw a card from the deck' do
      test_deck.draw!
      expect(test_deck.deck.count).to eq(51)
    end
  end

  end
