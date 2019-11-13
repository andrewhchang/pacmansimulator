# frozen_string_literal: true

require 'spec_helper'
require 'command'
require 'grid'
require 'pacman'

describe Command do
  grid = Grid.new(5, 5)
  pacman = Pacman.new(grid)
  command = Command.new(pacman)
  context 'when user inputs a valid command' do
    describe '#run' do
      it 'executes the PLACE command' do
        input = 'PLACE 0, 0, NORTH'
        expect(command.run(input)).to be true
      end
      it 'executes the MOVE command' do
        input = 'MOVE'
        expect(command.run(input)).to be true
      end
      it 'executes the RIGHT command' do
        input = 'RIGHT'
        expect(command.run(input)).to be true
      end
      it 'executes the LEFT command' do
        input = 'LEFT'
        expect(command.run(input)).to be true
      end
    end
  end
  context 'when user inputs an invalid command' do
    describe '#run' do
      it 'rejects incorrect PLACE command' do
        input = 'PLACES 0, 0, NORTH'
        expect(command.run(input)).to be false
      end
      it 'rejects incorrect MOVE command' do
        input = 'MOVIES'
        expect(command.run(input)).to be false
      end
      it 'rejects incorrect RIGHT command' do
        input = 'RIGHTY'
        expect(command.run(input)).to be false
      end
      it 'rejects incorrect LEFT command' do
        input = 'LEFTY'
        expect(command.run(input)).to be false
      end
    end
  end
end
