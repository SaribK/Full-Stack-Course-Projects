def reverser(string, &block)
    block.call(string.reverse)
end

def word_changer(sentence, &block)
    sentence.split.map { |word| block.call(word) }.join(" ")
end

def greater_proc_value(num, proc_1, proc_2)
    return [proc_1.call(num), proc_2.call(num)].max
end

def and_selector(array, proc_1, proc_2)
    array.select { |ele| proc_1.call(ele) and proc_2.call(ele) }
end

def alternating_mapper(array, proc_1, proc_2)
    array.map.with_index do |ele, i|
        if i.even?
            proc_1.call(ele)
        else
            proc_2.call(ele)
        end
    end
end