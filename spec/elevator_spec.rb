require 'elevator'

describe Elevator do
  it 'has a constant with quantity of floors' do
    expect { Elevator::FLOORS_CONST }.to_not raise_error
  end

  describe '#destinations' do
    context 'from the ground floor' do
      it 'goes to the floors 3, 4, 7 and 10' do
        expect(Elevator.destinations([4, 3, 10, 7])).to eq([
                                                             '3rd floor reached',
                                                             '4th floor reached',
                                                             '7th floor reached',
                                                             '10th floor reached'
                                                           ])
      end

      context 'with duplicated numbers' do
        it 'goes to the floors 3, 4, 7 and 10' do
          expect(Elevator.destinations([7, 4, 3, 4, 10, 7])).to eq([
                                                                     '3rd floor reached',
                                                                     '4th floor reached',
                                                                     '7th floor reached',
                                                                     '10th floor reached'
                                                                   ])
        end
      end
    end

    context 'with invalid argument' do
      it 'raise an error if array contains a non integer element' do
        expect do
          Elevator.destinations([9, 4, 10, 'a'])
        end.to raise_error(Elevator::InvalidArgument)
      end
    end
  end
end
