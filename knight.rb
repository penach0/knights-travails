require_relative 'coordinates'

# Represents a knight chess piece
class Knight
  include Coordinates
  attr_accessor :position, :x, :y

  def initialize(position)
    @position = position

    x, y = position
    @x = X.find_index(x)
    @y = Y.find_index(y)
  end

  def possible_moves(board)
    possible_moves = []

    TWO_STEPS.each do |forward|
      ONE_STEP.each do |side|
        square1 = [X[x + forward], Y[y + side]]
        square2 = [X[x + side], Y[y + forward]]
        possible_moves << square1
        possible_moves << square2
      end
    end
    possible_moves
  end
end

