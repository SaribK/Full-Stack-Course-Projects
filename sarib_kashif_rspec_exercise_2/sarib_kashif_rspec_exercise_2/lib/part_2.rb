def palindrome?(str)
    i = 0
    while i < str.length / 2
        if str[i] != str[str.length - 1 - i]
            return false
        end
        i += 1
    end
    true
end

def substrings(str)
    sub = []
    str.each_char.with_index do |char1, i|
        sub << char1
        str.each_char.with_index do |char2, j|
            if i < j
                sub << str[i..j]
            end
        end
    end
    sub
end

def palindrome_substrings(str)
    sub = substrings(str)
    sub.select { |word| word.length > 1 and palindrome?(word) }
end