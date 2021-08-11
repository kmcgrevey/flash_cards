module Game
  def self.play_game(round)
    @round = round
    @deck_count = round.deck.count

    welcome_banner
    draw_cards
    summary
  end

  def self.welcome_banner
    system("clear")
    puts "Welcome! You're playing with #{@deck_count} cards."
    puts "-------------------------------------------------"
  end

  def self.draw_cards
    until @round.turns.count == @deck_count
      puts "This is card number #{@round.turns.size + 1} out of #{@deck_count}."
      puts "Question: #{@round.current_card.question}"
      
      guess = gets.chomp
      @round.take_turn(guess)

      puts "#{@round.turns.last.feedback}"
      puts ""
    end
  end

  def self.summary
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@round.turns.size} for a total score of #{@round.percent_correct.to_i}%."
    categories.each do |cat|
      puts "#{cat} -- #{@round.percent_correct_by_category(cat).to_i}% correct"
    end
  end

  def self.categories
    @round.turns.map { |turn| turn.card.category }.uniq
  end

end
