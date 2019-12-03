class MoveNode
  attr_accessor :position, :next_moves, :distance, :predecessor
  
  def initialize(position=nil)
    @position = position
    @next_moves = nil
    @predecessor = []
  end

end

class KnightMoves
  attr_accessor :root

  def initialize(root=nil)
    @root = root
  end

  def possible_moves(move_node)
    knight = move_node.position.cycle
    moves = [-2, -1, -1, -2, 1, -2, 2, -1, 2, 1, 1, 2, -1, 2, -2, 1]
    move_node.next_moves = moves.each_slice(2).map { |x, y| MoveNode.new([x + knight.next, y + knight.next]) }.select { |node| (1..7) === node.position[0] && (1..7) === node.position[1]  }
  end

  def check_moves(move_node)
    move_node.next_moves.each { |node| possible_moves(node) }
  end

  def search(start, target)
    self.root = MoveNode.new(start)
    queue = []
    level = 0
    queue << root
    while !queue.empty?
      node = queue.shift
      return node if node.position == target
      node.next_moves = possible_moves(node)
      node.next_moves.each do |x|
        x.predecessor << node.position
        node.predecessor.each { |y| x.predecessor << y }
        queue << x
      end
      level += 1
    end
      
  end

end
