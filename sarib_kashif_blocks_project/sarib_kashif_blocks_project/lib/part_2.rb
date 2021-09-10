def all_words_capitalized?(words)
    words.all? { |word| word[0].upcase == word[0] && word[1..-1].downcase == word[1..-1] }
end

def no_valid_url?(urls)
    valid = [".com", ".net", ".io", ".org"]
    urls.none? do |url| 
        valid.any? { |word| url.end_with?(word) } 
    end
end

def any_passing_students?(array)
    array.any? do |student|
        student[:grades].sum / student[:grades].length.to_f >= 75
    end
end