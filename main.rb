require_relative 'board'
require_relative 'knight'

board = Board.new.board

knight = Knight.new(['d', 4])
p knight.possible_moves(board)
puts

corner_knight = Knight.new(['a', 1])
p corner_knight.possible_moves(board)
