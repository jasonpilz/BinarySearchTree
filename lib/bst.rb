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

  def self.empty
    new
  end

  def null
    NullNode::DEFAULT
  end

  def wrap_in_node(data)
    Node.new(data)
  end

  def find_min(node=@head) # Gets minimum node in a subtree
    current = node
    while current.left != null
      current = current.left
    end
    current
  end

  # def traverse(current=@head, left, right)
  #   if current != nil
  #     puts current.data
  #   else
  #     # TODO Implement traversal
  #     return
  #   end
  # end

  ##### BASE EXPECTATIONS #####

  def insert(data, current=@head)
    if current == nil
      @head = wrap_in_node(data)
      return
    end
    if data <= current.data
      if current.left == null
        current.left = wrap_in_node(data)
      else
        insert(data, current.left)
      end
    else data > current.data
      if current.right == null
        current.right = wrap_in_node(data)
      else
        insert(data, current.right)
      end
    end
  end

  def include?(value, current=@head)
    return false if current == nil
    if value == current.data
      return true
    else
      if (value < current.data) && (current.left != null)
        include?(value, current.left)
      elsif (value > current.data) && (current.right != null)
        include?(value, current.right)
      else
        return false
      end
    end
  end

  def maximum_value
    return nil if @head == nil
    current = @head
    until current.right == null
      current = current.right
    end
    current.data
  end

  def minimum_value
    return nil if @head == nil
    current = @head
    until current.left == null
      current = current.left
    end
    current.data
  end

  def depth_of(value, current=@head, depth=1) # Report the depth of a node in the tree
    raise "Value not found" if current == nil
    if value == current.data
      return depth
    else
      if (value < current.data) && (current.left != null)
        depth_of(value, current.left, depth + 1)
      elsif (value > current.data) && (current.right != null)
        depth_of(value, current.right, depth + 1)
      else
        raise "Value not found"
      end
    end
  end

  # def delete(value, parent=@head, current=nil) # Delete a value from the tree and repair the tree
  #   raise "Value not found" if parent == nil
  #
  #   if value < parent.data
  #     if parent.left != null
  #       current = parent.left
  #
  #     delete(value, parent.left)
  #   elsif value > parent.data
  #     if parent.right != null
  #
  #     delete(value, parent.right)
  #   else
  #     # Case - No child nodes
  #     if (parent.left == null) && (parent.right == null)
  #
  #
  #     end
  #   end
  # end

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
