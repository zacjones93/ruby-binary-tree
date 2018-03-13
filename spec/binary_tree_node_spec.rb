require 'spec_helper'
require_relative '../lib/binary_tree_node'


describe BinaryTreeNode do
  # payload, left = nil, right = nil
  it '#initialize' do
    node = BinaryTreeNode.new(1)

    expect(node).to_not be_nil
  end

  it '#initialize with payload' do
    node = BinaryTreeNode.new(2)

    expect(node.payload).to be(2)
  end

  it '#initialize with left nil' do
    node = BinaryTreeNode.new(2)

    expect(node.left).to be_nil
  end

  it '#initialize with right nil' do
    node = BinaryTreeNode.new(2)

    expect(node.right).to be_nil
  end

  it '#payload set' do
    node = BinaryTreeNode.new(2)

    node.payload = 3

    expect(node.payload).to be(3)
  end

  it '#left set' do
    node = BinaryTreeNode.new(2)

    node.left = BinaryTreeNode.new(4)

    expect(node.left.payload).to be(4)
  end

  it '#right set' do
    node = BinaryTreeNode.new(2)

    node.right = BinaryTreeNode.new(4)

    expect(node.right.payload).to be(4)
  end
end
