require_relative 'deck.rb'

class Hand

  attr_writer :cards

  HAND_RANKS = [
    "Straight flush",
    "Four-of-a-kind",
    "Full House",
    "Flush",
    "Straight",
    "Three-of-a-kind",
    "Two-pair",
    "Pair",
    "High card"
  ]

  VALUES =  %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  VALUES_HASH = {
    "A" => 0,
    "2" => 1,
    "3" => 2,
    "4" => 3,
    "5" => 4,
    "6" => 5,
    "7" => 6,
    "8" => 7,
    "9" => 8,
    "10" => 9,
    "J" => 10,
    "Q" => 11,
    "K" => 12
  }

  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def draw_card(deck)
    cards << deck.deal! unless cards.length == 5
  end

  def calculate_hand
    counts = count_cards
    return "Straight flush" if flush? && straight?
    return "Four-of-a-kind" if counts.has_value?(4)
    return "Full House" if counts.has_value?(3) && counts.has_value?(2)
    return "Flush" if flush?
    return "Straight" if straight?
    return "Three-of-a-kind" if counts.has_value?(3)
    return "Two-pair" if two_pair?
    return "Pair" if counts.has_value?(2)
    high_card
  end

  def count_cards
    counts = Hash.new(0)
    cards.each do |card|
      counts[card.value] += 1
    end
    counts

  end

  def flush?
    suit = cards[0].suit
    cards.all?{ |card| card.suit == suit }
  end

  def straight?
    card_values = []
    cards.each { |el| card_values << VALUES_HASH[el.value] }
    card_values.sort!
    return true if card_values == [0, 9, 10, 11, 12]
    card_values.each_with_index do |el, idx|
      return false unless idx == 0 || el - 1 == card_values[idx - 1]
    end
    true
  end

  def two_pair?
    counts = count_cards
    counts.has_value?(2) && counts.size == 3
  end

  def high_card
    card_values = []
    cards.each { |el| card_values << VALUES_HASH[el.value] }
    card_values.sort!
    return "A high" if card_values[0] == 0
    "#{VALUES_HASH.key(card_values[4])} high"
  end



end
