# frozen_string_literal: true

require_relative 'position'

# Grid class
class Grid
  attr_reader :x_size
  attr_reader :y_size

  # Initialize table with an X and Y dimension
  def initialize(x_size, y_size)
    unless x_size < 1 || y_size < 1
      @x_size = x_size - 1
      @y_size = y_size - 1
    end
  end

  # Check the bounds of the position with the Grid x and y size
  # return true if position is valid within all bounds and positive.
  def validate_position(position)
    return false unless position.is_a?(Position) && !position.nil?

    position.x <= @x_size &&
      position.y <= @y_size &&
      position.x >= 0       &&
      position.y >= 0
  end
end
