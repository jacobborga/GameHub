require_relative("./tictactoe.rb")
require_relative("./rockpaperscissors.rb")
require_relative("./hangman.rb")
require_relative("./blackjack.rb")

class GameHub 
    def initialize 
        puts CLEAR_SCREEN
        get_player_name
        deposit_usd
        display_main_menu
    end

    def get_player_name
        puts "Please enter your players name: "
        @player_name = gets.chomp
        puts CLEAR_SCREEN
        puts "Welcome #{@player_name}!"
    end

    def deposit_usd
        puts "Please enter a cash/$ amount you would like to exchange for tokens (MIN:$10/MAX:$1,000,000)..."
        input = gets.chomp 
        input = input.to_i
        if input.between?(9, 1000001)
            if @usd_balance == 0 || @usd_balance == nil
                @usd_balance = input
            else
                @usd_balance += input
            end
            puts CLEAR_SCREEN
            exchange_usd_tokens
        else
            puts CLEAR_SCREEN
            puts "Please enter a value between $10-$1,000,000"
            deposit_usd
        end
    end

    def withdraw_usd 
        puts "Please enter the token amount you would like to exchange for cash/$ (MAX: #{@balance})..."
    end

    def exchange_tokens_usd
        temp = @balance * 0.10
        @usd_balance += temp.round(2)
    end

    def exchange_usd_tokens
        temp = @usd_balance * 10
        @usd_balance = 0
        if @balance == 0 || @balance == nil
            @balance = temp.round(0)
        else
            @balance += temp.round(0)
        end
    end

    def display_main_menu
        user_input = nil
        puts "Balance: #{@balance}"
        puts "1) Tic-Tac-Toe"
        puts "2) Rock-Paper-Sissors"
        puts "3) Hangman"
        puts "4) Blackjack"
        puts "5) Deposit"
        puts "6) Withdraw"
        puts "7) Exit"
        user_input = gets.chomp
        navigate_menu(user_input)
    end

    def navigate_menu(user_input)
        case user_input.to_i
        when 1
            puts CLEAR_SCREEN
            bet = get_bet
            @balance -= bet
            ttt = TicTacToe.new(bet)
            @balance += ttt.balance
            # ttt.play
            display_main_menu
        when 2
            puts CLEAR_SCREEN
            bet = get_bet
            @balance -= bet
            rps = RPS.new(bet)
            @balance += rps.balance
            display_main_menu
        when 3
            puts CLEAR_SCREEN
            hangman = Hangman.new
            hangman.play
            display_main_menu
        when 4
            puts CLEAR_SCREEN
            blackjack = BlackJack.new 
            # blackjack.play 
            display_main_menu
        when 5
            puts CLEAR_SCREEN
            deposit_cash
            display_main_menu
        when 6
            puts CLEAR_SCREEN
            withdraw_usd
            display_main_menu
        when 7
            puts CLEAR_SCREEN
            exit
        else
            puts CLEAR_SCREEN
            puts "Please enter a valid option..."
            display_main_menu
        end
    end

    def withdraw

    end

    def get_bet
        puts "Please enter an amount you would like to play (MAX: #{@balance})"
        bet = gets.chomp
        bet = bet.to_i
        puts CLEAR_SCREEN
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