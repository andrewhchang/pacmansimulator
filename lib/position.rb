# frozen_string_literal: true

# Class to handle the position on the grid and facing direction
class Position
  attr_reader :x, :y, :facing
  # Initialise each position with an x, y and direction
  def initialize(x_pos, y_pos, facing)
    @x = x_pos
    @y = y_pos
    @facing = facing
    # Ordered list of cardinal directions
    @cardinals = %w[NORTH EAST SOUTH WEST].freeze
    # Reversed list of cardinal directions
    @cardinals_rev = @cardinals.reverse
  end

  # Return position with one of x, y being moved 1 unit in the
  # facing direction.
  def forward_move
    case @facing
    when 'NORTH'
      @y += 1
    when 'SOUTH'
      @y -= 1
    when 'EAST'
      @x += 1
    when 'WEST'
      @x -= 1
    end
    self
  end

  # Use the index of current direction to find the left
  # cardinal direction (i.e. current index - 1)
  def rotate_left
    @facing =
      @cardinals[@cardinals.index(@facing) - 1]
    self
  end

  # Same theory as turning left, except this can be accomplished
  # by using the reversed form of the cardinal array.
  def rotate_right
    @facing =
      @cardinals_rev[@cardinals_rev.index(@facing) - 1]
    self
  end

  # Override to_s method
  def to_s
    "#{@x}, #{@y}, #{@facing}"
  end
end
