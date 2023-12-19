# input = 'day5input.txt'
# file = File.open(input, 'r')

# file_contents = file.read

# file.close

# # puts file_contents


# #destination, source, range

file_contents ="seeds:
79 14 55
13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4"
array_step_1 = file_contents.split(/\n+/)

# print array_step_1


result_array = []
current_subarray = []
array_step_2 = array_step_1.each do |item|
  if item.match?(/[a-zA-Z]/) && !current_subarray.empty?
    result_array << current_subarray.dup
    current_subarray.clear
  end
  current_subarray << item
end

# Add the last subarray if the input array ends with text
result_array << current_subarray.dup unless current_subarray.empty?

# puts result_array.inspect

final_hash = {}

result_array.each_with_index do |item,index|
  title = item[0].chomp(":").chomp("map")
  final_hash[title] = item[1..-1]
end

# puts final_hash.inspect

final_hash.each do |key, value|
 if key == "seeds"
  final_hash[key] = value.flat_map { |number_string| number_string.split.map(&:to_i) }
 else
  final_hash[key] = value.map { |number_string| number_string.split.map(&:to_i) }
 end
end

seeds_array = final_hash["seeds"]
final_hash.shift

# puts final_hash
# puts "END OF HASH"
# puts final_hash.inspect

puts seeds_array
seeds_array.map do |seed_number|
  source_array = []
  destination_array = []
  final_hash.each do |key, numbers|
    puts "Final hash #{key} => #{numbers}"
    numbers.each_with_index do |value, _index1|
      puts "VALUE IS #{value.inspect}, "
      #VALUE IS AN ARRAY OF 3

      range = value[2]
      puts "RANGE IS #{range}"
      value.each_with_index do |number, index|

      puts "key hopefully value #{value}, index #{index}, range #{range}"
      puts "number class = #{number.class}"
      # puts "interior values #{number}, #{index2}"
      if index == 1
      end_value = number + range
      puts "SUPPOSED RANGE #{(number..end_value)}"

      puts "END VALUE IS #{end_value}"
      # puts value
      # puts range
        source_array << (number..end_value)
      end
      if index == 0
        puts "SUPPOSED RANGE #{(number..end_value)}"
        puts "END VALUE IS #{end_value}"
        end_value = number + range
        destination_array << (number..end_value)
      end
    end

  end
  # puts "Source array"
  # puts source_array.inspect
  # puts "destination array"
  # puts destination_array
  # puts " ================="
  end

end
