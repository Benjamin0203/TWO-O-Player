class Game
  attr_accessor :player1, :player2, :current_player

  def initialize
    @player1 = Player.new("Player 1", 3)
    @player2 = Player.new("Player 2", 3)
    @current_player = @player1
  end

  def turn
    puts "--- NEW TURN ---"
    # Generate a new math question
    num1 = rand(1..20)
    num2 = rand(1..20)
    puts "#{current_player.name}: What does #{num1} + #{num2} equal?"
    print ">"

    # Prompt the current player to answer the question
    answer = $stdin.gets.chomp.to_i

    # Check if the answer is correct
    if answer == num1 + num2
      puts "YES! You are correct!"
      # Move to the next player's turn
      if current_player == player1
        self.current_player = player2
      else
        self.current_player = player1
      end
    else
      puts "Seriously? No!"
      # Subtract 1 from the player's lives
      current_player.lives -= 1
      # Move to the next player's turn
      if current_player == player1
        self.current_player = player2
      else
        self.current_player = player1
      end
    end
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3" 
  end

  def end_game
    # Announce the winner and the other player's score
    if player1.lives == 0 
      puts "Player 2 wins with a score of #{player2.lives}/3"
    elsif player2.lives == 0 
      puts "Player 1 wins with a score of #{player1.lives}/3"
    else
      puts "It's a tie!"  
    end
  end

  def play
    # Handle the game loop
    while player1.lives > 0 && player2.lives > 0
      turn
    end
    end_game
    puts "--- GAME OVER ---"
    puts "Good bye!"
    exit(0)
  end
end

# Game.new.play
