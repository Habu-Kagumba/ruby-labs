#!/usr/bin/env ruby
# encoding: UTF-8

# Add methods to the Enumerable module

module Enumerable

  def my_each
    i = 0
    while self[i]
      yield self[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while self[i]
      yield self[i], i
      i += 1
    end
    self
  end

  def my_select
    [].tap { |result| my_each { |e| result << e if yield(e) } }
  end

  def my_all?
    [].tap do
      |result| my_select do
        |e| result << e if yield(e)
      end
    end.length == self.length ? true : false
  end

  def my_any?
    [].tap do
      |result| my_select do
        |e| result << e if yield(e)
      end
    end.length > 0 ? true : false
  end

  def my_none?
    [].tap { |result| my_select { |e| result << e if yield(e) } }.length == 0
  end

  def my_count(num=nil)
    if num
      [].tap { |result| my_select { |e| result << e if e == num } }.length
    elsif block_given?
      [].tap { |result| my_select { |e| result << e if yield(e) } }.length
    else
      self.length
    end
  end

  def my_map
    [].tap { |result| my_each { |e| result << yield(e) } }
  end

end
