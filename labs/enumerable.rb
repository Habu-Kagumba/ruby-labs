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
    # result = []
    # self.my_each { |e| result << e if yield(e) }
    # result
    [].tap { |out| my_each { |e| out << e if yield(e) } }
  end

end
