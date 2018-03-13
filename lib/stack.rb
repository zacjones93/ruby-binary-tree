require_relative './linked_list_node'

class Stack
  attr_reader :data

  def initialize
      @data = nil
  end

  # Push a value onto the stack
  def push(value)
     @data = LinkedListNode.new(value, @data)
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    if !@data
      @data
    else
      last_value = @data.value
      @data.value = @data.next_node.value
      @data.next_node = @data.next_node.next_node
      last_value
    end
  end

  def print_values(list_node)
    if list_node
      print "#{list_node.value} --> "
      print_values(list_node.next_node)
    else
      print "nil\n"
      return
    end
  end

  def reverse_list
    reversed_stack = Stack.new
    i = 1
    current_node = @data
    while current_node
      reversed_stack.push(current_node.value)

      current_node = current_node.next_node
    end

    @data = reversed_stack
  end

end

if __FILE__ == $0
  stack = Stack.new

  stack.push(1)
  stack.push(2)
  stack.push(3)
  stack.push(4)
  stack.print_values(stack.data)

  rev_stack = stack.reverse_list

  stack.print_values(rev_stack.data)

  # stack.print_values(stack.data)

  # puts stack.data.value
end