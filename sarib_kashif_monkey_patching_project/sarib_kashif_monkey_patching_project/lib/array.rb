# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?

    begin
        x = self.max
        y = self.min
    rescue
        
    else
        return x - y
    end
  end

  def average
    return nil if self.length == 0

    begin
        x = self.sum.to_f
    rescue => exception
        
    else
        return x / self.length
    end
  end

  def median
    if self.length.zero?
        return nil 
    elsif self.length.even?
        temp = self.sort
        mid = self.length / 2
        return (temp[mid] + temp[mid - 1]) / 2.0
    else
        return self.sort[self.length / 2]
    end
  end

  def counts
    count = Hash.new(0)
    self.each { |ele| count[ele] += 1 }
    count
  end

  def my_count(val)
    count = 0
    self.each {|ele| count += 1 if ele == val}
    count
  end

  def my_index(val)
    self.each_with_index {|ele, i| return i if ele == val }
    nil
  end

  def my_uniq
    new_arr = []
    self.each {|ele| new_arr << ele if !(new_arr.include?(ele)) }
    new_arr
  end

  def my_transpose
    new_arr = Array.new(self.length) {Array.new(self[0].length)}
    self.each_with_index do |ele1, i|
        self.each_with_index do |ele2, j|
            new_arr[i][j] = self[j][i]
        end
    end
    new_arr
  end

end
