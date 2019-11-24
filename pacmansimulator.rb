# frozen_string_literal: true

require_relative 'lib/pacman'
require_relative 'lib/grid'
require_relative 'lib/position'
require_relative 'lib/command'

# This is the simulator
grid = Grid.new(5, 5)
pacman = Pacman.new(grid)
command = Command.new(pacman)
puts "The grid size is #{grid.x_size + 1}x#{grid.y_size + 1}."
puts 'PLACE the robot to begin.'
puts 'Please enter a command'
loop do
  puts ' '.chomp
  input = gets.chomp.upcase
  break if input.upcase.eql? 'EXIT'

  if input.eql?('RUN TEST_SUITE')
    tests = File.open('test_cases/test_suite.txt')
    puts ''
    tests.each do |line|
      if line.chomp.empty?
        puts ''
        next
      end
      puts 'Invalid Command' unless command.run(line.chomp)
    end
    tests.close
    break
  end

  puts 'Invalid Command' unless command.run(input)
end
