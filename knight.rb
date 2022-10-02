require_relative 'coordinates'

# Represents a knight chess piece
class Knight
  include Coordinates
  attr_accessor :position, :x, :y

  def initialize(position)
    @position = position
    translate_coordinates(position)
  end

  def translate_coordinates(position)
    x, y = position
    @x = X.find_index(x)
    @y = Y.find_index(y)
  end

  def possible_moves
    possible_moves = []

    TWO_STEPS.each do |forward|
      ONE_STEP.each do |side|
        square1 = [X[x + forward], Y[y + side]]
        square2 = [X[x + side], Y[y + forward]]
        possible_moves << square1 if inside_board?(x + forward, y + side)
        possible_moves << square2 if inside_board?(x + side, y + forward)
      end
    end
    possible_moves
  end

  def move(new_position)
    @position = new_position
    translate_coordinates(new_position)
  end

  def knight_moves(end_position, queue = [@position])
    visited = []
    path = [@position]

    until @position == end_position
      break path << end_position if possible_moves.include?(end_position)

      possible_moves.each do |move|
        queue << move unless visited.include?(move)
      end
      visited << queue.shift
      move(queue.first)
    end
    path
  end
end
