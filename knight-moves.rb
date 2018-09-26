class Node
  attr_accessor :location, :next_node, :moves
  def initialize(location = [0, 0], next_node = nil)
    @location = location
    @next_node = next_node
    @moves = [[1, 2], [2, 1], [-1, 2], [-2, 1],
              [1, -2], [2, -1], [-1, -2], [-2, -1]]

    @moves = @moves.select do |move|
      move[0] += location[0]
      move[1] += location[1]
      valid_move?(move)
    end
  end

  def valid_move?(move)
    move.all? { |element| element >= 0 && element <= 7 }
  end

  def find_goal(start, goal)
    current = Node.new(start)
    queue = [current]
    until current.location == goal
      current.moves.each { |move| queue << Node.new(move, current) }
      current = queue.shift
    end
    current
  end

  def find_path(start, goal)
    current = find_goal(start, goal)
    path = []
    until current.location == start
      path << current.location
      current = current.next_node
    end
    path << current.location
  end

  def knight_moves(start, goal)
    return unless valid_move?(start) || valid_move?(goal)
    return start if start == goal
    path = find_path(start, goal)
    puts "You made it in #{path.length - 1} moves! Here's your path:"
    path.reverse_each { |element| p element }
  end
end

kinght = Node.new
kinght.knight_moves([3, 3], [4, 3])
