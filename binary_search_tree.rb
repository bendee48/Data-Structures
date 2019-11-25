class Node
include Comparable
  
  attr_accessor :data, :left, :right

  def initialize(data=nil)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other)
    data <=> other.data
  end
     
end

class Tree
  attr_accessor :root
  
  def initialize
    @root = nil
  end

  def build_tree(data)
    data.uniq.each do |num|
      insert(num, root)
    end
    root
  end

  def insert(value, node)
    if root.nil?
      self.root = Node.new(value)
    elsif value > node.data 
      if node.right.nil?
        node.right = Node.new(value)
      else
        insert(value, node.right)
      end
    elsif value < node.data
      if node.left.nil?
        node.left = Node.new(value)
      else
        insert(value, node.left)
      end
    end
    root
  end

  # def delete(value, node)
  #   if value > node.data
  #     if node.right.data == value
  #       node.right = nil
  #       return
  #     end
  #     delete(value, node.right)
  #   elsif value < node.data
  #     if node.left.data == value
  #       node.left = nil
  #       return
  #     end
  #     delete(value, node.left)
  #   end
  # end

  def delete(value)
    values = level_order
    values.delete(value)
    self.root = nil
    build_tree(values)
  end

  def find(value)
    level_order { |node| return node if node.data == value }
  end
  
  def level_order(tree)
    queue = []
    values = []
    queue << tree
    while !queue.empty?
      node = queue.shift
      block_given? ? yield(node) : values << node.data
      queue << node.left if node.left
      queue << node.right if node.right
    end
    values if !block_given?
  end

  def preorder(node, values)
    return if node.nil?
    yield(node) if block_given?
    values << node.data
    preorder(node.left, values) { |node| yield(node) if block_given? }
    preorder(node.right, values) { |node| yield(node) if block_given? }
    values if !block_given?
  end

  def inorder(node, values)
    return if node.nil?
    inorder(node.left, values) { |x| yield(x) if block_given? }
    yield(node) if block_given?  
    values << node.data  
    inorder(node.right, values) { |x| yield(x) if block_given? }
    values if !block_given?
  end

  def postorder(node, values)
    return if node.nil?
    postorder(node.left, values) { |node| yield(node) if block_given? }   
    postorder(node.right, values) { |node| yield(node) if block_given? }
    yield(node) if block_given? 
    values << node.data
    values if !block_given?
  end

end

pop = Tree.new

pop.build_tree([6, 7, 4, 23, 8, 33, 2, 5])
pop.delete(33, pop.root)
p pop