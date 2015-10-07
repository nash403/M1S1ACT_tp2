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
###Q1

* (2, 0)(2, 5)(4, 4)(4, 7)(5, 7)(5, 0) n'est pas une ligne de toit
* (2, 0)(2, 5)(4, 5)(4, 7)(5, 7)(5, 0) est une ligne de toit
* (2, 0)(2, 5)(4, 5)(4, 7)5, 7)(6, 7)(5, 0) n'est pas une ligne de toit
* (2, 0)(2, 5)(4, 5)(4, 8)(4, 7)(5, 7)(5, 0) n'est pas une ligne de toit

###Q2
Il faut que sur deux point successifs on ait une abscisse ou une ordonnée commune et il faut que l'abscisse soit croissante dans l'ordre des points.

###Q3

###Q4
