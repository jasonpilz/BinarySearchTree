require_relative 'node.rb'
require_relative 'null_node.rb'

class Bst
  attr_accessor :head

  def initialize(head=nil)
    if head != nil
      @head = wrap_in_node(head)
    else
      @head = head
    end
  end

  def wrap_in_node(data)
    Node.new(data)
  end

  def self.empty
    new
  end

  def traverse(current=@head)
    if current != nil
      puts current.data
    else
      # TODO Implement traversal
      return
    end
  end

  def insert(data, current=@head)
    if current == nil
      @head = wrap_in_node(data)
      return
    end
    if data <= current.data
      if current.left == NullNode::DEFAULT
        current.left = wrap_in_node(data)
      else
        insert(data, current.left)
      end
    else data > current.data
      if current.right == NullNode::DEFAULT
        current.right = wrap_in_node(data)
      else
        insert(data, current.right)
      end
    end
  end

  def include?(value, current=@head)
    return false if @head == nil
    if value == current.data
      return true
    else
      if (value < current.data) && (current.left != NullNode::DEFAULT)
        include?(value, current.left)
      elsif (value > current.data) && (current.right != NullNode::DEFAULT)
        include?(value, current.right)
      else
        return false
      end
    end
  end

  # def delete(value) # Delete a value from the tree and repair the tree
  #
  # end
  #
  # def depth_of(value) # Report the depth of a node in the tree
  #
  # end
  #
  # def maximum # Find the maximum value in the tree
  #
  # end
  #
  # def minimum # Find the minimum value in the tree
  #
  # end
  #
  # def sort # Outputs an array of the values in sorted order
  #
  # end

###### EXTENSIONS ######

  # def count_leaves(tree) # Find the total number of leaves on the tree
  #
  # end
  #
  # def maximum_height(tree) # Report the maximum height of the tree

end
