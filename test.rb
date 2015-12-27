class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end
  # Push a value onto the Stack
  def push(value)
    @data = LinkedListNode.new(value, @data)
  end
  # pop and item off the Stack
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    # I RETURN A VALUE
  end
end

def reverse_list(list)
  reversed = Stack.new
  while list
    payload = list.value
    # do something with payload here
    reversed.push(payload)
    # remove the head, and make the new list just be the rest
    list = list.next_node #this is pop method basically
  end
  reversed
end

def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)
puts revlist.inspect
print_values(revlist)
