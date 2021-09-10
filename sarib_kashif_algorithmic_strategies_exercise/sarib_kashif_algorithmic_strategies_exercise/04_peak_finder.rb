# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
    ans = []
    arr.each_with_index do |ele, i|
        left = arr[i - 1]
        right = arr[i + 1]

        if i == 0 && ele > right
            ans << ele
        elsif i == arr.length - 1 && ele > left
            ans << ele
        elsif right != nil and left != nil and ele > right and ele > left
            ans << ele
        end
    end
    ans
end

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]