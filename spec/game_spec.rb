require_relative '../lib/game'



describe Game do
  # describe '#check_for_aces' do
  #   it 'reduces ace value when necessary' do
  #     game = Game.new('Andrew')
  #     ace = Card.new('A', '♠', 11)
  #     ace_hand = [ace, ace, ace]
  #     game.deal_player_hand
  #     game.player_hand.hand = ace_hand
  #     game.player_score = 33
  #     expect(game.check_for_aces).to eq(13)
  #   end
  # end
  # describe '#check_for_bust' do
  #   it 'checks for a bust' do
  #     game = Game.new('Andrew')
  #     king = Card.new('K', '♠', 10)
  #     king_hand = [king, king, king]
  #     game.deal_player_hand
  #     game.player_hand.hand = king_hand
  #     game.player_score = 30
  #     expect(game.check_for_bust).to include("BUST!")
  #   end
  # end
  describe 'the hands pull from the same deck item' do
    it "Ken has no faith, but he was WROOOOONG!" do
        game = Game.new('Ken')
        game.deal_player_hand
        game.deal_computer_hand
        game.player_hits!
        game.computer_turn
        expect(game.deck.deck.count).to be_within(3).of(45)
      end
  end



  # describe '#player_hits?' do
  #   let(:user_input) { "h" }
  #   it 'lets the player hit or stand' do
  #     game = Game.new('Andrew')
  #     game.deal_computer_hand
  #     game.deal_player_hand
  #     expect(game.player_hits?).to eq(false)
  #   end
  #   it 'lets the player hit or stand' do
  #     game = Game.new('Andrew')
  #     game.deal_computer_hand
  #     game.deal_player_hand
  #     expect(game.player_hits?).to eq(false)
  #   end
  #   it 'lets the player hit or stand' do
  #     game = Game.new('Andrew')
  #     game.deal_computer_hand
  #     game.deal_player_hand
  #     expect(game.player_hits?).to eq(true)
  #   end
  #
  # end

  # describe '#computer turn' do
  #   it 'acts as a blackjack dealer wood' do
  #     expect()
  #
  #   end
  # end
end
