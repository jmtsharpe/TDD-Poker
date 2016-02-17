require 'card.rb'

describe Card do

  subject(:card) { Card.new("7", :hearts) }

  describe "#initialize" do

    it "takes a value" do

      expect(card.value).to eq("7")

    end

    it "takes a suit" do

      expect(card.suit).to eq(:hearts)

    end

  end

  describe "SUITS" do

    it "is an array of four suits" do

      expect(Card::SUITS.length).to eq(4)

    end
  end

  describe "VALUES" do

    it "is an array of 13 values" do

      expect(Card::VALUES.length).to eq(13)

    end

  end

  describe "#==" do

    it "returns true for 2 cards of same value and suit" do

      new_card = Card.new("7", :hearts)

      expect(card == new_card).to be true

    end

  end

  describe "::build_deck" do

    it "creates a deck of 52 cards" do

      expect(Card.build_deck.length).to eq(52)

    end

    it "creates 52 unique cards" do

      expect(Card.build_deck.uniq.length).to eq(52)

    end

  end

end
