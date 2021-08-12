class CardGenerator
  require './lib/card'

  def initialize(filename)
    @filename = filename
  end

  def cards
    card_list = []

    File.foreach("./docs/#{@filename}") do |line| 
      entry = line.delete("\n").split(",")
      card_list << Card.new(entry[0], entry[1], entry[2])
    end

    card_list
  end


end