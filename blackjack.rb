require 'pry'

class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
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
  attr_accessor :hand


  def initialize
    @hand= []
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
    puts "#{card.rank} of #{card.suit}"
  end
    puts "Dealer has:"

     puts "#{dealer.hand.first.rank} of #{dealer.hand.first.suit}"
  end

  def play
    puts "Welcome to Blackjack!"
    deck = Deck.new
    player = Player.new
    dealer = Player.new
    deal_cards(deck, player, 2)
    deal_cards(deck, dealer, 2)
    display_cards(player, dealer)



  end

end

Game.new.play
