
require 'pry'

require_relative 'boardcase'
require_relative 'player'

class Board
  attr_accessor :boardcase_array, :count_turn

  def initialize
    
    @boardcase_array = []
    @count_turn = 0

     @boardcase_array[0] = BoardCase.new("a1", " ")
     @boardcase_array[1] = BoardCase.new("a2", " ")
     @boardcase_array[2] = BoardCase.new("a3", " ")
     @boardcase_array[3] = BoardCase.new("b1", " ")
     @boardcase_array[4] = BoardCase.new("b2", " ")
     @boardcase_array[5] = BoardCase.new("b3", " ")
     @boardcase_array[6] = BoardCase.new("c1", " ")
     @boardcase_array[7] = BoardCase.new("c2", " ")
     @boardcase_array[8] = BoardCase.new("c3", " ")
    
  end    


  def play_turn(player, input)  #Cette fonction va mettre une croix ou un rond sur la case
   
    @boardcase_array.each do |boardcase| #On fait toutes les cases jusqu'à tomber sur celle qui correspond au voeu du joueur
     
      if boardcase.position == input && boardcase.type != " "
       return false
      
      elsif boardcase.position == input && boardcase.type == " " # On fait chaque case, on attende de tomber à celle qui correspond à celle que le joueur a entré et on vérifie qu'elle est vide
        boardcase.type = player.pawn_type
        @count_turn = @count_turn + 1
        puts "Vous venez de mettre #{boardcase.type} sur la case #{boardcase.position}"
        return true
     

      end
    end
    
    
  end



    

  

  def victory #On teste toutes les combinaisons pour savoir si un joueur a gagné

    #On teste les combinaisons du joueur 1
      if @boardcase_array[0].type == "X"  && @boardcase_array[1].type == "X" && @boardcase_array[2].type == "X"
        return "X"
      elsif @boardcase_array[3].type == "X"  && @boardcase_array[4].type == "X" && @boardcase_array[5].type == "X"
        return "X"
      elsif @boardcase_array[6].type == "X"  && @boardcase_array[7].type == "X" && @boardcase_array[8].type == "X"
        return "X"  
      elsif @boardcase_array[0].type == "X"  && @boardcase_array[3].type == "X" && @boardcase_array[6].type == "X"
        return "X"
      elsif @boardcase_array[1].type == "X"  && @boardcase_array[4].type == "X" && @boardcase_array[7].type == "X"
        return "X"
      elsif @boardcase_array[2].type == "X"  && @boardcase_array[5].type == "X" && @boardcase_array[8].type == "X"
        return "X"
      elsif @boardcase_array[0].type == "X"  && @boardcase_array[4].type == "X" && @boardcase_array[8].type == "X"
        return "X"
      elsif @boardcase_array[2].type == "X"  && @boardcase_array[4].type == "X" && @boardcase_array[6].type == "X"
        return "X"

    #On test les combinaisons du joueur 2
      elsif @boardcase_array[0].type == "O"  && @boardcase_array[1].type == "O" && @boardcase_array[2].type == "O"
          return "O"
      elsif @boardcase_array[3].type == "O"  && @boardcase_array[4].type == "O" && @boardcase_array[5].type == "O"
        return "O"
      elsif @boardcase_array[6].type == "O"  && @boardcase_array[7].type == "O" && @boardcase_array[8].type == "O"
        return "O"
      elsif @boardcase_array[0].type == "O"  && @boardcase_array[3].type == "O" && @boardcase_array[6].type == "O"
        return "O"
      elsif @boardcase_array[1].type == "O"  && @boardcase_array[4].type == "O" && @boardcase_array[7].type == "O"
        return "O"
      elsif @boardcase_array[2].type == "O"  && @boardcase_array[5].type == "O" && @boardcase_array[8].type == "O"
        return "O"
      elsif @boardcase_array[0].type == "O"  && @boardcase_array[4].type == "O" && @boardcase_array[8].type == "O"
        return "O"
      elsif @boardcase_array[2].type == "O"  && @boardcase_array[4].type == "O" && @boardcase_array[6].type == "O"
        return "O"

      elsif @count_turn == 9
        return "Match nul"  

      else
        return "ongoing"
      end
    end
      
    


  
   
        
  

  

  



  #binding.pry



end

