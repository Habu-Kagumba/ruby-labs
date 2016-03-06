#!/usr/bin/env ruby
# encoding: UTF-8

class LinkedList
  attr_reader :head, :tail

  class Node
    attr_accessor :data, :next_node
    @@count = 0

    def initialize(data)
      @data = data
      @@count += 1
    end

    def count
      @@count
    end
  end

  def initialize(value=nil)
    @head = if value.nil?
      nil
    else
      Node.new(value)
    end
    @tail = head
    @count = 0 if @count.nil?
    @count += 1
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
    @count += 1
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @head = Node.new(value)
      @head.next_node = @tail
    end
    @count += 1
  end

  def count
    @count
  end
end

