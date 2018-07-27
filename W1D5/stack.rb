class Stack
  def initialize
    # create ivar to store stack here!
    frame_array = []
  end

  def push(el)
    # adds an element to the stack
    frame_array.push(el)
    el
  end

  def pop
    # removes one element from the stack
    frame_array.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    frame_array.last
  end

  private

  attr_reader :frame_array

end
