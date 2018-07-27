class Queue

  def initialize
    frame_array = []
  end


  def enqueue(el)
    frame_array.push(el)
    el
  end

  def dequeue(el)
    frame_array.shift
  end

  def peek
    frame_array.first
  end

  private

  attr_reader :frame_array

end
