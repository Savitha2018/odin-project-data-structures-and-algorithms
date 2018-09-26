class Node
  attr_reader :value
  attr_accessor :left, :right
  def initialize(value)
    @value = value
  end
end

class BST
  def initialize
    @root = nil
  end

  def build_tree(arr)
    arr.each do |element|
      node = Node.new(element)
      if @root.nil?
        @root = node
      else
        insert(@root, element)
      end
    end
  end

  def insert(node, value)
    case value <=> node.value
    when 1
      node.right ? insert(node.right, value) : node.right = Node.new(value)
    when -1
      node.left ? insert(node.left, value) : node.left =  Node.new(value)
    end
  end

  def breadth_first_search(target = nil)
    return if @root.nil?
    queue = [@root]
    until queue.empty?
      current = queue.first
      puts target if target == current.value
      queue.push(current.left) unless current.left.nil?
      queue.push(current.right) unless current.right.nil?
      queue.shift
    end
  end

  def depth_first_search(target)
    return if @root.nil?
    stack = [@root]
    until stack.empty?
      current = stack.shift
      puts target if current.value == target
      stack.unshift(current.right) if current.right
      stack.unshift(current.left) if current.left
    end
  end

  def dfs_rec(target, node = @root)
    return if @root.nil?
    puts target if node.value == target
    dfs_rec(target, node.left) unless node.left.nil?
    dfs_rec(target, node.right) unless node.right.nil?
  end
end
