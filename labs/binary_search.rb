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
    imax ||= self.length - 1

    result = {
      :length => self.length
    }

    while imin <= imax do
      if self[imax] == guess
        result[:index] = imax
        result[:count] = count
        return result
      elsif self[imin] == guess
        result[:index] = imin
        result[:count] = count
        return result
      else
        mid = imin + ((imax - imin) / 2)
        if self[mid] == guess
          result[:index] = mid
          result[:count] = count
          return result
        elsif self[mid] < guess
          imin = mid + 1
          imax -= 1
          count += 1
        else
          imax = mid - 1
          imin += 1
          count += 1
        end
      end
    end

    result[:index] = -1
    result[:count] = count
    return result
	end

end
