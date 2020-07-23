require_relative 'game'

class Application

  def perform
     

      puts "-" * 80
      puts "                                    Bonjour"
      puts
      puts "                     Bienvenue sur ce jeu original et distrayant"
      puts "-" * 80
      puts
      puts "                              Appuyez sur entrée"
      gets.chomp
      puts "Quel est le nom du premier compétiteur?"
      puts ">"
      challenger_1 = gets.chomp
      puts "Quel est le nom du second compétiteur?"
      puts ">"
      challenger_2 = gets.chomp
      game = Game.new(challenger_1, challenger_2) #On utilise les deux prénoms pour créer un nouveau jeu
     loop do #Cela permet de faire une boucle infinie. Cela ne s'arrêtera que si l'on écrit "break"
        system "clear"
        puts "                          Que le meilleur gagne!!!"
        puts "-" * 80
        puts 
        while game.status == "ongoing" #Pour vérifier que le second joueur n'a pas gagné. (On test pour le premier dans la fonction turn)
          game.turn
        end #Quand le statut du jeu n'est plus ongoing, on sort de la boucle
        game.game_end
        puts
        puts "Voulez-vous faire une nouvelle partie?"
        puts "Tapez 'oui' ou 'non'"
        ng = gets.chomp
        if ng == "non"
          system "clear"
          puts "Adieu, alors. Tu me manqueras"
          break #On arrête le jeu si la personne veut partir
        elsif ng == "oui"
          game.new_round
        else
          system "clear"
          puts "Je n'ai pas compris mais j'imagine que vous voulez rejouer car ce jeu est formidable"
          game.new_round  
        end
      end  
      

  end



end


