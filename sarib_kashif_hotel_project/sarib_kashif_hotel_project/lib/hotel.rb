require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each { |k, v| @rooms[k] = Room.new(v) }
    end

    def name
        @name.split.map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        if self.rooms.include?(room)
            return true
        end
        false
    end

    def check_in(person, room)
        if self.room_exists?(room)
            if self.rooms[room].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        self.rooms.each_value do |room|
            if !room.full?
                return true
            end
        end
        false
    end

    def list_rooms
        self.rooms.each do |name, room|
            puts name + " " + room.available_space.to_s
        end
    end
end
