require_relative 'board'
require_relative 'knight'

board = Board.new.board

def knight_moves(start, finish)
  path = Knight.new(start).find_path(finish)

  if path.size - 1 == 1
    puts 'You made it in 1 move! Here is your path:'
  else
    puts "You made it in #{path.size - 1} moves! Here is your path:"
  end
  path.each { |square| puts square.to_s }
end

def ask_position(position)
  print "Pick a #{position} position (format eg. 'd4' or 'e6'): "
  loop do
    ans = gets.chomp
    return [ans[0], ans[1].to_i] if ans[0].between?('a', 'h') && ans[1].to_i.between?(1, 8)

    print 'Not valid. Try again: '
  end
end

knight_moves(ask_position('starting'), ask_position('finish'))
