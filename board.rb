# Represents a chessboard.
# Chose the typical chess notation for the coordinates
class Board
  attr_accessor :board

  def initialize
    @board = create_board
  end

  def create_board
    board = Array.new(8) { Array.new(8) }
    numbers = [*1..8]
    letters = [*'a'..'h']
    8.times do |line|
      8.times do |column|
        board[line][column] = [letters[column], numbers[line]]
      end
    end
    board.reverse
  end
end

board = Board.new
board.board.each { |line| p line }
