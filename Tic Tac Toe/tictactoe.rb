##Gabe Ryan
##TicTacToe
  ##UI/Main
##June 22, 2017
##Ruby

require './Game'

def tictactoe
  puts
  puts "            +---------------------------------+"
  puts "            |     Welcome to Tic-Tac-Toe!     |"
  puts "            +---------------------------------+"
  puts
  restart = true
  while restart

    restart = false

    single_player = false
    valid_entry = false
    while !valid_entry
      puts "Please enter 'single player' or 'multiplayer' to begin:"
      choice = gets.chomp.downcase

      case choice
      when "single player"
        single_player = true
        valid_entry = true
      when "multiplayer"
        valid_entry = true
      else
        puts "----ERROR: PLEASE ENTER VALID OPTION----"
        puts
      end

    end

    puts
    puts "Player one, please enter your name:"
    p1_name = gets.chomp.capitalize

    valid_entry = false
    while !valid_entry
      puts "#{p1_name}, please choose which token to play with ('X' or 'O'):"
      p1_token = gets.chomp.upcase
      if p1_token == 'X' || p1_token == "O"
        valid_entry=true
      else
        puts
        puts "----ERROR: PLEASE ENTER A VALID TOKEN VALUE----"
        puts
      end
    end

    p2_name = "Computer"
    if !single_player
      puts
      puts "Player two, please enter your name:"
      p2_name = gets.chomp.capitalize
    end
    p2_token =
      p1_token == "X" ? "O" : "X"

    game = Game.new(p1_name,p2_name,p1_token,p2_token)

    while game.game_over == false
      print "Please enter number corresponding to an open space on the board:"
      player_selection = gets.chomp.to_i
      if player_selection=="" || !game.check_selection?(player_selection)
        puts
        puts "----ERROR: PLEASE ENTER A VALID MOVE----"
        puts
      else
        game.turn(player_selection)
      end
    end

    if game.game_over == -1
      puts
      puts "It's a tie! Enter 'restart' to play again, or 'exit' to end the program:"
    else
      puts
      puts "Congratulations, #{game.current_player}, you win!"
      puts "Enter 'restart' to play again, or 'exit' to end the program:"
    end
    choice = gets.chomp.downcase
    case choice
    when 'restart'
      restart = true
    else
      puts "Thanks for playing!"
      puts
    end
  end
end

tictactoe
