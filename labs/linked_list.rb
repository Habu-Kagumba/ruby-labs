#!/usr/bin/env ruby
# encoding: UTF-8

class LinkedList
  attr_reader :head, :tail, :length

  class Node
    attr_accessor :data, :next_node

    def initialize(data, next_node)
      @data = data
      @next_node = next_node
    end
  end

  def initialize(data=nil)
    @length = 0
    if data.nil?
      nil
    else
      @length += 1
      @head = @tail = Node.new(data, nil)
    end
  end

  def empty?
    @head.nil?
  end

  def pop
    current_node = @head
    done = false
    while !done
      if current_node.next_node.next_node == nil
        done = true
      else
        current_node = current_node.next_node
      end
    end
    to_return = current_node.next_node
    current_node.next_node = nil
    @length -= 1
    return to_return
  end

  def prepend(data)
    if empty?
      @head = @tail = Node.new(data, nil)
    else
      new_node = Node.new(data, @head)
      @head = new_node
    end
    @length += 1
    self
  end

  def append(data)
    if empty?
      @head = @tail = Node.new(data, nil)
    else
      new_node = Node.new(data, nil)
      @tail.next_node = new_node
      @tail = new_node
    end
    @length += 1
  end

  def count
    @length
  end

  def next_nodes(num)
    [].tap { |result| (num-1).times { result << 'next_node' } }
  end

  def insert(pos, data)
    iter = next_nodes(pos).join('.')
    current_node = @head.instance_eval(iter)
    next_n = current_node.next_node
    current_node.next_node = Node.new(data, next_n)
    @length += 1
  end

  def find_by_value(val)
    current = @head
    while current != nil
      if current.data == val
        return current
      else
        current = current.next_node
      end
    end
  end

  def remove_by_value(val)
    current = @head
    if current.data == val
      @head = @head.next_node
    else
      current = @head
      while current.next_node != nil && current.next_node.data != val
        current = current.next_node
      end

      if current.next_node != nil
        current.next_node = current.next_node.next_node
      end
    end
		@length -= 1
    nil
  end

  def include?(val)
    if find_by_value(val).nil?
      return false
    else
      return true
    end
  end

  def draw_list
    cursor = @head
    [].tap do |nodes|
      while cursor != nil
        nodes << "#{cursor.data}"
        cursor = cursor.next_node
      end
    end.join(' -> ')
  end
end
