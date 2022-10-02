require_relative 'board'
require_relative 'knight'

board = Board.new.board

def knight_moves(start, finish)
  path = Knight.new(start).find_path(finish)

  puts "You made it in #{path.size - 1} moves! Here is your path:"
  path.each { |square| puts square.to_s }
end

knight_moves(['h', 8], ['a', 1])
