#!/usr/bin/env ruby
# encoding: UTF-8

class Array

  def toTwenty
    1.step(20,1).to_a
  end

  def toForty
    2.step(40,2).to_a
  end

  def toOneThousand
    10.step(1000,10).to_a
  end

  def search(guess, imin=0, imax=nil, count=0)
    # init imax - index of last element in array
    imax ||= self.length - 1
    # output if found
    result = {
      :length => self.length
    }
    # first check if at the first or last index
    if self.first == guess
      result[:index] = 0
      result[:count] = count
      return result
    elsif self.last == guess
      result[:index] = imax
      result[:count] = count
      return result
    else
      while imin <= imax
        mid = imin + ((imax - imin) / 2)
        if self[mid] == guess
          result[:index] = mid
          result[:count] = count
          return result
        elsif self[mid] < guess
          imin = mid + 1
          count += 1
        elsif self[mid] > guess
          imax = mid - 1
          count += 1
        end
      end
      # Not found
      result[:index] = -1
      result[:count] = count
      return result
    end
  end

end
