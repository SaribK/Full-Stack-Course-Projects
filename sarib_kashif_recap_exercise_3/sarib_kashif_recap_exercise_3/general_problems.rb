def no_dupes?(arr)
    ans = []
    arr.each_with_index do |ele, i|
        temp = arr[0...i] + arr[i+1..-1]
        if !temp.include?(ele)
            ans << ele
        end
    end
    ans
end

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        if arr[i] == arr[i + 1]
            return false
        end
    end
    true
end

def char_indices(str)
    indices = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |char, i| indices[char] << i }
    indices
end

def longest_streak(str)
    streak = ""
    str.each_char.with_index do |char, i|
        temp_streak = char
        j = i + 1
        while str[j] == char
            temp_streak += char
            j += 1
        end
        if temp_streak.length >= streak.length
            streak = temp_streak
        end
    end
    streak
end

def bi_prime?(num)
    (2..num).each do |i|
        if !prime?(i)
            next
        end
        (2..num).each do |j|
            if prime?(j) and (i * j == num)
                return true
            end
        end
    end
    false
end

def prime?(num)
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end

def vigenere_cipher(str, keys)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_string = ""
    x = 0
    str.each_char.with_index do |char, i|
        new_index = alphabet.index(char) + keys[x % keys.length]
        new_string += alphabet[new_index % 26]
        x += 1
    end
    new_string
end

def vowel_rotate(str)
    new_string = ""
    vowels = "aeiou"
    occ = []
    str.each_char do |char|
        occ << char if vowels.include?(char)
    end

    i = 0
    str.each_char do |char|
        if vowels.include?(char)
            new_string += occ[i - 1]
            i += 1
        else
            new_string += char
        end
    end
    new_string
end