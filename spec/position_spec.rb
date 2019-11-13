# frozen_string_literal: true

require 'spec_helper'
require 'position'

describe Position do
  let(:position) { Position.new(2, 2, 'NORTH') }
  describe '#forward_move' do
    it 'returns a new position moved 1 unit in facing direction' do
      new_position = position.forward_move
      expect(new_position.y).to be 3
    end
  end
  describe '#rotate_left' do
    it 'returns the same position with the cardinality to the left' do
      new_position = position.rotate_left
      expect(new_position.facing).to eql('WEST')
    end
  end
  describe '#rotate_right' do
    it 'returns the same position with the cardinality to the right' do
      new_position = position.rotate_right
      expect(new_position.facing).to eql('EAST')
    end
  end
  describe '#to_s' do
    it 'returns string containing the x, y coords and facing direction' do
      expect(position.to_s).to eql('2, 2, NORTH')
    end
  end
end
