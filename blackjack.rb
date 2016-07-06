require 'pry'

class Card
  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = determine_value(rank)
  end

  def determine_value(rank)
    values = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K'=> 10, 'A' => 11}
    values[rank]
  end

end


class Deck
  attr_accessor :stack_of_cards

  def initialize
    @stack_of_cards = []
    ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
    suits = %w{Spades Hearts Diamonds Clubs}
    suits.each do |suit|
      ranks.size.times do |i|
        @stack_of_cards << Card.new( ranks[i], suit )
      end
    end
  end

end

class Player
  attr_accessor :hand, :score


  def initialize
    @hand= []
    @score = 0
  end

  def calculate_score
    @hand.each do |card|
      @score += card.value
    end
  end

end

class Game

  def deal_cards(deck, player, n)
    n.times do
      card = deck.stack_of_cards.sample
      player.hand << card
      deck.stack_of_cards.delete card
    end
  end

  def display_cards(player, dealer)
    puts "Player has:"
    player.hand.each do |card|
    puts "#{card.rank} of #{card.suit} worth #{card.value} points"
    puts "You're score is #{player.score}"
  end
    puts "Dealer has:"

     puts "#{dealer.hand.first.rank} of #{dealer.hand.first.suit} worth #{dealer.hand.first.value} points"
     puts "Their score is #{dealer.score}"
  end

  def victory?(player, dealer)
    player.score == 21 || dealer.score == 21
  end

  def bust?(player, dealer)
    player.score > 21 || dealer.score > 21
  end

  def play
    puts "Welcome to Blackjack!"
    deck = Deck.new
    player = Player.new
    dealer = Player.new
    deal_cards(deck, player, 2)
    deal_cards(deck, dealer, 2)
    until victory?(player, dealer) ||bust?(player, dealer)
      player.calculate_score
      dealer.calculate_score
      display_cards(player, dealer)
    end



  end

end

Game.new.play
