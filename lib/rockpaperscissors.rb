CLEAR_SCREEN = "\e[H\e[2J"

class RPS
    def initialize(bet)
        @balance = bet
        @choices = ["rock", "paper", "scissors"]
        puts "Welcome to Rock-Paper-Scissors!"
        play
    end

    def balance
        @balance
    end

    def get_player_choice
        puts "Please enter either rock/paper/scissors for your choice: "
        user_input = gets.chomp
        if @choices.include?(user_input)
            @player_hand = @choices.delete(user_input)
            puts CLEAR_SCREEN
        else
            puts CLEAR_SCREEN
            puts "Please enter a correct option (rock/paper/scissors)..."
            get_player_choice
        end
    end

    def play 
        @choices = @choices.shuffle!
        get_player_choice
        @cpu_hand = @choices.pop
        puts "You have: #{@player_hand}"
        puts "Type 'shoot' to determine who won!"
        input = gets.chomp
        if input == "shoot"
            puts CLEAR_SCREEN
            puts "Your choice: #{@player_hand}"
            puts "Computers choice: #{@cpu_hand}"
            if win?
                @balance *= 2
                puts "Congrats you have won #{@balance}"
                sleep(3)
                puts CLEAR_SCREEN
            else
                puts "Sorry... you have lost #{@balance}"
                @balance -= @balance
                sleep(3)
                puts CLEAR_SCREEN
            end
        else
            puts "Please type 'shoot' to continue..."
            play
        end
    end

    def win?
        if (@player_hand == "rock" && @cpu_hand == "paper") || (@player_hand == "paper" && @cpu_hand == "scissors") || (@player_hand == "scissors" && @cpu_hand == "rock")
            return false
        end
        return true
    end
end