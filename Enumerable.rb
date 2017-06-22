##Gabe Ryan
##Enumerable Functions
##June 22, 2017
##Ruby


module Enumerable

  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i+=1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i],i)
      i+=1
    end
    self
  end

  def my_select
    arr = []
    self.my_each { |i|
      arr << i if yield(i)
    }
    arr
  end

  def my_all?
    self.my_each { |i|
      return false if !yield(i)
    }
    true
  end

  def my_any?
    self.my_each { |i|
      return true if yield(i)
    }
    false
  end

  def my_none?
    self.my_each { |i|
      return false if yield(i)
    }
    true
  end

  def my_count
    count = 0
    self.my_each { |i|
      count+=1 if yield(i)
    }
    count
  end

  def my_map
    arr = []
    self.my_each { |x|
      arr << yield(x)
    }
    arr
  end

  def my_inject(initial=nil)
    if initial
      result = initial
    else
      result = self.shift
      x = result
    end
    self.my_each { |i|
      result = yield(result,i)
    }
    self.unshift(x)
    result
  end
end
