

class Card

  attr_reader :value, :suit

  SUITS = [:hearts, :spades, :clubs, :diamonds]

  VALUES =  %w(A 2 3 4 5 6 7 8 9 10 J Q K)

  def initialize(value, suit)

    @value = value
    @suit = suit

  end

  def self.build_deck
    deck = []

    VALUES.each do |value|
      SUITS.each do |suit|
        deck << Card.new(value, suit)
      end
    end
    deck
  end

  def ==(card)
    return false unless card.is_a?(Card)
    value == card.value && suit == card.suit
  end

end
