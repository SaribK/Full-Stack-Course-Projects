class String
    def select(&prc)
        if prc.nil?
            return ""
        end
        new_string = ""
        self.each_char do |char|
            if prc.call(char)
                new_string += char
            end
        end
        new_string
    end

    def map!(&prc)
        new_string = ""
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
    end
end

