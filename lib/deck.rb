require_relative 'card.rb'

class Deck
  attr_reader :cards

  def initialize
    @cards = Card.build_deck
  end

  def shuffle
    cards.shuffle!
  end

  def deal!
    cards.pop
  end

end
