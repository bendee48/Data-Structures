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
  
    def delete(value)
    end
  
  end