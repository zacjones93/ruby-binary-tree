require_relative './linked_list_node'

class LinkedList
  attr_reader :data

  def initialize
    @data = LinkedListNode.new("dummy", nil)
  end

  def add_recursive(value)
    node = LinkedListNode.new(value)

    _add_recursive(node, @data.next_node, @data)
  end

  def add(value)
    previous_node = @data
    current_node = @data.next_node
    node = LinkedListNode.new(value)
  
    while current_node && value > current_node.value
        previous_node = current_node
        current_node = current_node.next_node
    end
    previous_node.next_node = node
    node.next_node = current_node

  end

  def find(value)
    _find(value, data)
  end

  def found?(value)
    _found?(value, data)
  end

  def remove_recursive?(value)
    _remove_recursive?(value, @data.next_node, @data, 0)
  end

  def remove?(value)
    previous_node = @data
    current_node = @data.next_node
    found_count = 0
    
    while current_node 
      if value == current_node.value
        previous_node.next_node = current_node.next_node
        found_count += 1
      else
        previous_node = current_node
      end

      current_node = current_node.next_node
    end

    found_count > 0 
  end

  def print_value
    _print_value(@data.next_node)
  end

  private 

  def _remove_recursive?(value, current_node, previous_node, found)
    return found > 0 if !current_node

    if current_node && value == current_node.value
      previous_node.next_node = current_node.next_node
      found += 1
    else 
      previous_node = current_node
    end
    _remove_recursive?(value, current_node.next_node, previous_node, found)
  end

  def _add_recursive(node, current_node, previous_node)
    if current_node && node.value > current_node.value
      _add_recursive(node, current_node.next_node, current_node) 
    else
      previous_node.next_node = node
      node.next_node = current_node
    end
  end

  def _find(value, node)
    return nil if node.nil?
    return node if node.value == value

    _find(value, node.next_node)
  end

  def _found?(value, node)
    return false if node.nil?
    return true if value == node.value

    _found?(value, node.next_node)
  end

  def _print_value(list_node)
    if list_node
      print "#{list_node.value} --> "
      _print_value(list_node.next_node)
    else
      puts "nil"
      return
    end
  end

end

if __FILE__ == $0
  
  linked_list = LinkedList.new
    
  
  linked_list.add(1)
  linked_list.add(3)
  linked_list.add(2)
  linked_list.add(4)
    
  linked_list.print_value(linked_list.data)
    
  
end