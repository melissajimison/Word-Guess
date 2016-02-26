
@elephant = "
   .----.-.
  /    ( o \
 '|  __ ` ||
  |||  ||| -' "


class GuessWord
  attr_accessor :guess
  attr_reader :word, :number_tries

  def initialize(word, number_tries)
    @word = word
    @shrinking_word = word
  end

  def user_guess
    puts "Please enter a letter or word guess"
    @guess = gets.chomp.downcase
  end

  def check_guess_if_word
    if @guess.length > 1
      if @guess == @word #for sting, change if array
        win_game
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
    $number_tries = $number_tries - 1
    puts "
       .----.-.
      /    ( o \
     '|  __ ` ||
      |||  ||| -' " * $number_tries #NEED TO FIX
    puts "You have lost a(n elephant) life!"
     if $number_tries == 0
       puts "Elephant murderer!!"
       exit
     end
  end

  def correct_letters #put before while loop in execute method
    puts "CORRECT_LETTERS"
    number_letters = word.length
    puts number_letters
    $correct_guesses = []
    number_letters.times do |each|
      $correct_guesses << "_"
    end
    # fill = "_ " * number_letters
    # $correct_guesses = %W(#{fill})
    puts $correct_guesses
  end

  def add_letter_correct_array
    while @shrinking_word.include?(guess)
      puts "ADD_LETTER_CORRECT_ARRAY"
      index = @shrinking_word.index(guess)
      @shrinking_word = @shrinking_word.sub(guess, " ")
      puts @shrinking_word # TESTING
      $correct_guesses[index] = guess
      puts $correct_guesses #TESTING
    end
  end

  def win_game
    puts "YAY YOU WON!! With #{ $number_tries } lives!!"


    exit
  end

  ## Create a method to "play again"


end

class RunGame
  attr_accessor :game, :word, :correct_guesses, :number_tries
  def initialize()
    @word = ["Melissa", "Nicole", "concatenation", "interpolation", "instance"].sample
    $number_tries = 6
  end

  def run
    #RUN CHOOSE-WORD METHOD => word
    @game = GuessWord.new(word, $number_tries)
    puts "Welcome to the Ada Word-Guess game"
    puts "instructions".upcase
    puts "
       .----.-.
      /    ( o \
     '|  __ ` ||
      |||  ||| -'
      " * 6

    puts "Every time you correctly guess a letter, you will be closer to will"
    puts "But when you miss a guess, one of the 6 elephants will die"
    game.correct_letters
    while $correct_guesses.to_s.include?("_") #DOES EVER BECOME FALSE?
      game.user_guess
      game.check_guess_if_word
 puts $number_tries
    end
    game.win_game
  end

end

play = RunGame.new()
play.run
