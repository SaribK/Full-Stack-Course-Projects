def my_map(array, &block)
    new_array = []
    array.each { |ele| new_array << block.call(ele) }
    new_array
end

def my_select(array, &block)
    new_array = []
    array.each { |ele| new_array << ele if block.call(ele) }
    new_array
end

def my_count(array, &block)
    count = 0
    array.each { |ele| count += 1 if block.call(ele) }
    count
end

def my_any?(array, &block)
    array.each { |ele| return true if block.call(ele) }
    false
end

def my_all?(array, &block)
    array.each { |ele| return false if ! block.call(ele) }
    true
end

def my_none?(array, &block)
    array.each { |ele| return false if block.call(ele) }
    true
end