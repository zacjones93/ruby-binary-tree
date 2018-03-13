require 'spec_helper'
require_relative '../lib/binary_tree'


describe BinaryTree do
  # payload, left = nil, right = nil
  it '#initialize' do
    binary_tree = BinaryTree.new

    expect(binary_tree).to_not be_nil
  end

  it '#initialize' do
    binary_tree = BinaryTree.new

    expect(binary_tree.root).to be_nil
  end

  it '#add root is nil' do
    binary_tree = BinaryTree.new

    binary_tree.add(3)

    expect(binary_tree.root.payload).to be(3)
  end

  it '#add insert higher value right' do
    binary_tree = BinaryTree.new

    binary_tree.add(3)
    binary_tree.add(4)

    expect(binary_tree.root.right.payload).to be(4)
  end

  it '#add insert lower value left' do
    binary_tree = BinaryTree.new

    binary_tree.add(3)
    binary_tree.add(2)

    expect(binary_tree.root.left.payload).to be(2)
  end

  it '#add insert lower value left multiple levels deep' do
    binary_tree = BinaryTree.new

    binary_tree.add(5)
    binary_tree.add(3)
    binary_tree.add(2)

    expect(binary_tree.root.left.left.payload).to be(2)
  end

  
  it '#depth_first_traversal' do
    # set up
    binary_tree = BinaryTree.new

    binary_tree.add(5)
    binary_tree.add(3)
    binary_tree.add(7)
    binary_tree.add(2)
    binary_tree.add(4)
    binary_tree.add(6)
    binary_tree.add(8)
    binary_tree.add(1)
    binary_tree.add(9)

    # action
    results = binary_tree.depth_first_traversal

    # assertion
    expect(results).to eq([1,2,3,4,5,6,7,8,9])
  end

  it '#breadth_first_traversal' do
    binary_tree = BinaryTree.new

    binary_tree.add(5)

    binary_tree.add(3)
    binary_tree.add(7)

    binary_tree.add(2)
    binary_tree.add(4)
    binary_tree.add(6)
    binary_tree.add(8)

    
    binary_tree.add(1)
    binary_tree.add(9)



    results = binary_tree.breadth_first_traversal

    expect(results).to eq([5, 3, 7, 2, 4, 6, 8, 1, 9])
  end

  describe '#found?' do

    context 'with a valid argument' do
      it 'should return true' do
        binary_tree = BinaryTree.new

        binary_tree.add(5)

        binary_tree.add(3)
        binary_tree.add(7)

        result = binary_tree.found?(7)

        expect(result).to eq(true)
      end
    end
    
    context 'with a invalid argument' do
      it 'should return false' do
        binary_tree = BinaryTree.new

        binary_tree.add(5)

        binary_tree.add(3)
        binary_tree.add(7)

        result = binary_tree.found?(8)

        expect(result).to eq(false)
      end 
    end
  end

  describe '#max' do
    context 'with an empty tree' do
      it 'returns nil' do
        binary_tree = BinaryTree.new

        result = binary_tree.max

        expect(result).to eq(nil)
      end
    end

    context 'with nodes in tree' do
      it 'returns highest value' do
        binary_tree = BinaryTree.new

        binary_tree.add(5)

        binary_tree.add(3)
        binary_tree.add(7)

        result = binary_tree.max

        expect(result).to eq(7)
      end
    end
  end

  describe '#min' do
    context 'with an empty tree' do
      it 'returns nil' do
        binary_tree = BinaryTree.new

        result = binary_tree.min

        expect(result).to eq(nil)
      end
    end

    context 'with nodes in tree' do
      it 'returns lowest value' do
        binary_tree = BinaryTree.new

        binary_tree.add(5)

        binary_tree.add(3)
        binary_tree.add(7)

        result = binary_tree.min

        expect(result).to eq(3)
      end
    end
  end

  it '#height return nil on empty tree' do
    binary_tree = BinaryTree.new

    result = binary_tree.height

    expect(result).to eq(0)
  end

  it '#height of level 3 tree' do
    binary_tree = BinaryTree.new

    binary_tree.add(5)
    binary_tree.add(3)
    binary_tree.add(7)
    binary_tree.add(2)
    binary_tree.add(4)
    binary_tree.add(6)
    binary_tree.add(8)
    binary_tree.add(1)
    binary_tree.add(9)

    result = binary_tree.height

    expect(result).to eq(3)
  end

  it '#height of level 1 tree' do
    binary_tree = BinaryTree.new

    binary_tree.add(5)
    binary_tree.add(3)
    binary_tree.add(7)

    result = binary_tree.height

    expect(result).to eq(1)
  end
end