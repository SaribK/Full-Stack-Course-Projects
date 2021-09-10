require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        puts @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        end
        false
    end

    def win?
        if @board.num_ships.zero?
            puts "you win"
            return true
        end
        false
    end

    def game_over?
        return true if self.win? || self.lose?
        false
    end

    def turn
        pos = @player.get_move
        check = @board.attack(pos)
        @board.print
        if !check
            @remaining_misses -= 1
        end
        puts @remaining_misses
    end
end
