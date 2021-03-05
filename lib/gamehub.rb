require 'awesome_print'

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
            puts "Tic-Tac-Toe"
        when 2
            puts "Rock-Paper-Scissors"
        when 3
            puts "Hangman"
        when 4
            puts "Blackjack"
        when 5
            puts "Exit"
        else
            puts CLEAR_SCREEN
            puts "Please enter a valid option..."
            display_main_menu
        end
    end
end

game = GameHub.new