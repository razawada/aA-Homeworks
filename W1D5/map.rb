class Map

  def initialize
    frame_array = []
  end

  def set(key, value)
    pair_idx = frame_array.index { |pair| pair[0] == key }
    if pair_idx
      frame_array[pair_idx][1] = value
    else
      frame_array.push([key,value])
    end
    value
  end

  def get(key)
    frame_array.each { |pair| return pair[1] if pair[0] == key}
    nil
  end

  def delete(key)
    value = get(key)
    frame_array.reject! { |pair| pair[0] == key }
    value
  end

  def show
    deep_dup(frame_array)
  end


  private

  attr_reader :frame_array

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
