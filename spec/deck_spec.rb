require 'deck.rb'


describe Deck do

  subject(:deck) { Deck.new }

  describe "#initialize" do

    it "contains deck of 52 cards" do

      expect(deck.cards.length).to eq(52)

    end

  end

  describe "#shuffle" do

    it "shuffles cards in random order" do
        unshuffled_cards = deck.cards.dup
        deck.shuffle
      expect(unshuffled_cards == deck.cards).to be false

    end

  end

  describe "#deal!" do

    it "returns top card from deck" do
      top_card = deck.cards.last

      expect(deck.deal!).to eq(top_card)

    end
  end

end
