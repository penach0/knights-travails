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

  # This method conducts a Breadth First Search to find the shortest path to a given square
  # visited.empty? checks prevent unwanted behaviour when appending arrays on the first iteration
  # After the first iteration we only add the last move of the path to the visited array
  def find_path(end_position, queue = [@position])
    visited = []

    until @position == end_position
      path = visited.empty? ? [queue.first] : queue.first
      return path << end_position if possible_moves.include?(end_position)

      possible_moves.each do |move|
        possible_path = (path.dup << move)
        queue << possible_path unless visited.include?(move)
      end
      visited << (visited.empty? ? queue.shift : queue.shift.last)
      move(queue.first.last)
    end
  end
end
