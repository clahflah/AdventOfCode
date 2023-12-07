
# input = 'day4input.txt'
# file = File.open(input, 'r')

# file_contents = file.read

# file.close

# puts file_contents

file_contents = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"
split_file_by_card = file_contents.split("\n")

individual_game_hash ={}

index_hash = split_file_by_card.map.with_index do |game, index|
  game = game.gsub("Card #{index + 1}: ", "" )
  game = game.split(" | ").map do |item|
    item = item.split(" ").map do |number|
      number.to_i
    end
  end
  individual_game_hash[index + 1] = game
end

print individual_game_hash
