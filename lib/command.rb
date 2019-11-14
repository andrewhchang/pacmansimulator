# frozen_string_literal: true

require_relative 'pacman'

# Class to accept and run user input commands
class Command
  def initialize(pacman)
    @pacman = pacman
    @valid_commands = %w[PLACE MOVE LEFT RIGHT REPORT].freeze
  end

  def run(input)
    return false if input.nil?

    parameters = parse_input(input)
    # Reject if input not contained in valid_commands
    return false unless @valid_commands.include?(parameters[0])

    # If input contained two words, first word MUST be 'PLACE'
    # execute other commands only if they're valid AND one string.
    begin
      if parameters[0].eql?('PLACE') &&
         parameters.size == 2
        place_params = parse_coords(parameters[1])
        puts @pacman.place(Position.new(
                             place_params[0],
                             place_params[1],
                             place_params[2]
                           ))
        return true
      end
    rescue NoMethodError
      return false
    end
    # Will only return true if nothing else is placed after
    # valid command
    if parameters.size == 1
      case parameters[0]
      when 'PLACE'
        return false
      when 'MOVE'
        puts @pacman.move
      when 'RIGHT'
        puts @pacman.right
      when 'LEFT'
        puts @pacman.left
      when 'REPORT'
        puts @pacman.report
      end
      return true
    end
    false
  end

  def parse_input(input)
    # If input has a space in it
    # split the input into 2 strings (our params)
    # (case insensitive)
    parameters = []
    if input.match(' ')
      parameters = input.split(' ', 2)
    else
      parameters << input
    end
    parameters
  end

  def parse_coords(coords)
    coords.split(',')
  end
end
