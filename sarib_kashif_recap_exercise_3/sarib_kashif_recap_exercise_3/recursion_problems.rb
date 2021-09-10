def multiply(a, b)
    if a == 0 || b == 0
        return 0
    end
    if a < 0
        return multiply(-a, -b)
    end
    if a == 1
        return b
    end
    return b + multiply(a - 1, b)
end

def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2, 1] if num == 2
    return lucas_sequence(num - 1) + [lucas_sequence(num - 1)[-1] + lucas_sequence(num - 2)[-1]]
end

def prime_factorization(num)
    (2...num).each do |fact|
        if (num % fact == 0)
            otherFact = num / fact
            return [ prime_factorization(fact), prime_factorization(otherFact) ].flatten
        end
    end

    [num]
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]