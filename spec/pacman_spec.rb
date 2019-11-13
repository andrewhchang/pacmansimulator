# frozen_string_literal: true

# some initial tests
require 'spec_helper'
require 'pacman'

describe 'Pacman' do
  let(:grid) { instance_double('Grid', x_size: 5, y_size: 5) }
  let(:pacman) { Pacman.new(grid) }
  context 'is not yet placed' do
    describe '#place(valid)' do
      let(:position) { instance_double('Position', x: 0, y: 0, d: 'NORTH') }
      it 'places the Pacman on the grid at origin, facing NORTH' do
        pacman.place(position)
        expect(pacman.position).to eq(position)
      end
    end
    describe '#place(invalid)' do
      let(:position) { instance_double('Position', x: 6, y: 4, d: 'NORTH') }
      it 'reports an invalid placement position' do
        pacman.place(position)
        expect(pacman.position).to be nil
      end
    end
    describe '#move' do
      it 'reports the Pacman as unplaced' do
        pacman.move
        expect(pacman.report).to eq('Pacman is not yet placed')
      end
    end
    describe '#report' do
      it 'reports the Pacman as unplaced' do
        expect(pacman.report).to eq('Pacman is not yet placed')
      end
    end
    describe '#left' do
      it 'reports the Pacman as unplaced' do
        pacman.left
        expect(pacman.report).to eq('Pacman is not yet placed')
      end
    end
    describe '#right' do
      it 'reports the Pacman as unplaced' do
        pacman.right
        expect(pacman.report).to eq('Pacman is not yet placed')
      end
    end
  end
  context 'is placed' do
    before do
      pacman.place(Position.new(0, 0, 'NORTH'))
    end
    describe '#report' do
      it 'reports the Pacman\'s current position' do
        expect(pacman.report).to eql('0, 0, NORTH')
      end
    end
    describe '#place(valid)' do
      let(:position) { instance_double('Position', x: 3, y: 3, d: 'WEST') }
      it 'places the Pacman on the grid' do
        pacman.place(position)
        expect(pacman.report).to eql('3, 3, WEST')
      end
    end
    describe '#place(invalid)' do
      let(:position) { instance_double('Position', x: 6, y: 7, d: 'UP') }
      it 'does not change the Pacman\'s position' do
        pacman.place(position)
        expect(pacman.report).to eql('0, 0, NORTH')
      end
    end
    describe '#move' do
      it 'increases the Pacman\'s position by 1 unit in facing direction' do
        pacman.move
        expect(pacman.report).to eql('0, 1, NORTH')
      end
    end
    describe '#left' do
      it 'rotates the Pacman\'s cardinality 90deg to the left' do
        pacman.left
        expect(pacman.report).to eql('0, 0, WEST')
      end
    end
    describe '#right' do
      it 'rotates the Pacman\'s cardinality 90deg to the right' do
        pacman.right
        expect(pacman.report).to eql('0, 0, EAST')
      end
    end
  end
end
