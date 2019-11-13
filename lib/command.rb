# frozen_string_literal: true

require_relative 'pacman'

# Class to accept and run user input commands
class Command
  def initialize(pacman)
    @pacman = pacman
    @valid_commands = %w[PLACE MOVE LEFT RIGHT REPORT].freeze
  end

  def run(input)
    return false unless input.is_a?(String) && !input.nil?

    # split the input into 2 strings (our params), execute if
    # first string is one of our valid commands, else reject
    parameters = input.upcase.split(' ', 2)
    return false unless @valid_commands.include?(parameters[0])

    case parameters[0]
    when 'PLACE'
      place_params = parameters[1].split(',')
      @pacman.place(Position.new(
                      place_params[0].to_i,
                      place_params[1].to_i,
                      place_params[2]
                    ))
    when 'MOVE'
      puts @pacman.move
    when 'RIGHT'
      puts @pacman.right
    when 'LEFT'
      puts @pacman.left
    when 'REPORT'
      puts @pacman.report
    end
    true
  end
end
