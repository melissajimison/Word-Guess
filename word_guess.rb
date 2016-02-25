@word = "subcontinental"
@number_tries = 6
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
      #CORRECT LETTER METHOD
    else
      incorrect_guess
    end
  end

def incorrect_guess
  @number_tries = @number_tries -1
  put "You have lost a turn"
   if @number_tries = 0
     put "YOU LOSER!!"
     exit
end

end

puts "Welcome to the Ada Word-Guess game"
puts "instructions".upcase
#ASCII art
puts "Every time you correclty guess a letter, you will be closer to will"
puts "But when you miss guess, one of the 6 elephants will die"
user_guess
