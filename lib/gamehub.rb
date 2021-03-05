class GameHub 
    def initialize 
        get_player_name
    end

    def get_player_name
        puts "Please enter your players name: "
        @player_name = gets.chomp
        puts "Welcome #{@player_name}!"
    end
end

game = GameHub.new