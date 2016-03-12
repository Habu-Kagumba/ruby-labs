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
    [].tap { |result| my_each { |e| result << e if yield e } }
  end

  def my_all?
    self.my_each {|e| return false unless yield e}
  end

  def my_any?
    self.my_each {|e| return true if yield e}
  end

  def my_none?
    self.my_each {|e| return true unless yield e}
  end

  def my_count(num=nil)
    count = 0
    if num
      self.my_each {|e| count += 1 if e == num}
    elsif block_given?
      self.my_each {|e| count += yield(e) ? 1 : 0}
    else
      return self.size
    end
    count
  end

  def my_map
    [].tap { |result| my_each { |e| result << yield(e) } }
  end

  def my_inject(initial=nil)
    if initial.nil?
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
      [].tap do |result|
        my_each do |e|
          result_proc = code.call(e)
          result << yield(result_proc)
        end
      end
    else
      [].tap { |result| my_each { |e| result << code.call(e) } }
    end
  end

end
