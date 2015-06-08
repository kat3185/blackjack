require_relative 'lib/card'
require_relative 'lib/deck'
require_relative 'lib/hand'
require_relative 'lib/game'





test_deck = Deck.new

test_deck.shuffle!

Hand.new(test_deck)
