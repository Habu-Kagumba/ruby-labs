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
    [].tap do |result|
      my_select do |e|
        result << e if yield(e)
      end
    end.length == self.length ? true : false
  end

  def my_any?
    [].tap do |result|
      my_select do |e|
        result << e if yield(e)
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

  def my_inject(initial=nil)
    if nil.equal? initial
      initial = self.first
    else
      self.unshift(initial)
    end

    self.my_each do |e|
      initial = yield(initial, e)
    end

    initial
  end

  def my_map_with_proc(&code)
    [].tap { |result| my_each { |e| result << code.call(e) } }
  end

  def my_map_with_proc_block(code)
    if block_given?
      result_proc = []
      self.my_each do |e|
        result_proc << code.call(e)
      end

      result_proc_block = []
      result_proc.my_each do |p|
        result_proc_block << yield(p)
      end

      result_proc_block
    else
      [].tap { |result| my_each { |e| result << code.call(e) } }
    end
  end

end
