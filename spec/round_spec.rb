require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  let(:card1) { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
  let(:card2) { Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM) }
  let(:card3) { Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) }
  let(:deck) { Deck.new([card1, card2, card3]) }
  let(:round) { Round.new(deck) }

  it 'has a deck of cards' do
    expect(round.deck).to eq(deck)
  end

  it 'displays the current card' do
    expect(round.current_card).to eq(card1)
  end

  it 'can take a turn' do
    new_turn = round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to be true
    expect(round.turns).to eq([new_turn])
    expect(round.number_correct).to eq(1)
    expect(round.current_card).to eq(card2)

    round.take_turn("Venus")

    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq("Incorrect.")
    expect(round.number_correct).to eq(1)
    expect(round.number_correct_by_category(:Geography)).to eq(1)
    expect(round.number_correct_by_category(:STEM)).to eq(0)
    expect(round.percent_correct).to eq(50.0)
    expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(round.current_card).to eq(card3)
  end
end