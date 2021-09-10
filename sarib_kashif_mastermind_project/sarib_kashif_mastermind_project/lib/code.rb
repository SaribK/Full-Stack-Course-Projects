class Code
  attr_accessor :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.include?(char.upcase) }
  end
  
  def initialize(chars)
    raise "array does not contain valid pegs" if !Code.valid_pegs?(chars)
    @pegs = chars.map(&:upcase)
  end

  def self.random(length)
    pegs = ["R", "G", "B", "Y"]
    arr = []
    length.times {arr << pegs[rand(3)]}
    Code.new(arr)
  end

  def self.from_string(pegs)
    return Code.new(pegs.split(""))
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end
  
  def num_exact_matches(code)
    matches = 0
    code.pegs.each_with_index { |char, i| matches += 1 if char == self.pegs[i] }
    matches
  end

  def num_near_matches(code)
    matches = 0
    code.pegs.each_with_index do |char1, i|
      if char1 == self.pegs[i]
        next
      end
      self.pegs.each_with_index do |char2, j|
        if char1 == char2 and i != j 
          matches += 1
          break
        end
      end
    end
    matches
  end

  def ==(code)
    false if code.length != self.length
    code.pegs.each_with_index { |char, i| return false if char != self.pegs[i] }
    true
  end
end
