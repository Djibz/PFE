* Règle des 3U (Utile, Utilisable, Utilisée)
* Ne pas formater les documents
* [[Subscription]]
* [[Fréquence MaJ]]
* [[Cache serveur]]

## Code PHP - Bonnes pratiques

| **Bonne pratique Creedengo**                            | **Rule CodeSniffer**                               |
| ------------------------------------------------------- | -------------------------------------------------- |
| Utilisation de simple quote                             | `Squiz.Strings.DoublelQuoteUsage`                  |
| Pas de fonction dans la condition de boucle for + count | `Generic.CodeAnalysis.ForLoopWithTestFunctionCall` |
| ++i au lieu de i++                                      | `Squiz.Operators.IncrementDecrementUsage` ???      |
| Pas de requete SQL dans les boucles                     |                                                    |
| Ne pas utiliser les variables globales                  |                                                    |
| pas de try-catch avec une ouverture de fichier dedans   |                                                    |
| pas de SELECT \*                                        |                                                    |
| multiple if else                                        |                                                    |
|                                                         |                                                    |
