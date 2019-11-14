# frozen_string_literal: true

require_relative 'grid'
require_relative 'position'

# Pacman class
class Pacman
  attr_accessor :position
  # Pacman should be assigned to a given grid when first created
  def initialize(grid)
    @position = nil
    @grid = grid
  end

  # Only assign Pacman's position if PLACE command is valid, else nil.
  def place(position)
    if @grid.validate_position(position)
      @position = position
      'Pacman has been placed.'
    else
      'Position is invalid'
    end
  end

  # Return position as string
  def report
    if !@position.nil?
      position.to_s
    else
      'Pacman is not yet placed'
    end
  end

  # If pacman is placed, create new Position based on facing direction
  # Validate new Position against grid dimensions
  # If valid, assign position to Pacman, else ignore.
  def move
    if !@position.nil?
      candidate_position = @position.dup.forward_move
      if @grid.validate_position(candidate_position)
        @position = candidate_position
        'Pacman moved 1 unit forward'
      else 'Cannot move here'
      end
    else
      'Pacman is not yet placed'
    end
  end

  # Request to update Pacman's facing direction
  # No need for validity check - if Pacman has a position,
  # then all facing directions are valid
  def left
    if !@position.nil?
      @position.rotate_left
      'Pacman turned left.'
    else
      'Pacman is not yet placed'
    end
  end

  def right
    if !@position.nil?
      @position.rotate_right
      'Pacman turned right'
    else
      'Pacman is not yet placed'
    end
  end
end
