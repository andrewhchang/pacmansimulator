# frozen_string_literal: true

require 'grid'
require 'position'
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
    if grid.validate_position(position)
      @position = position
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
      candidate_position = @position
      case candidate_position.facing
      when 'NORTH'
        candidate_position.y += 1
      when 'SOUTH'
        candidate_position.y -= 1
      when 'EAST'
        candidate_position.x += 1
      when 'WEST'
        candidate_position.x -= 1
      end
      if grid.validate_position(candidate_position)
        @position = candidate_position
      else 'Invalid move'
      end
    else
      'Pacman is not yet placed'
    end
  end

  def left
    if !@position.nil?
      @position.rotate_left
    else
      'Pacman is not yet placed'
    end
  end

  def right
    if !@position.nil?
      @position.rotate_right
    else
      'Pacman is not yet placed'
    end
  end
end
