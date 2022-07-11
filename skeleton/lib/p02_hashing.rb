class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    value = 1
    self.each_with_index do |ele, idx|
      value += value * ele * idx
    end
    return value
  end
end

class String
  def hash
    value = 1
    self.split('').each_with_index do |ele, idx|
      value += value * ele.ord * idx
    end
    return value.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
    output = 1
    self.each do |key, value|
      if !key.is_a?(Integer) && value.is_a?(Integer)
        output += key.to_s.ord * value
      elsif key.is_a?(Integer) && !value.is_a?(Integer)
        output += key * value.to_s.ord
      else
        output += key.to_s.ord * value.to_s.ord
      end
    end
    return output
  end
end
