class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end
  
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    self.attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |c, i| indices << i if char == c }
    indices
  end

  def fill_indices(char, indices)
    indices.each { |i| self.guess_word[i] = char }
  end

  def try_guess(char)
    attempted = self.already_attempted?(char)
    if attempted
      puts "that has already been attempted"
      return false
    else
      indices = self.get_matching_indices(char)
      if indices.empty?
        @remaining_incorrect_guesses -= 1
      else
        self.fill_indices(char, indices)
      end
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word == @secret_word.split("")
      puts "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses.zero?
      puts "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end
    false
  end

end
