def partition(arr, num)
    low = []
    high = []
    arr.each do |ele|
        if ele < num
            low << ele
        else 
            high << ele
        end
    end
    [low, high]
end

def merge(hash1, hash2)
    new_hash = {}
    hash1.each { |key, val| new_hash[key] = val }
    hash2.each { |key, val| new_hash[key] = val }
    new_hash
end

def censor(sentence, arr)
    sentence.split.map do |word|
        if arr.include?(word.downcase)
            replace_vowels(word)
        else
            word
        end
    end.join(" ")
end

def power_of_two?(num)
    while num != 1 and num % 2 == 0
        num /= 2.0
    end
    num == 1
end

# private
def replace_vowels(word)
    vowels = "aeiouAEIOU"
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            word[i] = "*"
        end
    end
    word
end