require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  let(:card1) { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
  let(:card2) { Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM) }
  let(:card3) { Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) }
  let(:cards) { [card1, card2, card3] }
  let(:deck) { Deck.new(cards) }

  it 'has cards' do
    expect(deck.cards).to eq(cards)
  end
  
  it 'has a count of cards' do
    expect(deck.count).to eq(3)
  end
  
  it 'can list cards by category' do
    expect(deck.cards_in_category(:STEM)).to eq([card2, card3])
    expect(deck.cards_in_category(:Geography)).to eq([card1])
    expect(deck.cards_in_category("Pop Culture")).to eq([])
  end

end