require 'spec_helper'
require 'position'

describe Position do
  let(:position) { instance_double('Position', x: 2, y: 2, facing: 'NORTH') }
  describe '#forward_move' do
    new_position = position.forward_move
    expect(new_position.y).to be 3
  end
  describe '#rotate_left' do
    new_position = position.rotate_left
    expect(new_position.facing).to eql('WEST')
  end
  describe '#rotate_right' do
    new_position = position.rotate_right
    expect(new_position.facing).to eql('EAST')
  end
end
