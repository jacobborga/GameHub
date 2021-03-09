CLEAR_SCREEN = "\e[H\e[2J"

class Hangman 
    def initialize 
        puts "Welcome to Hangman!"
        load_data
        @secret_word = @word_list[rand(854)].chars
        @guess = Array.new(@secret_word.length, " _ ")
        @num_of_guesses = 6
    end

    def display_word
        puts @guess.join
    end

    def get_guess
        puts "\nPlease enter a character (A-Z) to guess: "
        user_input = gets.chomp
        if user_input.count("a-zA-Z") > 0
            check_char(user_input)
        else
            puts "Please enter a character between A-Z..."
            get_guess
        end
    end

    def check_char(user_input)
        if @secret_word.include?(user_input.downcase)
            puts CLEAR_SCREEN
            puts "The guess was correct!"
        else
            puts CLEAR_SCREEN
            puts "The guess was incorrect..."
        end
        @num_of_guesses -= 1
    end

    def load_data
        # Word list credited to dwyl @ https://github.com/dwyl/english-words
        file = File.open("./data/words.txt", "r")
        @word_list = file.read.split.map(&:chomp)
    end

    def over?
        if @guess == @secret_word
            return true
        else
            return false
        end
    end

    def play
        until over?
            display_word
            get_guess
        end
        puts "You have won!"
    end
end