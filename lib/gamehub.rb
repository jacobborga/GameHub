class GameHub 
    def initialize 
        get_player_name
    end

    def get_player_name
        puts "Please enter your players name: "
        @player_name = gets.chomp
        puts "Welcome #{@player_name}!"
    end

    def deposit_cash
        puts "Please enter a cash $ amount you would like to exchange for tokens..."
        @usd_balance = gets.chomp 
        exchange_rate
    end

    def exchange_rate
        @balance = @usd_balance * 10
    end
end

game = GameHub.new