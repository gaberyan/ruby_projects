##Gabe Ryan
##TicTacToe
  ##Board class
##June 22, 2017
##Ruby


class Board
  attr_reader :board_matrix
  def initialize
    @board_matrix = [[1,2,3],[4,5,6],[7,8,9]]
    show_game_board
  end

  def show_game_board
    puts
    puts "                    Current Board"
    puts "          +-------------------------------+"
    puts "          |                               |"
    line = "          |       -----+-----+-----       |"
    @board_matrix.length.times { |i|
      build_row = "          |         "
      @board_matrix[i].length.times { |j|
        build_row += @board_matrix[i][j].to_s
        build_row += "  |  " if j<2
        build_row +="         |" if j ==2
      }
      puts build_row
      puts line if i<2
    }
    puts "          |                               |"
    puts "          +-------------------------------+"
    puts
  end

  def update_board(row,col,token)
    @board_matrix[row][col] = token
    show_game_board
  end



  ##################### Find winner #####################
  def win?(token)
    @board_matrix.length.times {|i|
      return true if @board_matrix[i].all? {|x| x == token}
      return true if diagonal_win?(i) {|x,y| @board_matrix[x][y]==token }
      return true if vertical_win?(i) {|x,y| @board_matrix[x][y]==token }
    }
    return -1 if tie?
    false
  end

  def tie?
    @board_matrix.each {|arr|
      return false if arr.any? { |e| e.class==Fixnum }
    }
  end


  def diagonal_win?(i)
    if i == 0
      return true if yield(i,i) && yield(i+1,i+1) && yield(i+2,i+2)
    elsif i == 2
      return true if yield(i-2,i) && yield(i-1,i-1) && yield(i,i-2)
    end
    false
  end

  def vertical_win?(i)
    return true if yield(i,i) && yield(i-1,i) && yield(i-2,i)
  end
  ########################################################

end
