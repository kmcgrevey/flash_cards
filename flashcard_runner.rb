require './lib/card_generator'
require './lib/deck'
require './lib/round'

cards = CardGenerator.new("cards.txt").cards

deck = Deck.new(cards)

round = Round.new(deck)

round.start