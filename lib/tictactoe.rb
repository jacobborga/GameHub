CLEAR_SCREEN = "\e[H\e[2J"

class TicTacToe 
    def initialize(bet)
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        @balance = bet 
        play
    end

    def play
        puts "Balance: #{@balance}"
        puts "Welcome to Tic-Tac-Toe!"
        display_board
    end

    def display_board
        row = "-----------"
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts row
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts row 
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def position_taken?(index)
        if board[index] == "X" || board[index] == "O"
            return true
        end
        return false
    end

    def move(index, player)

    end
end