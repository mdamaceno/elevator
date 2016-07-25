require 'spec_helper'
require 'elevator'

describe Elevator do
  let(:elevator) { Elevator.new }

  it 'has a constant with quantity of floors' do
    expect { Elevator::FLOORS_CONST }.to_not raise_error
  end

  describe '#go_to' do
    context 'from the ground floor' do
      it 'goes to the 12th floor of the building' do
        expect(elevator.go_to(12)).to eq('You are on the 12th floor')
      end

      it 'goes to 2nd floor of the building' do
        expect(elevator.go_to(2)).to eq('You are on the 2nd floor')
      end

      it 'goes to 3nd floor of the building' do
        expect(elevator.go_to(3)).to eq('You are on the 3rd floor')
      end
    end

    context 'from any floor' do
      it 'goes to the 1st floor of the building' do
        expect(elevator.go_to(1)).to eq('You are on the 1st floor')
      end
    end

    context 'with invalid argument' do
      it 'raise an error if argument is 0' do
        expect do
          elevator.go_to(0)
        end.to raise_error(ArgumentError, 'Argument must be a number greater than or equals to 1.')
      end

      it 'raise an error if argument is -1' do
        expect do
          elevator.go_to(-1)
        end.to raise_error(ArgumentError, 'Argument must be a number greater than or equals to 1.')
      end

      it 'raise an error if argument is a string' do
        expect do
          elevator.go_to('n')
        end.to raise_error(ArgumentError, 'Argument must be a integer.')
      end

      it 'raise an error if argument is an array' do
        expect do
          elevator.go_to([1, 2, 3])
        end.to raise_error(ArgumentError, 'Argument must be a integer.')
      end

      it 'raise an error if argument is greater than the maximum number of floors' do
        expect do
          elevator.go_to(100)
        end.to raise_error(ArgumentError, 'Argument number must not be greater than the maximum number of floors.')
      end
    end
  end
end
