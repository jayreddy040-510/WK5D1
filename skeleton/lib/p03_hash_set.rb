class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !@store.include?(key)
      @store[key.hash % num_buckets] = key
      @count += 1
      resize! if @count > @store.length
    end
  end

  def include?(key)
    @store.include?(key)
  end

  def remove(key)
    if @store.include?(key)
      @store.delete(key)
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
