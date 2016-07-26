require 'spec_helper'
require 'elevator'

describe Elevator do
  include Elevator

  it 'has a constant with quantity of floors' do
    expect { Elevator::FLOORS_CONST }.to_not raise_error
  end

  describe '#go_to' do
    context 'from the ground floor' do
      it 'goes to the 12th floor of the building' do
        expect(go_to(12)).to eq('12th floor reached')
      end

      it 'goes to 2nd floor of the building' do
        expect(go_to(2)).to eq('2nd floor reached')
      end

      it 'goes to 3nd floor of the building' do
        expect(go_to(3)).to eq('3rd floor reached')
      end
    end

    context 'from any floor' do
      it 'goes to the 1st floor of the building' do
        expect(go_to(1)).to eq('1st floor reached')
      end
    end

    context 'with invalid argument' do
      it 'raise an error if argument is 0' do
        expect do
          go_to(0)
        end.to raise_error(ArgumentError, 'Argument must be a number greater than or equals to 1.')
      end

      it 'raise an error if argument is -1' do
        expect do
          go_to(-1)
        end.to raise_error(ArgumentError, 'Argument must be a number greater than or equals to 1.')
      end

      it 'raise an error if argument is a string' do
        expect do
          go_to('n')
        end.to raise_error('Argument must be a integer.')
      end

      it 'raise an error if argument is an array' do
        expect do
          go_to([1, 2, 3])
        end.to raise_error('Argument must be a integer.')
      end

      it 'raise an error if argument is greater than the maximum number of floors' do
        expect do
          go_to(100)
        end.to raise_error(ArgumentError, 'Argument number must not be greater than the maximum number of floors.')
      end
    end
  end

  describe '#go_to_group' do
    context 'from the ground floor' do
      it 'goes to the floors 3, 4, 7 and 10' do
        expect(go_to_group([4, 3, 10, 7])).to eq([
                                                            '3rd floor reached',
                                                            '4th floor reached',
                                                            '7th floor reached',
                                                            '10th floor reached'
                                                          ])
      end
    end

    context 'with invalid argument' do
      it 'raise an error if array contains a non integer element' do
        expect do
          go_to_group([9, 4, 10, 'a'])
        end.to raise_error(ArgumentError, 'Array must have only integer.')
      end
    end
  end
end
