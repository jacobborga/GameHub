require_relative("./tictactoe.rb")
require_relative("./rockpaperscissors.rb")
require_relative("./hangman.rb")
require_relative("./blackjack.rb")

CLEAR_SCREEN = "\e[H\e[2J"

class GameHub 
    def initialize 
        puts CLEAR_SCREEN
        get_player_name
        deposit_cash
        display_main_menu
    end

    def get_player_name
        puts "Please enter your players name: "
        @player_name = gets.chomp
        puts CLEAR_SCREEN
        puts "Welcome #{@player_name}!"
    end

    def deposit_cash
        puts "Please enter a cash $ amount you would like to exchange for tokens..."
        @usd_balance = gets.chomp 
        @usd_balance = @usd_balance.to_i
        puts CLEAR_SCREEN
        exchange_rate
    end

    def exchange_rate
        @balance = @usd_balance * 10
    end

    def display_main_menu
        puts "1) Tic-Tac-Toe"
        puts "2) Rock-Paper-Sissors"
        puts "3) Hangman"
        puts "4) Blackjack"
        puts "5) Exit"
        user_input = gets.chomp
        navigate_menu(user_input)
    end

    def navigate_menu(user_input)
        case user_input.to_i
        when 1
            puts CLEAR_SCREEN
            bet = get_bet
            ttt = TicTacToe.new(bet)
            # ttt.play
            display_main_menu
        when 2
            puts CLEAR_SCREEN
            rps = RPS.new
            # rps.play
            display_main_menu
        when 3
            puts CLEAR_SCREEN
            hangman = Hangman.new
            # hangman.play
            display_main_menu
        when 4
            puts CLEAR_SCREEN
            blackjack = BlackJack.new 
            # blackjack.play 
            display_main_menu
        when 5
            puts CLEAR_SCREEN
            exit
        else
            puts CLEAR_SCREEN
            puts "Please enter a valid option..."
            display_main_menu
        end
    end

    def get_bet
        puts "Please enter an amount you would like to play (MAX: #{@balance})"
        bet = gets.chomp
        bet = bet.to_i
        if bet < 99
            puts "Please enter a play amount larger than 100"
            get_bet
        elsif bet > @balance
            puts "The maximum amount you can play with is #{@balance}"
            get_bet
        elsif bet == String
            puts "Please enter a valid play amount (100-#{@balance})"
            get_bet
        end
        return bet
    end
end

game = GameHub.new