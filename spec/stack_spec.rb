require 'spec_helper'
require_relative '../lib/stack'

describe Stack do
  it '#push' do
    # arrange
    stack = Stack.new
    
    # act 
    result = stack.push(2)

    expect(result.value).to eq(2)
  end

  it '#pop return popped value' do
    # arrange
    stack = Stack.new
    stack.push(1)
    stack.push(2)
    
    # act 
    result = stack.pop

    expect(result).to eq(2)
  end

  it '#pop remove last item that was pushed onto the stack' do
    # arrange
    stack = Stack.new
    stack.push(1)
    stack.push(2)
    
    # act 
    stack.pop

    expect(stack.data.value).to eq(1)
  end

  it '#pop return nil with no data' do
    # arrange
    stack = Stack.new
    
    # act 
    stack.pop

    expect(stack.data).to eq(nil)
  end

  # is this describe block in here bad?
  describe '#print_values' do
    # arrange
    stack = Stack.new
    stack.push(1)
    stack.push(2)
    
    specify { expect { stack.print_values(stack.data) }.to output("2 --> 1 --> nil\n").to_stdout }
  end

  it '#reverse_list' do
    # arrange
    stack = Stack.new
    stack.push(1)
    stack.push(2)
    stack.push(3)

    # act
    current_node = stack.reverse_list.data

    i = 1
    while current_node
      expect(current_node.value).to eq(i)
      
      current_node = current_node.next_node
      i += 1
    end
  end
end