# frozen_string_literal: true

require_relative 'lib/pacman'
require_relative 'lib/grid'
require_relative 'lib/position'
require_relative 'lib/command'

# This is the simulator
grid = Grid.new(5, 5)
pacman = Pacman.new(grid)
command = Command.new(pacman)
puts 'Please enter a command'
loop do
  puts '>> '.chomp
  input = gets.chomp
  break if input.upcase.eql? 'EXIT'

  command.run(input)
end
