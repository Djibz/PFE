https://www.cnil.fr/fr/technologies/lanonymisation-de-donnees-personnelles

***Une anonymisation se fait au cas par cas en fonction des données que l'on a.***

## Outils
* Microsoft Tool (manque d'outils)
* Outil PHP utilisant `fhir-core`

## Étapes
1. Définition des valeurs à traiter
2. Traitement des valeurs

### Définition des valeurs
[[Anonymiser une donnée]]
[Anonymization FHIR](https://ieeexplore.ieee.org/document/10479174)

![[Open data - Guide - Données anonymes en santé.pptx.pdf]]

Utilisation de `FHIRPath`.
Définir une méthode d'altération : [[Types d'altération]]

## Traitement des valeurs
Microsoft tool ? Traitements *trop basiques*.
Utilisation de `Openxtrem\Components\FHIRCore\FHIRPath` ?

### SQL-on-FHIR
Le traitement des données (notamment avec les techniques de généralisation semble bien plus efficace et facile à mettre en place avec une table plutôt qu'avec une liste d'objets)

* Format final ?
* Traitement des valeurs en SQL puis transformation en FHIR (FHIR -> SQL -> FHIR) ?

## Création d'un IG 
[Modèle de création](https://build.fhir.org/ig/FHIR/sample-ig/index.html)
[ig-builder](https://github.com/FHIR/auto-ig-builder/blob/master/README.md) (nécessite repo github)

***Anonymization-on-SQL-on-FHIR*** ? -> Entrepôt FHIR vers une table anonymisée
***Anonymization-on-FHIR*** ? -> Modèle d'instruction d'anonymisation

## Outil de mesure de confidentialité