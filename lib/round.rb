class Round
  attr_reader :deck, :turns#, :new_turn

  def initialize(deck)
    @deck = deck
    @turns = []
    @used_cards = []
    # @all_correct = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    # new_turn_maker(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @used_cards = @deck.cards.shift
    new_turn
  end

  def number_correct
    @correct = @turns.find_all {|turn| turn.correct? }
    # @all_correct << correct
    @correct.length
  end

  def number_correct_by_category(category)
    correct_cat = @correct.find_all do |turn|
      turn.card.category == category
    end
    correct_cat.length
  end

  def percent_correct
    (number_correct.to_f / @turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / number_turns_by_category(category).to_f) * 100
  end

  def number_turns_by_category(category)
    @turns.count {|turn| turn.card.category == category }
  end
end
