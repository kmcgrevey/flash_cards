require './lib/card_generator'

describe CardGenerator do
  it 'exists' do
    expect(CardGenerator).to be_a Class
  end

  it 'creates a list of cards' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    expect(cards.length).to eq(4)
    expect(cards[0].question).to eq('What is the capital of Alaska?')
    expect(cards[1].answer).to eq('Mars')
    expect(cards[2].category).to eq('STEM')
    expect(cards[3].class).to eq(Card)
  end

end