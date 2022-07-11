class MaxIntSet
  attr_reader :max, :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if num > max || num < 0
      raise 'Out of bounds'
    end
    self.store[num] = true
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    # @store.include?(num)
    if self.store[num] == true
      return true
    else
      return false
    end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] = num
  end

  def remove(num)
    @store[num % num_buckets] = []
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def include?(num)
    @store.include?(num)
  end

  def insert(num)
    if !@store.include?(num)
      @store[num % num_buckets] = num
      @count += 1
      resize! if @count >= @store.length
    end
  end

  def remove(num)
    if @store.include?(num)
      @store.delete(num)
      @count -= 1
    end
  end


  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    value = self.store
    self.store = Array.new(value.length * 2) { Array.new }
    self.count = 0
    value.each { |ele| insert(ele)}
  end
end
