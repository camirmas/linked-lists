class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize(value)
    node = Node.new(value)
    @head = node
    @tail = node
  end

  def append(value)
    @tail.next_node = Node.new(value)
    @tail = @tail.next_node
  end

  def to_s(node=@head)
    if !node.next_node
      return "#{node.value}"
    else
      return "#{node.value}, #{to_s(node.next_node)}"
    end
  end

  def prepend(value)
    prev_head = @head
    @head = Node.new(value)
    @head.next_node = prev_head
  end

  def length(node=@head)
    if !node.next_node
      return 1
    else
      return 1 + length(node.next_node)
    end
  end

  def find(item, node=@head)
    if node.value == item
      return node
    elsif !node.next_node
      return nil
    else
      return find(item, node.next_node)
    end
  end

  def delete(item, node=@head)
    if !node.next_node
      return "not found"
    elsif node.value == item
      @head = node.next_node
    elsif node.next_node.value == item
      node.next_node = node.next_node.next_node
    else
      return delete(item, node.next_node)
    end
  end

  def insert_after(item, input)
    if @tail.value == item
      append(input)
    else
      result = find(item)
      if result
        swap = result.next_node
        new_node = Node.new(input)
        result.next_node = new_node
        new_node.next_node = swap
      else
        return "not found!"
      end
    end
  end
end
