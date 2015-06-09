require_relative 'hand'


class Game
  attr_accessor :player_hand, :player_score, :deck, :player

  def initialize(name)
    @computer_name = "Dealer"
    @player = name
    @deck = Deck.new
  end

  def print_player_score
    puts "#{player}'s score: #{@player_score}\n\n"
  end

  def get_player_input
    print 'Hit or stand? (H/S) '
    gets.chomp
  end

  def check_for_aces_player
    @player_hand.hand.each do |card|
      if card.value == 11 && @player_score > 21
        card.value = 1
        @player_score -= 10
      end
    end
  end

  def check_for_aces_computer
    @computer_hand.hand.each do |card|
      if card.value == 11 && @computer_score > 21
        card.value = 1
        @computer_score -= 10
      end
    end
  end

  def check_for_bust
     unless  @player_score > 21
       game_logic(get_player_input)
     else
       puts "BUST! You looooose."
     end
  end

  def player_hits!
    @player_hand.hit!
    @player_score += @player_hand.hand.last.value
    puts "#{player} was dealt #{@player_hand.hand.last.rank}#{@player_hand.hand.last.suit}"
  end

  def computer_hits!
    @computer_hand.hit!
    @computer_score += @computer_hand.hand.last.value
    check_for_aces_computer
    puts "Dealer dealt itself #{@computer_hand.hand.last.rank}#{@computer_hand.hand.last.suit}"
    computer_turn
  end

  def computer_turn
    if @computer_score < 18
      computer_hits!
    else
      who_won?
    end
  end

  def deal_computer_hand
      @computer_hand = Hand.new(@deck)
      puts "Dealer was dealt []"
      puts "Dealer was dealt #{@computer_hand.hand.last.rank}#{@computer_hand.hand.last.suit}\n\n"
      @computer_score = 0
      @computer_hand.hand.each do |card|
        @computer_score += card.value
      end
      check_for_aces_computer
  end

  def deal_player_hand
    @player_hand = Hand.new(@deck)
    puts "#{player} was dealt #{@player_hand.hand.first.rank}#{@player_hand.hand.first.suit}"
    puts "#{player} was dealt #{@player_hand.hand.last.rank}#{@player_hand.hand.last.suit}\n\n"
    @player_score = 0
    @player_hand.hand.each do |card|
      @player_score += card.value
    end
    check_for_aces_player
    print_player_score
  end

  def game_logic(input)
    if input.downcase == 'h'
      puts "#{player} hits!"
      player_hits!
      check_for_aces_player
      print_player_score
      check_for_bust
    elsif input.downcase == 's'
      puts "#{@player} stands!"
      puts "Dealer reveals #{@computer_hand.hand.first.rank}#{@computer_hand.hand.first.suit} as its first card."
      computer_turn
    else
      puts "I'm sorry #{player}, I can't do that."
      game_logic(get_player_input)
    end
  end

  def who_won?
    puts "Computer Score: #{@computer_score}"
    print_player_score

    if @computer_score > 21
      puts "Dealer busts!  You win!"
    elsif @computer_score >= @player_score
      puts "Dealer wins! (You are bad and you should feel bad)"
    else
      puts "You are a wiener!"
    end
  end

  def play_again?
    print "Would you like to play again? N means no. "
    input = gets.chomp
    if input.downcase == "n"
      puts "Good game!"
    elsif input.to_s == input
      puts "You won't win this time!"
      play_game
    end
  end

  def play_game
    deal_computer_hand
    deal_player_hand
    game_logic(get_player_input)
    play_again?
  end
end
