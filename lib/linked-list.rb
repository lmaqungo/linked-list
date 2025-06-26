require_relative 'node'

class LinkedList
  attr_accessor :node_list
  
  def initialize
    @node_list = []
  end

  def append(value)
    next_element = Node.new(value)
    if node_list.length > 0
      node_list[-1].next_node = next_element
    end
    node_list.push(next_element)
  end

  def prepend(value)
    if node_list.empty?
      next_element = Node.new(value)
    else
      next_element = Node.new(value, node_list[0])
    end
    node_list.unshift(next_element)
  end

  def size
    node_list.length
  end

  def head
    node_list.first
  end

  def tail
    node_list.last
  end

  def at(index)
    node_list.at(index)
  end

  def pop
    node_list.pop
  end

  def contains?(value)
    node_list.each do |node|
      if node.value == value
        return true
      end
    end
    return false
  end

  def find(value)
    node_list.each do |node|
      if node.value == value
        return node_list.index(node)
      end
    end
    return nil
  end

  def to_s
    node_list_str = ""
    node_list.each do |node|
      if (node == self.head && self.size == 1) || node == self.tail
        node_list_str += "( #{node.value} ) -> nil"   
      else
        node_list_str += "( #{node.value} ) -> "                                                                                  
      end
    end
    return node_list_str
  end

  def insert_at(value, index)
    current_node = Node.new(value, self.at(index))
    previous_node = self.at(index-1)
    previous_node.next_node = current_node
    node_list.insert(index, current_node)
  end

  def remove_at(index)
    previous_node = self.at(index-1)
    next_node = self.at(index+1)
    previous_node.next_node = next_node
    node_list.delete_at(index)
  end

end