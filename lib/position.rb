# frozen_string_literal: true

# Class to handle the position on the grid and facing direction
class Position
  attr_reader :x, :y, :facing
  # Initialise each position with an x, y and direction
  def initialize(x_pos, y_pos, facing)
    # Ordered list of cardinal directions for left turn
    @cardinals = %w[NORTH EAST SOUTH WEST].freeze
    # Reversed list of cardinal directions for right turn
    @cardinals_rev = @cardinals.reverse
    # Error handling for x, y, facing
    begin
      unless @cardinals.include?(facing)
        raise TypeError, "\nPLACE format: PLACE X,Y,[NORTH|SOUTH|EAST|WEST]"\
                         "\nGot '#{x_pos},#{y_pos},#{facing}'"
      end
      # Check for non-integer inputs
      Integer(x_pos)
      Integer(y_pos)
    rescue TypeError => e
      puts e
      return
    rescue ArgumentError => e
      puts 'X and Y must both be integers'
      return
    end
    @x = x_pos.to_i
    @y = y_pos.to_i
    @facing = facing
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
    "#{@x},#{@y},#{@facing}"
  end
end
