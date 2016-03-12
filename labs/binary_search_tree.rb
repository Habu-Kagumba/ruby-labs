#!/usr/bin/env ruby
# encoding: UTF-8

class Node
  attr_accessor :value, :left, :right, :parent

  def initialize(v)
    @value = v
    @left = @right = @parent = nil
  end

  def insert(v)
    case value <=> v
    when 1 then insert_left(v)
    when -1 then insert_right(v)
    when 0 then false
    end
  end

  def to_s
    # "(leftvalue <= (currentvalue) => rightvalue) => parentvalue"
    left_v = @left.value if @left
    right_v = @right.value if @right
    value_v = @value
    parent_v = @parent.value if @parent

    "(#{left_v} <= (#{value_v}) => #{right_v}) => #{parent_v}"
  end

  private

  def insert_left(v)
    if left.nil?
      self.left = Node.new(v)
      self.left.parent = self
    else
      left.insert(v)
    end
  end

  def insert_right(v)
    if right.nil?
      self.right = Node.new(v)
      self.right.parent = self
    else
      right.insert(v)
    end
  end
end

class Tree
  attr_reader :tree

  def initialize(arr)
    @tree = from_array(arr)
  end

  def breadth_first_search(datum)
    search_tree(datum, :breadth_first_search)
  end

  def depth_first_search(datum)
    search_tree(datum, :depth_first_search)
  end

  def dfs_rec(datum, found=@tree)
    if found.value == datum
      found
    else
      (found.left && dfs_rec(datum, found.left)) || (found.right && dfs_rec(datum, found.right))
    end
  end

  private

  def from_array(arr)
    mid = (arr.length - 1) / 2
    Node.new(arr[mid]).tap do |tree|
      arr.each {|v| tree.insert v }
    end
  end

  def search_tree(datum, type)
    nodes = Array tree
    until nodes.empty?
      current_node = type == :breadth_first_search ? nodes.shift : nodes.pop
      return current_node if current_node.value == datum
      nodes << current_node.left unless current_node.left.nil?
      nodes << current_node.right unless current_node.right.nil?
    end
  end
end

