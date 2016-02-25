@word = "subcontinental"
@number_tries = 6

@elephant = "
   .----.-.
  /    ( o \
 '|  __ ` ||
  |||  ||| -' "

class GuessWord
  attr_accessor :guess

  def initialize(word)
    @word = word
  end

  def user_guess
    puts "Please enter a letter or word guess"
    @guess = gets.chomp.downcase
  end

  def check_guess_if_word
    if @guess.length > 1
      if @guess == @word #for sting, change if array
        #WIN METHOD
      else
        incorrect_guess
      end
    else
      check_letter
    end
  end

  def check_letter
    if @word.include?(@guess)
      correct_letters
      puts "Yay! You got a letter!"
    else
      incorrect_guess
    end
  end

  def incorrect_guess
    @number_tries -= @number_tries
    puts @elephant * number_tries
    puts "You have lost a turn"
     if @number_tries == 0
       put "YOU LOSER!!"
       exit
     end
  end

  def correct_letters
    number_letters = word.length
    @fill = number_letters * '_ '
    correct_guesses = %W(@fill)
  end
end

puts "Welcome to the Ada Word-Guess game"
puts "instructions".upcase
puts @elephants * 6
puts "Every time you correclty guess a letter, you will be closer to will"
puts "But when you miss guess, one of the 6 elephants will die"
user_guess
