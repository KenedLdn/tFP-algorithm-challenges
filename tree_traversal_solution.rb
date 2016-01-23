require 'pry'

class Tree
  attr_accessor :payload, :children
  
  def initialize(payload, children)
    @payload = payload
    @children = children
  end
  
  def depth_first_search(value)
    return_arr = []
    catch(:done) { depth_recur(value, return_arr) }
    if return_arr[-1] != value
      return_arr << 'Not found'
      binding.pry
      puts 'Not found'
    else
      puts return_arr.inspect
    end
  end
  
  def depth_recur(value, return_arr)
    return_arr << payload
    throw :done if payload == value
    return if children.nil?
    children.each do |child|
      child.depth_recur(value, return_arr)
    end
  end
  
  def breadth_first_search(value)
    return_arr = []
    queue = Queue.new
    self.breadth_recur(value, queue, return_arr)
    if return_arr[-1] == 'Not found'
      puts 'Not found'
    else
      puts return_arr.inspect
    end
  end
  
  def breadth_recur(value, queue, return_arr)
    return_arr << payload
    return puts '' if payload == value
    children.each {|child| queue.enqueue(child)} unless children.nil?
    begin
      queue.dequeue.breadth_recur(value, queue, return_arr)
    rescue
      return_arr << 'Not found'
    end
  end
end

class Queue
  def initialize
    @queue = []
  end
  
  def enqueue(item)
    @queue.push(item)
  end
  
  def dequeue
    @queue.shift
  end
end

def build_tree(array)
  temp_element = array.shift
  "node_#{temp_element}" = Tree.new
end

# The "Leafs" of a tree, elements that have no children
fifth_node    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, fifth_node])

# Use Depth First Search Algorithm
[2, 7, 6, 5, 11, 5, 9, 4, 3].each do |value|
  puts "Finding #{value} in this tree with depth first search..."
  trunk.depth_first_search(value)
  puts '--------------------------------------------------------'
  puts
end

# Use Breadth First Search Algorithm
[2, 7, 5, 6, 9, 5, 11, 4, 3].each do |value|
  puts "Finding #{value} in this tree with breadth first search..."
  trunk.breadth_first_search(value)
  puts '--------------------------------------------------------'
  puts
end
