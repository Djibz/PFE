Outil Microsoft non complet (aggregations, permutations)

Difficultés :

**Garder la structure de la ressource**
Contre exemple :

```xml
<Patient>
	<name>
		<given value="a"/>
	</name>
	<name>
		<given value="b"/>
	</name>
</Patient>
```

```xml
<Patient>
	<name>
		<given value="a-anonymized"/>
		<given value="b-anonymized"/>
	</name>
</Patient>
```

Supprimer les éléments non voulus ?
	Passer partout, correspondance FHIRPath : peut marcher avec ID de l'instance de  l'objet
		'Resource.descendants()' -> DIFF
Spécifier dans ***AnonymizationOperation*** quand on supprime une valeur ? (risques d'oublis)


### Complexité & mémoire
r -> nombre ressources
n -> nombre règles
m -> taille ressource

Pour toutes resources :
	pour toutes regles :
			diff (m  - n) 

r x n


### Agrégation
*k* <- taille minimale des groupes
*n* <-nombre de datatypes
*max_g* <-⌊n / k⌋ - 1
trier les datatypes
pour chaque datatype *d* d'index *i*:
	*g* <- min(⌊i / k⌋, max_g) (numéro groupe)
	*min* <- datatypes[k * g] si g > 0 sinon -∞
	*max* <- datatypes[k * g + k - 1] si g < max_g sinon +∞
	affecter min et max au datatype
pour chaque datatype :
	supprimer les valeurs originales

**Alternative :**
Supprimer directement les valeurs et prendre leur minimum directement

**2 elements avec les memes valeurs peuvent se retrouver dans 2 groupes différents**


*k* <- taille minimale des groupes
*n* <- nombre de datatypes

*groupes* <- []
*g* <- 0
pour tout datatype *d*:
	si taille groupes[g] >= k && d != pred:
		*g* <- g+1
	ajouter d à groupe[g]
	*pred* <- d
pour tout groupe *gr*:
	*min* <- min(gr)
	*max* <- max(gr)
	pour tout datatype *d*:
		affecter min et max
		supprimer la valeur
O(n+n)
		