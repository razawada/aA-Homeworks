  fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

#quadratic search
  def quadratic_fish_find(arr)

    arr.each_with_index do |fish1, i1|

      max_length = true

      arr.each_with_index do |fish2, i2|
        next if i1 == i2
        max_length = false if fish2.length > fish1.length
      end
    end

    return fish1 if max_length  # not how I was approaching this with the true/false conditional, but the quadratic part wasn't that far off
  end

#n log n search

class Array

  def merge_sort(&prc)

    prc ||= Prc.new { |x, y| x <=> y }

    midpoint = count / 2

    sorted_left = self.drop(midpoint).merge_sort(&prc)
    sorted_right = self.take(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private

  def merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end

end

#linear octopus - close to how I solved it the first time, until I realized it wasn't quadratic

def linear_fish_search(fishes)
  biggest_fish = fishes.first

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end

  biggest_fish
end

# linear octopus dance
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

#constant octopus dance
#makes sense, hashes are supposed to be faster as you don't have to iterate through them. 
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
