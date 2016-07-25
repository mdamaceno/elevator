class Elevator
  FLOORS_CONST ||= 15

  def go_to(_num)
    raise ArgumentError, 'Argument must be a integer.' unless _num.is_a? Integer
    raise ArgumentError, 'Argument number must not be greater than the maximum number of floors.' if _num > FLOORS_CONST
    raise ArgumentError, 'Argument must be a number greater than or equals to 1.' if _num < 1

    return "You are on the #{_num}th floor" unless (1..3).cover?(_num)

    %w(st nd rd).each_with_index do |pos, i|
      return "You are on the #{_num}#{pos} floor" if _num == i + 1
    end
  end

  def go_to_group(_nums = [])
    _nums.sort!
    last = _nums.length - 1
    "The elevator reached the floors: #{_nums.first(last).join(', ')} and #{_nums[last]}"
  end
end
