class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        if self.occupants.length < self.capacity
            return false
        end
        true
    end

    def available_space
        self.capacity - self.occupants.length
    end

    def add_occupant(name)
        if self.full?
            return false
        end
        self.occupants << name
        true
    end
end
