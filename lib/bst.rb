require_relative 'node.rb'
require_relative 'null_node.rb'

class Bst
  attr_accessor :head, :sorted

  def initialize(head=nil)
    if head != nil
      @head = wrap_in_node(head)
    else
      @head = head
    end
    @sorted = []
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

  def find_min(node=@head)
    current = node
    while current.left != null
      current = current.left
    end
    current
  end

  ###### BASE EXPECTATIONS ######

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

  def depth_of(value, current=@head, depth=1)
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

  def traverse_preorder(current=@head)
    return if current == null
    sorted << current.data
    traverse_preorder(current.left)
    traverse_preorder(current.right)
  end

  def traverse_inorder(current=@head)
    return if current == null
    traverse_inorder(current.left)
    sorted << current.data
    traverse_inorder(current.right)
  end

  def sort # Outputs an array of the tree values in sorted order
    return sorted if @head == nil
    traverse_inorder
    sorted
  end

  def delete(value, parent=@head, current=nil) # Delete a value from the tree and repair the tree
    raise "Value not found" if parent == nil

    # if value < parent.data
    #   if parent.left != null
    #     current = parent.left
    #
    #   delete(value, parent.left)
    # elsif value > parent.data
    #   if parent.right != null
    #
    #   delete(value, parent.right)
    # else
    #   # Case - No child nodes
    #   if (parent.left == null) && (parent.right == null)
    #
    #
    #   end
    # end
  end

###### EXTENSIONS ######

  # def count_leaves(tree) # Find the total number of leaves on the tree
  #
  # end
  #
  # def maximum_height(tree) # Report the maximum height of the tree

end
