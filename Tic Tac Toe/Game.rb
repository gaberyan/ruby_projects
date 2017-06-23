##Gabe Ryan
##TicTacToe
  ##game.class
##June 22, 2017
##Ruby

require './Board'

class Game
  attr_reader :game_over
  attr_reader :current_player
  def initialize(p1_name,p2_name,p1_token,p2_token)
    @p_1 = p1_name
    @p_2 = p2_name
    @players = {
      @p_1 => p1_token,
      @p_2 => p2_token
    }
    @current_player = @p_1
    @board = Board.new
    @game_over = false
  end

  def turn(player_selection)
    index,player_selection = get_index(player_selection)
    @board.update_board(index,player_selection,@players[@current_player])
    @game_over = @board.win? @players[@current_player]
    switch_player if !@game_over
  end

  def check_selection?(player_selection)
    index,valid_selection = get_index(player_selection)

    return true if @board.board_matrix[index][valid_selection] == player_selection
    false
  end

  def get_index(player_selection)
    if player_selection < 4
      index = 0
      player_selection -= 1
    elsif player_selection < 7
      index = 1
      player_selection -= 4
    elsif player_selection <10
      index = 2
      player_selection -= 7
    end
    return index,player_selection
  end

  def switch_player
    @current_player =
      @current_player == @p_1 ? @p_2 : @p_1
  end
end
