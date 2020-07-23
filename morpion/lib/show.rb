

class Show

  #On relie les cases à l'attribut type des données du tableau que l'on a crée dans board

  def show_board(board)
  puts "        1     2     3                 " 
  puts "     " + "-" * 19
  puts " a   |  #{board.boardcase_array[0].type}  |  #{board.boardcase_array[1].type}  |  #{board.boardcase_array[2].type}  |"
  puts "     " + "-" * 19
  puts " b   |  #{board.boardcase_array[3].type}  |  #{board.boardcase_array[4].type}  |  #{board.boardcase_array[5].type}  |"
  puts "     " + "-" * 19
  puts " c   |  #{board.boardcase_array[6].type}  |  #{board.boardcase_array[7].type}  |  #{board.boardcase_array[8].type}  |"
  puts "     " +  "-" * 19
  end

end










