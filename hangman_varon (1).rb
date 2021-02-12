# Load in common words and then store common words in an array
common = File.open('common.txt')
commonArr = common.readlines
commonArr.shuffle!

# Intro text, wait for user to type 'start'
puts "\n                         {{ Welcome to Hangman }}\n\n"
puts "Type \"play\" to begin a new game\n"
turn = 0
rematch = nil

start = gets.chomp.downcase.strip
until start == "play"
start = gets.chomp.downcase.strip
end


# Loop the game until the user types 'stop'
until rematch == "stop"

  # Get a word, put the chars into an array, make an array of letters remaining
  commonArr.shuffle!
  word = commonArr[50]
  wordArr = word.chars.to_a
  lettersRemaining = commonArr[50].chars.to_a

  wordArr.delete_at(wordArr.length-1)
  lettersRemaining.delete_at(lettersRemaining.length-1)


# Initialize Alphabet and Lives
alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
lives = 7
  
  # first turn OR rematch
  if rematch == "again" || turn == 0
  wordArr.each do |x|
    print "_ "
  end
  puts "\n\n"

  puts "Word generated!\n"
  puts "Lives Remaining: #{lives}"
  puts "Letters Remaining: "

  alphabet.each do |x|
    print "#{x} "
  end
  puts "\n\n"

  puts "Guess a letter: "
  guess = gets.chomp.upcase.strip

  until alphabet.include?(guess) == true
    puts "INVAID ENTRY"
    puts "Please guess again"
    guess = gets.chomp.upcase.strip
  end
  
  until lives == 0 || lettersRemaining == [] # Only stop if lives are 0 or no letters remaining
  
    if wordArr.include?(guess.downcase) == true
      puts "\n\n"
      alphabet.delete(guess)
      lettersRemaining.delete(guess.downcase)
    
      if lettersRemaining == []
        break
      end
      
      wordArr.each do |x|
        if alphabet.include?(x.upcase) == true
          print "_ "
        else
          print "#{x.upcase} "
        end
      end
    
      puts "\n\n"
      puts "Lives Remaining: #{lives}"
      puts "Letters Remaining: "

      alphabet.each do |x|
        print "#{x} "
      end
      puts "\n\n"
  
      puts "Guess a letter: "
      guess = gets.chomp.upcase.strip
   
      until alphabet.include?(guess) == true
         puts "INVAID ENTRY"
         puts "Please guess again"
         guess = gets.chomp.upcase.strip
      end
  
    elsif lives > 1
      lives -= 1
  
      puts "WRONG!\n\n"
      alphabet.delete(guess)
  
      wordArr.each do |x|
        if alphabet.include?(x.upcase) == true
          print "_ "
        else
          print "#{x.upcase} "
        end
      end
    
      puts "\n\n"
      puts "Lives Remaining: #{lives}"
      puts "Letters Remaining: "

      alphabet.each do |x|
        print "#{x} "
      end
      puts "\n\n"
  
      puts "Guess a letter: "
      guess = gets.chomp.upcase.strip
   
      until alphabet.include?(guess) == true
         puts "INVAID ENTRY"
         puts "Please guess again"
         guess = gets.chomp.upcase.strip
      end
  
    else
      lives -= 1
      puts "YOU LOSE!\n"
      puts "The correct word was "
      puts wordArr.join.to_s.upcase
    end
  
  end

  if lettersRemaining == []
    puts "YOU WON! You guessed the word: "
    puts wordArr.join.to_s.upcase
  end

  turn += 1
  puts "Type \"again\" to play again, type \"stop\" to exit"
  rematch = gets.chomp.downcase.strip
  else
  puts "Please type either \"again\" OR \"stop\""
  end
end
