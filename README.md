# repositoire_morpion_thp_poo


Ceci est un programme en Ruby écrit en peer-programming avec Laurent Saives.

Il permet à deux joueurs de s'affronter au morpion.

Pour l'éxécuter, il suffit de se placer sur le dossier racine avec le termminal et d'exécuter ruby morpion.rb

Le programme comporte 6 classes:

4 classes qui correspondent à des objets qu'on va manipuler pour faire tourner le jeu :

Game : c'est le jeu. Elle initialise tout, lance une partie (qui se termine avec une victoire ou un nul), permet de jouer un tour, de chercher si la partie est finie, etc.
Player : ce sont les joueurs. Il doit y avoir 2 instances de cette classe lors d'une partie.
Board : c'est le plateau. Il doit y avoir une instance de cette classe lors d'une partie.
BoardCase : c'est une case. Il devrait y avoir 9 instances de cette classe lors d'une partie.




2 classes vont nous permettre d'organiser le programme :

Application : cette classe va nous permettre de lancer le jeu. Elle va faire une boucle infinie de parties (on joue tant que les joueurs veulent continuer) et lancer l'instanciation d'un Game.
Show : cette classe sera une sorte de view. Elle affichera l'état du plateau de jeu à un instant T.


Pour sortir du programme, attendre la fin de la partie et rentrer 'non' à la question posée.
