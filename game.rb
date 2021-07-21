class Game

  def initialize()
    @player1
    @player2
    @current_player
    @round = 0
  end
  
  def start
    greeting
    assign_players
    play
    game_summary
  end

  def greeting
    puts "Welcome to Math Game! This game requires 2 players!"
  end
  
  def assign_players
    player1_name = get_player_name(1)
    player2_name = get_player_name(2)
    @player1 = Players.new(player1_name)
    @player2 = Players.new(player2_name)
  end
  
  def get_player_name(n)
    puts "Enter Player #{n}'s name"
    gets.chomp
  end

  def play
    while (@player1.alive? && @player2.alive?) do
      @current_player = (@round == 0) ? @player1 : @player2
      execute_turn
      @round = (@round + 1) % 2
    end
  end

  def execute_turn
    puts '----- NEW TURN -----'
    question = Questions.new
    puts "#{@current_player.name}: #{question.show}"
    print '> '
    answer = gets.chomp
    
    if answer.to_i == question.answer
      puts "#{@current_player.name}: YES! You are correct."
      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        
    else
      @current_player.lives -= 1
      puts "#{@current_player.name}: Seriously? No!"
      puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
    end
  end

  def game_summary
    if (@player1.lives == 0)
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
      exit(0)
    else
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
      exit(0)
    end
  end
end