require 'spec_helper'
require_relative '../lib/linked_list'


describe LinkedList do 
  it '#initialize' do
    linked_list = LinkedList.new

    expect(linked_list).to_not be_nil
  end

  it '#initialize @data should be have dummy node' do
    linked_list = LinkedList.new

    result = linked_list.data

    expect(result.value).to eq("dummy")
  end

  it '#add_recursive into an empty list' do 
    linked_list = LinkedList.new
    
    linked_list.add_recursive(2)

    expected = [2]

    current_node = linked_list.data.next_node
    i = 0

    while current_node
      expect(current_node.value).to eq(expected[i])

      current_node = current_node.next_node
      i += 1
    end
  end

  it '#add_recursive into the front of list' do 
    linked_list = LinkedList.new
    
    linked_list.add_recursive(2)
    linked_list.add_recursive(1)

    expected = [1, 2]

    current_node = linked_list.data.next_node
    i = 0

    while current_node
      expect(current_node.value).to eq(expected[i])

      current_node = current_node.next_node
      i += 1
    end
  end

  it '#add_recursive into the rear of list' do 
    linked_list = LinkedList.new
    
    linked_list.add_recursive(1)
    linked_list.add_recursive(2)

    expected = [1, 2]

    current_node = linked_list.data.next_node
    i = 0

    while current_node
      expect(current_node.value).to eq(expected[i])

      current_node = current_node.next_node
      i += 1
    end
  end

  it '#add_recursive to middle of list' do 
    linked_list = LinkedList.new
    
    linked_list.add_recursive(2)
    linked_list.add_recursive(7)
    linked_list.add_recursive(4)

    expected = [2, 4, 7]

    current_node = linked_list.data.next_node
    i = 0

    while current_node
      expect(current_node.value).to eq(expected[i])

      current_node = current_node.next_node
      i += 1
    end
  end

  it '#add into an empty list' do 
    linked_list = LinkedList.new
    
    linked_list.add(2)

    expected = [2]

    current_node = linked_list.data.next_node
    i = 0

    while current_node
      expect(current_node.value).to eq(expected[i])

      current_node = current_node.next_node
      i += 1
    end
  end

  it '#add into the front of list' do 
    linked_list = LinkedList.new
    
    linked_list.add(2)
    linked_list.add(1)

    expected = [1, 2]

    current_node = linked_list.data.next_node
    i = 0

    while current_node
      expect(current_node.value).to eq(expected[i])

      current_node = current_node.next_node
      i += 1
    end
  end

  it '#add into the rear of list' do 
    linked_list = LinkedList.new
    
    linked_list.add(1)
    linked_list.add(2)

    expected = [1, 2]

    current_node = linked_list.data.next_node
    i = 0

    while current_node
      expect(current_node.value).to eq(expected[i])

      current_node = current_node.next_node
      i += 1
    end
  end

  it '#add to middle of list' do 
    linked_list = LinkedList.new
    
    linked_list.add(2)
    linked_list.add(7)
    linked_list.add(4)

    expected = [2, 4, 7]

    current_node = linked_list.data.next_node
    i = 0

    while current_node
      expect(current_node.value).to eq(expected[i])

      current_node = current_node.next_node
      i += 1
    end
  end

  it '#find' do
    linked_list = LinkedList.new

    linked_list.add(3)

    result = linked_list.find(3)

    expect(result.value).to eq(3)

  end

  it '#find value in list of multiple values' do
    linked_list = LinkedList.new

    linked_list.add(1)
    linked_list.add(2)
    linked_list.add(3)

    result = linked_list.find(3)

    expect(result.value).to eq(3)

  end

  it '#find returns nil when value not found' do
    linked_list = LinkedList.new

    linked_list.add(1)
    linked_list.add(2)
    linked_list.add(3)

    expect(linked_list.find(4)).to eq(nil)

  end

  it '#found? returns true when value found' do
    linked_list = LinkedList.new

    linked_list.add(1)
    linked_list.add(2)
    linked_list.add(3)

    result = linked_list.found?(3)

    expect(result).to eq(true)

  end

  it '#found? returns false when value not found' do
    linked_list = LinkedList.new

    linked_list.add(1)
    linked_list.add(2)
    linked_list.add(3)

    result = linked_list.found?(4)

    expect(result).to eq(false)

  end

  it '#remove_recursive?' do
    linked_list = LinkedList.new
    
    linked_list.add(4)
    linked_list.add(3)
    linked_list.add(2)
    linked_list.add(1)

    linked_list.remove_recursive?(2)

    current_node = linked_list.data.next_node
  
    while current_node
      expect(current_node.value).to_not eq(2)
      current_node = current_node.next_node
    end
  end

  it '#remove_recursive? returns true on deletion' do
    linked_list = LinkedList.new
    
    linked_list.add(4)
    linked_list.add(3)
    linked_list.add(2)
    linked_list.add(1)

    result = linked_list.remove_recursive?(2)

    expect(result).to eq(true)
  end

  it '#remove_recursive? returns false on no deletion' do
    linked_list = LinkedList.new
    
    linked_list.add(4)
    linked_list.add(3)
    linked_list.add(1)

    result = linked_list.remove_recursive?(2)

    expect(result).to eq(false)
  end

  it '#remove_recursive? removes duplicates' do
    linked_list = LinkedList.new
    
    linked_list.add(2)
    linked_list.add(4)
    linked_list.add(3)
    linked_list.add(2)
    linked_list.add(1)
  

    linked_list.remove_recursive?(2)

    current_node = linked_list.data.next_node
  
    while current_node
      expect(current_node.value).to_not eq(2)
      current_node = current_node.next_node
    end

  end

  it '#remove?' do
    linked_list = LinkedList.new
    
    linked_list.add(4)
    linked_list.add(3)
    linked_list.add(2)
    linked_list.add(1)

    linked_list.remove?(2)

    current_node = linked_list.data.next_node
  
    while current_node
      expect(current_node.value).to_not eq(2)
      current_node = current_node.next_node
    end
  end

  it '#remove? returns true on deletion' do
    linked_list = LinkedList.new
    
    linked_list.add(4)
    linked_list.add(3)
    linked_list.add(2)
    linked_list.add(1)

    result = linked_list.remove?(2)

    expect(result).to eq(true)
  end

  it '#remove? returns false on no deletion' do
    linked_list = LinkedList.new
    
    linked_list.add(4)
    linked_list.add(3)
    linked_list.add(1)

    result = linked_list.remove?(2)

    expect(result).to eq(false)
  end

  it '#remove? removes duplicates' do
    linked_list = LinkedList.new
    
    linked_list.add(2)
    linked_list.add(4)
    linked_list.add(3)
    linked_list.add(2)
    linked_list.add(1)
  

    linked_list.remove?(2)

    current_node = linked_list.data.next_node
  
    while current_node
      expect(current_node.value).to_not eq(2)
      current_node = current_node.next_node
    end

  end

  describe '#print_values' do
    # arrange
    linked_list = LinkedList.new
    linked_list.add(2)
    linked_list.add(1)

    specify { expect { linked_list.print_value }.to output("1 --> 2 --> nil\n").to_stdout }
  end


end