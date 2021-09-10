# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    i = num
    while i > 1
        if num % i == 0 && prime?(i)
            return i
        end
        i -= 1
    end
    -1
end

def prime?(num)
    return false if num < 2
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    true
end

def unique_chars?(str)
    hash = Hash.new(0)
    str.each_char { |char| hash[char] += 1 }
    ! (hash.values.max > 1) 
end

def dupe_indices(arr)
    count = Hash.new(0)
    arr.each { |ele| count[ele] += 1 }
    hash = {}
    count.each do |k, v|
        if v > 1
            hash[k] = []
        end
    end

    hash.each_key do |k|
        arr.each_with_index { |ele, i| hash[k] << i if ele == k }
    end

    hash
end

def ana_array(arr1, arr2)
    if arr1.length != arr2.length
        return false
    end
    arr1.each do |x|
        arr2.each_with_index do |y, i|
            if x == y
                arr2.delete_at(i)
                next
            end
        end
    end
    arr2.length == 0
end