Création d'intervalle -> remplacement de la donnée par cette intervalle
Plus k est élevé, plus les garanties de confidentialités sont élevées

## k-anonymat
Regrouper chaque individu avec au moins **k** autres individus.

* #Individualisation : il ne devrait plus être possible d'isoler un individu au sein d'un groupe de k utilisateurs.
* #Corrélation : limité *mais* il reste possible de relier les enregistrements par groupe. La probabilité que 2 enregistrements correspondent aux mêmes pseudo-identifiants est de *1/k* (plutôt élevé).
* #Inférence : N'empêche **pas** les attaques par inférence.

### Échecs

| id  | Age   | Rhume |
| --- | ----- | ----- |
| 1   | 10-20 | Oui   |
| 2   | 10-20 | Non   |
| 3   | 20-30 | Oui   |
| 4   | 20-30 | Oui   |
| 5   | 20-30 | Oui   |
| 6   | 20-30 | Non   |
| 7   | 20-30 | Oui   |
* Si on prend n'importe quel individu de 20-30 ans, on peut affirmer avec une grande probabilité qu'il a un rhume.
* Si on prend a une personne qui a entre 20-30 ans et qui n'a pas de rhume, on retrouvera qui il est. 


## l-diversité
Veille à ce que dans chaque classe, chaque attribut ait au moins **l** valeurs différentes.
-> fais en sorte qu'un attaquant reste toujours dans un degré d'incertitude

Ne reste pas très efficace si les les attributs sont distribués de manière inégale.

## t-proximité
Vise à créer des classes d'équivalence qui ressemblent à la distribution initiale.

* #Individualisation :  Empêche l'individualisation
* #Corrélation : Même situation au'avec seulement le k-anonymat -> proba que 2 entrées soient le meme individu > 1/N (N : Nombre de personnes dans la base de données)
* #Inférence : Il n'est plus possible de faire des attaques par inférence avec un degré de certitude de *100%*