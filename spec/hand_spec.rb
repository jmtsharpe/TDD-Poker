require 'hand.rb'

describe Hand do

  subject(:hand) { Hand.new }

  describe "#initialize" do

    it "has an array of cards" do

      expect(hand.cards.class).to eq(Array)

    end

  end

  describe "#draw_card" do
    let(:deck) { double("deck") }
    let(:card) { double("card") }

    it "draws a card from the deck" do
      allow(deck).to receive(:deal!).and_return(card)

      hand.draw_card(deck)
      expect(hand.cards.length).to eq(1)

    end

    it "won't draw when hand is full" do
      allow(deck).to receive(:deal!).and_return(card)

      6.times { hand.draw_card(deck) }
      expect(hand.cards.length).to eq(5)

    end
  end

  describe "#calculate_hand" do

    it "recognizes a straight flush" do

      hand.cards = [
        Card.new("3", :hearts),
        Card.new("7", :hearts),
        Card.new("4", :hearts),
        Card.new("6", :hearts),
        Card.new("5", :hearts)
      ]

      expect(hand.calculate_hand).to eq("Straight flush")

    end

    it "recognizes four-of-a-kind" do

      hand.cards = [
        Card.new("4", :hearts),
        Card.new("4", :spades),
        Card.new("4", :diamonds),
        Card.new("4", :clubs),
        Card.new("5", :hearts)
      ]

      expect(hand.calculate_hand).to eq("Four-of-a-kind")

    end

    it "recognizes full house" do

      hand.cards = [
        Card.new("4", :hearts),
        Card.new("4", :spades),
        Card.new("4", :diamonds),
        Card.new("5", :clubs),
        Card.new("5", :hearts)
      ]

      expect(hand.calculate_hand).to eq("Full House")

    end

    it "recognizes flush" do

      hand.cards = [
        Card.new("3", :hearts),
        Card.new("7", :hearts),
        Card.new("2", :hearts),
        Card.new("9", :hearts),
        Card.new("5", :hearts)
      ]

      expect(hand.calculate_hand).to eq("Flush")
    end

    it "recognizes a standard straight" do

      hand.cards = [
        Card.new("3", :hearts),
        Card.new("7", :clubs),
        Card.new("4", :hearts),
        Card.new("6", :hearts),
        Card.new("5", :hearts)
      ]

      expect(hand.calculate_hand).to eq("Straight")

    end

    it "recognizes an Ace-high straight" do

      hand.cards = [
        Card.new("A", :hearts),
        Card.new("J", :clubs),
        Card.new("10", :hearts),
        Card.new("Q", :hearts),
        Card.new("K", :hearts)
      ]

      expect(hand.calculate_hand).to eq("Straight")

    end


    it "recognizes three-of-a-kind" do

      hand.cards = [
        Card.new("4", :hearts),
        Card.new("4", :spades),
        Card.new("4", :diamonds),
        Card.new("2", :clubs),
        Card.new("5", :hearts)
      ]

      expect(hand.calculate_hand).to eq("Three-of-a-kind")

    end

    it "recognizes a two-pair" do

      hand.cards = [
        Card.new("4", :hearts),
        Card.new("4", :spades),
        Card.new("2", :diamonds),
        Card.new("2", :clubs),
        Card.new("5", :hearts)
      ]

      expect(hand.calculate_hand).to eq("Two-pair")

    end

    it "recognizes a pair" do

      hand.cards = [
        Card.new("4", :hearts),
        Card.new("4", :spades),
        Card.new("2", :diamonds),
        Card.new("6", :clubs),
        Card.new("5", :hearts)
      ]

      expect(hand.calculate_hand).to eq("Pair")

    end

    it "returns high card" do

      hand.cards = [
        Card.new("7", :hearts),
        Card.new("4", :spades),
        Card.new("2", :diamonds),
        Card.new("6", :clubs),
        Card.new("5", :hearts)
      ]

      expect(hand.calculate_hand).to eq("7 high")


    end

    it "returns Ace high" do

      hand.cards = [
        Card.new("A", :hearts),
        Card.new("4", :spades),
        Card.new("2", :diamonds),
        Card.new("6", :clubs),
        Card.new("5", :hearts)
      ]

      expect(hand.calculate_hand).to eq("A high")


    end

  end

end
