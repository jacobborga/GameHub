class TicTacToe 
    def initialize(bet)
        @balance = bet 
        play
    end

    def play
        puts "Balance: #{@balance}"
        puts "Welcome to Tic-Tac-Toe!"
    end
end