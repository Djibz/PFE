## Suppression
## Ajout de bruit
## Pseudonymisation
*nécessaire* mais ne suffit clairement pas.
N'est pas une technique d'anonymisation.
* Chiffrement
* Hachage (avec ou sans sel)
* Hachage avec clé (supprimée ou non)
* Tokenization
Ne pas utiliser la même clé entre les différentes BDD pour pouvoir réduire la corrélation.
## Aléatoire
## Valeur par défaut
## Permutations
## Généralisation
* Baisser la granularité
	 *D'une ville à un pays*
* Créer des intervalles 
	 *Personnes de 10 à 20 ans*
[[Généralisation]]
### k-anonymat
Création de groupes d'au moins k individus.
* Attention à ne pas créer de quasi-identifiants (si une seule personne a une maladie rare dans le groupe)
* Avoir une variable k significative -> plus la valeur de k est élevée, plus les garanties  de confidentialités sont grandes
* Veiller à ce qu'aucun individu ne représente une fraction trop grande des entrées.
	 (de ce que je comprend : si dans le groupe des 10-30 ans une seule personne a le cancer)


| Technique                          | #Individualisation ? | #Corrélation ? | #Inférence ? |
| ---------------------------------- | -------------------- | -------------- | ------------ |
| **Pseudonimysation**               | Oui                  | Oui            | Oui          |
| **Bruit**                          | Oui                  | Peut-être      | Peut-être    |
| **Permutation**                    | Oui                  | Oui            | Peut-être    |
| **Agrégation (k-anonymat)**        | Non                  | Oui            | Oui          |
| **l-diversité**                    | Non                  | Oui            | Peut-être    |
| **Confidentialité différentielle** | Peut-être            | Peut-être      | Peut-être    |
| **Hachage / Tokenization**         | Oui                  | Oui            | Peut-être    |

