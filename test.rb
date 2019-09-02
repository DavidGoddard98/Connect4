array = [[1,2],[3,4]]
puts "original array"
puts array.map { |x| x.join(' ') }
puts array[0][1]
array = array.reverse
puts "flipped array"
puts array.map { |x| x.join(' ') }

puts array[0][1]
