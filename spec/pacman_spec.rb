# frozen_string_literal: true

# some initial tests
require 'spec_helper'
require 'pacman'

describe 'Pacman' do
  let(:grid) { Grid.new(5, 5) }
  let(:pacman) { Pacman.new(grid) }
  context 'is not yet placed' do
    describe '#place(valid)' do
      let(:position) { Position.new(0, 0, 'NORTH') }
      it 'places the Pacman on the grid at origin, facing NORTH' do
        pacman.place(position)
        expect(position.to_s).to eq('0,0,NORTH')
      end
    end
    describe '#place(invalid)' do
      let(:position) { Position.new(6, 4, 'NORTH') }
      it 'reports the Pacman as unplaced' do
        pacman.place(position)
        expect(pacman.report).to eq('Pacman is not yet placed')
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
        expect(pacman.report).to eql('0,0,NORTH')
      end
    end
    describe '#place(valid)' do
      let(:position) { Position.new(3, 3, 'WEST') }
      it 'places the Pacman on the grid' do
        pacman.place(position)
        expect(pacman.report).to eql('3,3,WEST')
      end
    end
    describe '#move' do
      it 'increases the Pacman\'s position by 1 unit in facing direction' do
        pacman.move
        expect(pacman.report).to eql('0,1,NORTH')
      end
    end
    describe '#left' do
      it 'rotates the Pacman\'s cardinality 90deg to the left' do
        pacman.left
        expect(pacman.report).to eql('0,0,WEST')
      end
    end
    describe '#right' do
      it 'rotates the Pacman\'s cardinality 90deg to the right' do
        pacman.right
        expect(pacman.report).to eql('0,0,EAST')
      end
    end
  end
end
