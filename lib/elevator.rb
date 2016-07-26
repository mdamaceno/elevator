require_relative 'elevator/exceptions'

module Elevator
  FLOORS_CONST ||= 15

  def go_to(_num)
    return "#{_num}th floor reached" unless (1..3).cover?(_num)

    %w(st nd rd).each_with_index do |_pos, _i|
      return "#{_num}#{_pos} floor reached" if _num == _i + 1
    end
  end

  def go_to_group(_nums)
    _nums.sort!
    messages = []

    _nums.each do |_num|
      messages << go_to(_num)
    end

    messages
  end

  class Basement
    include Elevator
  end

  def self.destiny(_num)
    raise Elevator::InvalidArgument, 'Argument must be a integer.' unless _num.is_a? Integer
    raise Elevator::InvalidArgument, 'Argument number must not be greater than the maximum number of floors.' if _num > FLOORS_CONST
    raise Elevator::InvalidArgument, 'Argument must be a number greater than or equals to 1.' if _num < 1

    Basement.new.go_to(_num)
  end

  def self.destinations(_nums = [])
    raise Elevator::InvalidArgument, 'Array must have only integer.' unless _nums.all? { |i| i.is_a? Integer }
    raise Elevator::InvalidArgument, 'Array must not have any number greater than the maximum number of floors.' unless _nums.all? { |i| i < FLOORS_CONST }
    raise Elevator::InvalidArgument, 'Array must have numbers greater than 0.' unless _nums.all? { |i| i > 0 }

    Basement.new.go_to_group(_nums)
  end
end
