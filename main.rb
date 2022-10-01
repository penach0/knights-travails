require_relative 'board'
require_relative 'knight'

board = Board.new.board

knight = Knight.new(['d', 4])
p knight.possible_moves
puts

corner_knight = Knight.new(['a', 1])
p corner_knight.possible_moves
puts

top_corner_knight = Knight.new(['h', 8])
p top_corner_knight.possible_moves
puts

edge_knight = Knight.new(['h', 5])
p edge_knight.possible_moves
