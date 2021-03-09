require_relative('card.rb')

CLEAR_SCREEN = "\e[H\e[2J"

class BlackJack 
    def initialize(bet)
        puts "Welcome to BlackJack!"
        @balance = bet
        puts "Currently a WIP!"
        sleep(2.5)
        puts CLEAR_SCREEN
    end

    def balance
        @balance
    end
end