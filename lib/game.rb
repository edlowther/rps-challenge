require_relative 'human'
require_relative 'computer'
require_relative 'outcome_finder'

class Game
  attr_reader :player, :computer, :computer_selection

  def self.create name
    @game = Game.new name
  end

  def self.instance
    @game
  end

  def initialize player_name, player_class = Human, computer_class = Computer
    @player = player_class.new player_name
    @computer = computer_class.new
  end
  
  def turn human_selection
    @computer_selection = computer.selection
    outcome = OutcomeFinder::OUTCOMES[computer_selection][human_selection]
    player.update_score outcome
    return outcome
  end
end
