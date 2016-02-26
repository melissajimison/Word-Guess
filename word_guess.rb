@word = "subcontinental"
@number_tries = 6
@elephant = "
   .----.-.
  /    ( o \
 '|  __ ` ||
  |||  ||| -' "


class GuessWord
  attr_accessor :guess
  attr_reader :word, :number_tries

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
      add_letter_correct_array
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

  def add_letter_correct_array
    shrinking_word = word
    while shrinking_word.includes?(guess)
      index = word.index(guess)
      shrinking_word.tr(guess)
      correct_guesses[index] = guess
    end
  end


end

puts "Welcome to the Ada Word-Guess game"
puts "instructions".upcase
puts "
   .----.-.
  /    ( o \
 '|  __ ` ||
  |||  ||| -'
  " * 6

puts "Every time you correclty guess a letter, you will be closer to will"
puts "But when you miss guess, one of the 6 elephants will die"
user_guess
check_guess_if_word
check_letter
