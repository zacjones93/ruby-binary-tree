require 'spec_helper'
require_relative '../lib/linked_list_node'


describe LinkedListNode do
  it '#reverse_list' do
    # arrange
    node1 = LinkedListNode.new(37)
    node2 = LinkedListNode.new(99, node1)
    node3 = LinkedListNode.new(12, node2)

    
    # act

    # assert
    # expect(result).to eq([[0,0]])
  end

  it '#value' do
    # arrange
    node1 = LinkedListNode.new(37)
    

    
    # act
    result = node1.value
    # assert
    expect(result).to eq(37)
  end

  # how should I actually test this?
  it '#next_node' do
    # arrange
    node1 = LinkedListNode.new(37)
    node2 = LinkedListNode.new(35, node1)
    
    # loop through a node and test the full length
    # act
    result = node2.next_node.value
    # assert

    expect(result).to eq(37)
  end

  it '#value' do
    # arrange
    node1 = LinkedListNode.new(37)
    
    # act
    result = node1.value
    # assert

    expect(result).to eq(37)
  end

  it '#next_node' do
    # arrange
    node1 = LinkedListNode.new(37)
    node2 = LinkedListNode.new(35, node1)
    node3 = LinkedListNode.new(33)
    
    # act
    node1.next_node = node3
    result = node1.next_node.value
    # assert

    expect(result).to eq(33)
  end
end
