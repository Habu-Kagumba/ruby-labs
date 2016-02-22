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
    result = []
    self.my_select { |e| result << e if yield(e) }
    result.length == self.length ? true : false
  end

end
