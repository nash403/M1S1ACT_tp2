# TP2 ACT
## Honoré NINTUNZE et Antoine PETIT
TP "diviser pour régner"

Pour compiler le programme avoir ghc puis faire :
make
Pour nettoyer le répertoire : 
make clean

Pour exécuter le programme :
./skyline <chemin du fichier contenant les immeubles>

/!\ Le chemin ne doit avoir qu'un seul point : celui de l'extension (non gestion de ./ et ../)
Le fichier contenant les immeubles doit être bien formé

Pour lancer un test :
make test

/!\ le programme doit avoir été compilé au préalable avec la commande "make"

## Réponses aux questions
###Question 1

* (2, 0)(2, 5)(4, 4)(4, 7)(5, 7)(5, 0) n'est pas une ligne de toit
* (2, 0)(2, 5)(4, 5)(4, 7)(5, 7)(5, 0) est une ligne de toit
* (2, 0)(2, 5)(4, 5)(4, 7)5, 7)(6, 7)(5, 0) n'est pas une ligne de toit
* (2, 0)(2, 5)(4, 5)(4, 8)(4, 7)(5, 7)(5, 0) n'est pas une ligne de toit

###Question 2
Il faut que sur deux point successifs on ait une abscisse ou une ordonnée commune et il faut que l'abscisse soit croissante dans l'ordre des points.

###Question 4
La complexité de l'algorithme est en n^2.

Comme désavantage on a le fait que la taille de la donnée est en n^2. Ensuite, il manquera des points significatifs pour la ligne de toit ce qui demandera un second parcours pour les rajouter.

###Question 5
On peut voir un immeuble comme une ligne de toit à 2 points, ainsi l'insertion consiste à transformer l'immeuble en ligne de toit puis de fusionner cette ligne de toit à la ligne de toit existante.

Pour l'algorithme de fusion voir les commentaires dans le code de la fonction "realMS" dans le fichier "skyline.hs" (ligne 24)

### Questions 6 & 7

Le code se trouve dans le fichier "skyline.hs"