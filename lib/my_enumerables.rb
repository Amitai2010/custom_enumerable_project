module Enumerable
  # Your code goes here
  def my_all?(pattern = nil)
    self.my_each do |elem|
      if block_given?
        return false unless yield(elem)
      elsif pattern
        return false unless pattern === elem
      else
        return false unless elem
      end
    end
    true
  end

  def my_any?(elem)
    self.my_each do |arr_elem|
      return ture if elem == arr_elem
    end
    return false
  end

  def my_count(patten = nil)
    count = 0
    self.my_each do |elem|
      if block_given?
        count += 1 if yield(elem)
      elsif patten
        count += 1 if elem === pattern
      else
        count += 1
      end
    end
    return count
  end

  def my_each_with_index
    index = 0
    self.my_each do |elem|
      yield(elem, index)
      index += 1
    end
    self
  end

  def my_inject(initial=0)
    result = initial
    self.my_each do |elem|
      result = yield(result, elem)
    end
    result
  end

  def my_map
    result = []
    self.my_each do |elem|
      result << yield(elem)
    end
    result
  end

  def my_none?(pattern = nil)
    self.my_each do |elem|
      if block_given?
        return false if yield(elem)
      elsif pattern
        return false if pattern === elem
      else
        return false if elem
      end
    end
    true
  end

  def my_select
    result = []
    self.my_each do |elem|
      result << elem if yield(elem)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0...self.length
      yield(self[i])
    end
    self
  end
end
