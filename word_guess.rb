require 'colorize'
class GuessWord
  attr_accessor :guess
  attr_reader :word, :number_tries

  def initialize(word, number_tries)
    @word = word
    @shrinking_word = word
    @incorrect_letters =[]
  end

  def user_guess
    puts "Please enter a letter or word guess"
    @guess = gets.chomp.downcase
  end

  def check_guess_if_word
    if @guess.length > 1
      if @guess == @word #for sting, change if array
        $correct_guesses = word
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
    @incorrect_letters << guess
    board_display
    puts "You have lost a(n elephant) life!".red
     if $number_tries == 0
       puts "Elephant murderer!!"
     end
  end

  def correct_letters #put before while loop in execute method
    number_letters = word.length
    $correct_guesses = []
    number_letters.times do |each|
      $correct_guesses << "_"
    end
    # fill = "_ " * number_letters
    # $correct_guesses = %W(#{fill})
  end

  def add_letter_correct_array
    while @shrinking_word.include?(guess)
      index = @shrinking_word.index(guess)
      @shrinking_word = @shrinking_word.sub(guess, " ")
      $correct_guesses[index] = guess
      board_display
    end
  end

  def win_game
    puts "YAY YOU WON!! With #{ $number_tries } lives!!"
  end

  def board_display
    # correct_guesses = ["_", "_", "_"]
    puts $correct_guesses.join (' ')
    # => correct_guesses = ["_ _ _"]
    $number_tries.times do
    puts "
       .----.-.
      /    ( o |".blue
    puts "
     '|  __ ` ||
      |||  ||| -' ".blue
    end
    puts "Letters guessed:"
    puts @incorrect_letters.join
  end
  #previously EXIT
end

class RunGame
  attr_accessor :game, :word, :correct_guesses, :number_tries
  def initialize()
    @word = ["melissa", "nicole", "concatenation", "interpolation", "instance"].sample
    $number_tries = 6
  end

  def run
    continue = "y"
    while continue == "y"
    game = GuessWord.new(word, $number_tries)
    puts "Welcome to the Ada Word-Guess game"
    puts "instructions".upcase
    puts "Every time you correctly guess a letter, you will be closer to will"
    puts "But when you miss a guess, one of the 6 elephants will die"
    game.correct_letters
    game.board_display

    while $correct_guesses.to_s.include?("_") && $number_tries>0 #DOES EVER BECOME FALSE?
      game.user_guess
      game.check_guess_if_word
      puts $number_tries
    end
    if $correct_guesses.to_s.include?("_") || $correct_guesses == @word
      game.win_game
    else
      puts "You lost! Elephant murderer!".purple
    end
    puts "Do you want to play again? (y/n):"
    continue = gets.chomp.downcase
      if continue == "n" || continue == "no"
        exit
      end
    @word = ["melissa", "nicole", "concatenation", "interpolation", "instance"].sample
    $number_tries = 6
    end
  end
end
play = RunGame.new()
play.run
