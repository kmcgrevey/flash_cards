class Round
  require './lib/game'
  require './lib/turn'
  
  attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    turns << turn
    @deck.cards.shift

    turn
  end

  def number_correct
    correct.length
  end
  
  def number_correct_by_category(category)
    correct.find_all { |turn| turn.card.category == category }.length
  end

  def correct
    @turns.find_all { |turn| turn.correct? }
  end

  def number_turns_by_category(category)
    @turns.find_all { |turn| turn.card.category == category }.length
  end

  def percent_correct
    (number_correct.to_f / @turns.length) * 100
  end
  
  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / number_turns_by_category(category)) * 100
  end

  def start
    Game.play_game(self)
  end

end