# frozen_string_literal: true

require_relative 'position'

# Grid class
class Grid
  attr_reader :x_size
  attr_reader :y_size

  # Initialize table with an X and Y dimension
  def initialize(x_size, y_size)
    @x_size = x_size
    @y_size = y_size
  end

  # Check the bounds of the position with the Grid x and y size
  # return true if position is valid within all bounds and positive.
  def validate_position(position)
    return false unless position.is_a?(Position)

    position.x <= @x_size &&
    position.y <= @y_size &&
    position.x >= 0       &&
    position.y >= 0
  end
end
