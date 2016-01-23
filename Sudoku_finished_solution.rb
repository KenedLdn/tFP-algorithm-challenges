require 'pry'

def correct_digits(board)
  bool = true
  (1..9).each do |digit|
    count = board.flatten.count(digit)
    bool = (count == 9 ? true : false)
  end
  bool
end

def correct_row_sum(board)
  bool = true
  board.each do |row|
    sum = row.reduce(:+)
    bool = (sum == 45 ? true : false)
  end
  bool
end

def correct_column_sum(board)
  bool = true
  board.transpose.each do |column|
    sum = column.reduce(:+)
    bool = (sum == 45 ? true : false)
  end
  bool
end

def correct_region_sum(board)
  regions = []
  start_positions = []
  for i in [0, 27, 54]
    for j in (0..2)
      start_positions << (0 + i + j * 3)
    end
  end
  start_positions.each do |start_position|
    region = []
    region_coords = []
    for k in [0, 9, 18]
      for l in (0..2)
        region_coords << start_position + k + l
      end
    end
    region_coords.each {|region_coord| region << board.flatten[region_coord]}
    regions << region
  end
  correct_row_sum(regions)
end

def done_or_not(board)
  if correct_digits(board) && correct_row_sum(board) && correct_column_sum(board) && correct_region_sum(board)
    'Finished!'
  else
    'Try again!'
  end
end

puts
puts 'The followings (above the line) should all be FALSE solutions'
# INVALID solutions
boards = [
  [[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 0, 3, 4, 9], [1, 0, 0, 3, 4, 2, 5, 6, 0], [8, 5, 9, 7, 6, 1, 0, 2, 0], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 0, 1, 5, 3, 7, 2, 1, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 0, 0, 4, 8, 1, 1, 7, 9]],
  [[1, 3, 2, 5, 7, 9, 4, 6, 8], [4, 9, 8, 2, 6, 1, 3, 7, 5], [7, 5, 6, 3, 8, 4, 2, 1, 9], [6, 4, 3, 1, 5, 8, 7, 9, 2], [5, 2, 1, 7, 9, 3, 8, 4, 6], [9, 8, 7, 4, 2, 6, 5, 3, 1], [2, 1, 4, 9, 3, 5, 6, 8, 7], [3, 6, 5, 8, 1, 7, 9, 2, 4], [8, 7, 9, 6, 4, 2, 1, 3, 5]],
  [[1, 3, 2, 5, 7, 9, 4, 6, 8], [4, 9, 8, 2, 6, 0, 3, 7, 5], [7, 0, 6, 3, 8, 0, 2, 1, 9], [6, 4, 3, 1, 5, 0, 7, 9, 2], [5, 2, 1, 7, 9, 0, 8, 4, 6], [9, 8, 0, 4, 2, 6, 5, 3, 1], [2, 1, 4, 9, 3, 5, 6, 8, 7], [3, 6, 0, 8, 1, 7, 9, 2, 4], [8, 7, 0, 6, 4, 2, 1, 3, 5]],
  [[1, 2, 3, 4, 5, 6, 7, 8, 9], [2, 3, 4, 5, 6, 7, 8, 9, 1], [3, 4, 5, 6, 7, 8, 9, 1, 2], [4, 5, 6, 7, 8, 9, 1, 2, 3], [5, 6, 7, 8, 9, 1, 2, 3, 4], [6, 7, 8, 9, 1, 2, 3, 4, 5], [7, 8, 9, 1, 2, 3, 4, 5, 6], [8, 9, 1, 2, 3, 4, 5, 6, 7], [9, 1, 2, 3, 4, 5, 6, 7, 8]]
]

boards.each {|board| puts done_or_not(board)}

puts '---------------------------------------------------------'
puts
puts 'The followings (below the line) should all be VALID solutions'
# These are VALID solution
boards = [
  [[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]],
  [[1, 3, 2, 5, 7, 9, 4, 6, 8], [4, 9, 8, 2, 6, 1, 3, 7, 5], [7, 5, 6, 3, 8, 4, 2, 1, 9], [6, 4, 3, 1, 5, 8, 7, 9, 2], [5, 2, 1, 7, 9, 3, 8, 4, 6], [9, 8, 7, 4, 2, 6, 5, 3, 1], [2, 1, 4, 9, 3, 5, 6, 8, 7], [3, 6, 5, 8, 1, 7, 9, 2, 4], [8, 7, 9, 6, 4, 2, 1, 5, 3]],
]

boards.each {|board| puts done_or_not(board)}
