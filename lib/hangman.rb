CLEAR_SCREEN = "\e[H\e[2J"

class Hangman 
    def initialize(bet)
        load_data
        @secret_word = @word_list[rand(854)].chars
        @guess = Array.new(@secret_word.length, " _ ")
        @num_of_guesses = 6
        @hints_left = 1
        @starting_bal = bet
        @balance = bet
        play
    end

    def balance
        @balance
    end

    def display_word
        puts "Welcome to Hangman!"
        puts "Bet: #{@balance}"
        puts "Guesses left: #{@num_of_guesses}"
        puts "Hints left: #{@hints_left} (Type '!' to use hint)\n\n"
        puts @guess.join.capitalize
    end

    def get_hint
        if @hints_left > 0
            puts CLEAR_SCREEN
            puts "Hint used!"
            @hints_left -= 1
            random_index = rand(@secret_word.length)
            @guess[random_index] = @secret_word[random_index]
        end
    end

    def get_guess
        puts "\nPlease enter a character (A-Z) to guess: "
        user_input = gets.chomp
        if user_input == "!"
            get_hint
        elsif user_input == ""
            puts "Please enter a character between A-Z..."
        elsif user_input.count("a-zA-Z") > 0
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
            if @secret_word.count(user_input) > 1
                index = @secret_word.each_with_index.select { |char, index| char == user_input.downcase }.map { |pair| pair[1] }
                counter = 0
                until counter == index.length
                    @guess[index[counter]] = user_input.downcase
                end
            else
                index = @secret_word.find_index(user_input.downcase)
                @guess[index] = user_input.downcase
            end
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

    def win?
        if @guess == @secret_word
            @balance *= 2
            return true
        else
            return false
        end
    end

    def over?
        if win?
            return true
        elsif !win? && @num_of_guesses == 0
            @balance -= @balance
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
        puts "You have #{@win ? "won #{@balance}":"lost #{@starting_bal}"} tokens!"
        puts "The secret word: #{@secret_word.join.capitalize}"
        sleep(3)
        puts CLEAR_SCREEN
    end
end