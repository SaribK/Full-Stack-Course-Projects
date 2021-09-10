class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](indices)
        @grid[indices[0]][indices[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        end
        self[pos] = :X
        false
    end

    def place_random_ships
        count = 0.25 * @size
        while self.num_ships < count
            row = rand(@grid.length - 1)
            col = rand(@grid.length - 1)
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row| 
            row.map do |ele| 
                if ele == :S
                    :N 
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(board)
        board.each do |row|
            row.each.with_index do |ele, i|
                print ele.to_s
                print " " if i != board.length - 1
            end
            puts ""
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
