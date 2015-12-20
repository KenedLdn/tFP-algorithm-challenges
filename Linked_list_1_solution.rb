class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  print "#{list_node.value} --> "
  list_node.next_node == nil ? (puts 'nil') : print_values(list_node.next_node)
end

class Stack
  attr_reader :data

  def initalize
    @data = nil
  end

  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  def pop
    raise 'Empty data' if @data.nil?
    value = @data.value
    @data = @data.next_node
    value
  end
end

def reverse_list(list)
  revlist = Stack.new
  while list != nil
    revlist.push(list.value)
    list = list.next_node
  end
  value = revlist.pop
  LinkedListNode.new(value, revlist.data)
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)
puts '-------'
revlist = reverse_list(node3)
print_values(revlist)
