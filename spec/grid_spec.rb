# frozen_string_literal: true

require 'spec_helper'
require 'grid'

describe Grid do
  let(:grid) { Grid.new(5, 5) }
  context 'is given valid position' do
    let(:position) { Position.new(2, 2, 'EAST') }
    describe '#validate_position' do
      it 'returns true' do
        expect(grid.validate_position(position)).to be true
      end
    end
  end
  context 'is given an invalid position' do
    describe '#validate_position' do
      it 'returns false (x too large)' do
        position = instance_double('Position', x: 9, y: 2, facing: 'EAST')
        expect(grid.validate_position(position)).to be false
      end
      it 'returns false (x is negative)' do
        position = instance_double('Position', x: -1, y: 2, facing: 'EAST')
        expect(grid.validate_position(position)).to be false
      end
      it 'returns false (y too large)' do
        position = instance_double('Position', x: 2, y: 9, facing: 'EAST')
        expect(grid.validate_position(position)).to be false
      end
      it 'returns false (y is negative)' do
        position = instance_double('Position', x: 2, y: -1, facing: 'EAST')
        expect(grid.validate_position(position)).to be false
      end
    end
  end
end
