require_relative 'coordinates'

# Represents a chessboard.
# Chose the typical chess notation for the coordinates
class Board
  include Coordinates
  attr_accessor :board

  def initialize
    @board = create_board
  end

  def create_board
    board = Array.new(8) { Array.new(8) }
    8.times do |line|
      8.times do |column|
        board[line][column] = [X[column], Y[line]]
      end
    end
    board.reverse
  end
end
