
require 'pry'

require_relative 'boardcase'
require_relative 'player'
require_relative 'board'
require_relative 'show'



class Game
  attr_accessor :current_player, :status, :board, :players_array


  def initialize(name1, name2)
    player_1 = Player.new(name1, "X")
    player_2 = Player.new(name2, "O")
    @board = Board.new
    @status = "ongoing"
    @players_array = [player_1, player_2]
  end

  def turn
   Show.new.show_board(@board) # On affiche le plateau
    @current_player = @players_array[0] #On décide arbitrairement que le joueur 1 jouera en premier
    puts
    puts "#{@current_player.name}, sur quelle case voulez-vous jouer?" 
    puts ">"
    input = gets.chomp

      #On va déja vérifier que la commande rentrée est bien une case du tableau et que la case n'est pas déjà occupée;
      while (input != "a1" && input != "a2" && input != "a3" && input != "b1" && input != "b2" && input != "b3" && input != "c1" && input != "c2" && input != "c3") || @board.play_turn(@current_player, input) == false
      puts "Ceci n'est pas une commande valide ou alors cette case est déjà prise"
      puts "#{@current_player.name}, sur quelle case voulez-vous jouer?" 
      input = gets.chomp
    end

    #Si la commande correspond à une case vide, on l'exécute
    system "clear" #Cette ligne permet de "nettoyer" le terminal
    @board.play_turn(@current_player, input)


    Show.new.show_board(@board) # On remontre le jeu au joueur une fois qu'il a joué
    @status = @board.victory #On met à jour le statut du jeu comme ça on peut vérifier que le joueur 1 n'a pas gagné avant de laisser jouer le joueur 2

   
    if @status == "ongoing"  #On vérifie que le joueur 1 n' pas gagné avant de demander à l'autre joueur de jouer.
       @current_player = @players_array[1] # Si le joueur 1 n'a pas gagné, le tour passe au joueur 2
      puts
      puts "#{@current_player.name}, sur quelle case voulez-vous jouer?" 
      puts ">"
      input = gets.chomp


      #On va déja vérifier que la commande rentrée est bien une case du tableau et que la case n'est pas déjà occupée;
      while input != "a1" && input != "a2" && input != "a3" && input != "b1" && input != "b2" && input != "b3" && input != "c1" && input != "c2" && input != "c3" || @board.play_turn(@current_player, input) == false
        puts "Ceci n'est pas une commande valide ou alors cette case est déjà prise"
        puts "#{@current_player.name}, sur quelle case voulez-vous jouer?" 
        input = gets.chomp
      end
          
      #Si la commande correspond à une case vide, on l'exécute
      system "clear"
      @board.play_turn(@current_player, input)


      @status = @board.victory #Ça met à jour le statut du jeu pour que la boucle while dans application.rb puisse détecter s'il est fini
    end
  end
    

  def new_round 
    @board = Board.new
    @status = "ongoing"
  end

  def game_end
    @status = @board.victory  #On va rechercher ce que nous donne cette fonction de la classe Board
    if @status == "X" || @status == "O"
      system "clear"
      puts "                                Fin de partie !!!" 
      puts "-" * 80
      Show.new.show_board(@board)
      puts
      puts "Bravo #{@current_player.name}, tu remportes ce round" #Vu la façon dont ça se déroule, c'est Current_player qui gagne.
    elsif @status == "Match nul" 
      system "clear" 
      puts "                                Fin de partie !!!" 
      puts "-" * 80
      Show.new.show_board(@board) 
      puts
      puts "Pas de vainqueur, c'est un match nul"
    end
  end




end