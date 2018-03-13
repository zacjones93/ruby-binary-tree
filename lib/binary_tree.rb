require_relative './binary_tree_node'

class BinaryTree
  attr_accessor :root

  def initialize
    @root
  end

  def add(value)
    node = BinaryTreeNode.new(value)
    
    if !@root
      @root = node 
    else
      _add(@root, nil, node)
    end
  end

  def _add(current_node, previous_node, node)
    if current_node.nil?
      if previous_node.payload > node.payload
        previous_node.left = node
      else
        previous_node.right = node
      end
    else
      previous_node = current_node
      new_node = check_node(current_node, node)
      _add(new_node, previous_node, node)
    end
  end

  def check_node(current_node, node)
    if current_node.payload > node.payload
      current_node.left
    else
      current_node.right
    end
  end

  def print_tree()

  end

  def depth_first_traversal
    _depth_first_traversal(@root)
  end

  def _depth_first_traversal(node, results=[])
    return results if node.nil?

    _depth_first_traversal(node.left, results)
    results << node.payload
    _depth_first_traversal(node.right, results)
  end

  def breadth_first_traversal
    _breadth_first_traversal(@root)
  end

  def _breadth_first_traversal(root)
    discovered_nodes = [] 
    sorted_node_payloads = []

    discovered_nodes << root
    
    until discovered_nodes.empty? do
      current_node = discovered_nodes.shift

      sorted_node_payloads << current_node.payload
      discovered_nodes << current_node.left if current_node.left
      discovered_nodes << current_node.right if current_node.right
    end

    sorted_node_payloads 
  end

  def found?(value)
    _found?(value, @root)
  end

  def _found?(value, node)
    return false if node.nil?

    return true if node.payload == value

    if node.payload > value
      _found?(value, node.left)
    else
      _found?(value, node.right)
    end
  end

  def max
    _max(@root) 
  end

  def _max(node)
    return nil if node.nil?

    until node.right == nil
      node = node.right
    end
    node.payload
  end 

  def min
    _min(@root)
  end

  def _min(node)
    return nil if node.nil?

    until node.left == nil
      node = node.left
    end
    node.payload
  end

  def height
    _height(@root, 0)
  end

  def _height(node, height_count)
    return height_count if node.nil?

    _height(node.left, height_count + _count(node))
    _height(node.right, height_count + _count(node))
  end

  def _count(node)
    node.left || node.right ? 1 : 0
  end

end


if __FILE__ == $0
binary_tree = BinaryTree.new

binary_tree.add(5)
binary_tree.add(2)
binary_tree.add(8)
end