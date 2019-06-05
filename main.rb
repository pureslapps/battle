def reverse_the_string (string)
  split_string = string.split('')
  reversed = []
  string.size.times { reversed << split_string.pop }
  reversed.join
end

puts reverse_the_string('cloud')
