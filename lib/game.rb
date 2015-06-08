require_relative 'hand'


class Game
  attr_accessor :player_hand, :player_score

  def initialize(name)
    @computer_name = "Dealer"
    @player_name = name
    @deck = Deck.new
  end

  def deal_computer_hand
      @computer_hand = Hand.new(@deck)
      puts "Dealer was dealt #{@computer_hand.hand.first.rank}#{@computer_hand.hand.first.suit}"
      puts "Dealer was dealt #{@computer_hand.hand.last.rank}#{@computer_hand.hand.last.suit}"
      @computer_score = 0
      @computer_hand.hand.each do |card|
        @computer_score += card.value
      end
      check_for_aces_computer
      print "Computer score: "
      puts @computer_score
  end

  def deal_player_hand
    @player_hand = Hand.new(@deck)
    puts "Player was dealt #{@player_hand.hand.first.rank}#{@player_hand.hand.first.suit}"
    puts "Player was dealt #{@player_hand.hand.last.rank}#{@player_hand.hand.last.suit}"
    print "Player score: "
    @player_score = 0
    @player_hand.hand.each do |card|
      @player_score += card.value
    end
    check_for_aces_player
    puts @player_score
  end

  def check_for_aces_player
    @player_hand.hand.each do |card|
      if card.rank == 'A' && @player_score > 21
        card.rank = " A"
        @player_score -= 10
      end
    end
  end

  def check_for_aces_computer
    @computer_hand.hand.each do |card|
      if card.rank == 'A' && @computer_score > 21
        card.rank = " A"
        @computer_score -= 10
      end
    end
  end

  def check_for_bust
     @player_score > 21
  end

  def play_game
    print 'Hit or stand? (H/S) '
    input = gets.chomp
    if input.downcase == 'h'
      puts "Player_hits!"
      player_hits!
      check_for_aces_player
      print "Player score: "
      puts @player_score
      unless check_for_bust
        play_game
      else
        puts "BUST! You looooose."
      end
    elsif input.downcase == 's'
      puts "#{@player_name} stands!"
      computer_turn
    else
      puts "I'm sorry Dave, I can't do that."
      play_game
    end
  end

  def player_hits!
    @player_hand.hit!
    @player_score += @player_hand.hand.last.value
    puts "Player was dealt #{@player_hand.hand.last.rank}#{@player_hand.hand.last.suit}"
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

  def who_won?
    print "Computer Score: "
    puts @computer_score
    print "Player Score: "
    puts @player_score

    if @computer_score > 21
      puts "Dealer busts!  You win!"
    elsif @computer_score > @player_score
      puts "Dealer wins! (You are bad and you should feel bad)"
    else
      puts "You are a wiener!"
    end

  end

end
