## Sommaire
### Primaires
- [[#read]]
- [[#Articulation requêtes FHIR <-> Symfony]]
- [[#Base]]
- [[#_lastUpdated]]
- [[#create]]
- [[#Data sync]]
- [[#Page d'accueil]]
### Secondaires
* [[#vread]]
* [[#SearchParameter]]
* [[#_total]]
* [[#Subscriber]]
* [[#history]]
* [[#Gestion des sources]]
* [[#Gestion des consommateurs de l'API]]
* [[#Métriques]]
* [[#Update des interfaces]]

## Micro-service
### Nouveau projet
- Franken PHP
- PHP - Dernière version (8.4)
- Symfony - Dernière version (7.2)
- Définition Coding Standard
	- PHPStan
- PHPUnit - Dernière version (12)
- FHIR-Core

### CI
* Nouveau projet Git
* Branche *main* protégée
* Releases par tag

### Déploiement
Gestion des images Docker :
* Registry Image
* Build et push des images directement par la pipeline (à la création de *tag*)
* Déploiement continu ?
* k8s ?


## API FHIR
* Création de l'API avec *Symfony*
* Endpoint : `fhir/`

### Articulation requêtes FHIR <-> Symfony
* Préparer la requête HTTP FHIR
	* Format souhaité
	* Type de ressource du contexte
	* Paramètres de la requête (query ou paramètres de body)
		* \_format
		* \_pretty
		* \_summary
		* \_elements
		* SearchParameters
	* Deserializarion resources de requêtes POST
* Préparer la réponse FHIR
	* Exception + *erreurs* : Réponse **OperationOutcome**
	* Serialization resource
		* format
		* pretty
		* summary
		* elements
	* Headers
		* [Date](https://www.hl7.org/fhir/R4/http.html#return)

## Paramètres
### Format
doc

## Operations
### read
https://www.hl7.org/fhir/R4/http.html#read
code 200
Appel au repository -> méthode `read` [[Service PHP#read]]
### vread
https://www.hl7.org/fhir/R4/http.html#vread
code 200
Appel au repository -> méthode `read` [[Service PHP#read]]

### create
https://www.hl7.org/fhir/R4/http.html#create
Appel au repository

### search

Appel au repository
#### Base
- https://www.hl7.org/fhir/R4/search.html
- [Pagination](https://hl7.org/fhir/R4/search.html#count)
- https://hl7.org/fhir/R4/search.html#revinclude
#### \_lastUpdated
https://hl7.org/fhir/R4/search.html#lastUpdated
#### SearchParameter
https://hl7.org/fhir/R4/searchparameter-registry.html
#### \_total
https://hl7.org/fhir/R4/search.html#total

### history
https://www.hl7.org/fhir/R4/http.html#history

## Page d'accueil
- Bouton connexion pour admins
- Status de l'API FHIR
- Status des MaJ (date de dernière maj pour chaque ressource FHIR)

## Interface administrateur
endpoint `amdin/`
Creuser [Symfony UX](https://ux.symfony.com/) + [video symfony UX & Sylius](https://www.youtube.com/watch?v=VgtygyxbdyM)
https://www.youtube.com/watch?v=VgtygyxbdyM

## Utilisateurs
Utilisateurs administrateurs, ayant accès à :
- [[#Data sync]]
- [[#Gestion des sources]]
- [[#Configurations serveur]]

## Gestion des consommateurs de l'API
Requiert un token pour utiliser l'API ?
- Token fournit par l'admin ?
- Token généré à la demande ?
- Pas de token ?
Log d'utilisateurs ?
Groupes et roles
permissions sur les ressources. Exemples :
- READ sur Practitioner
- CREATE sur Subscription

## Data sync
On veut pouvoir régulièrement mettre à jour nos ressources par rapport à l'API de l'Annuaire
- Tâches planifiées (https://symfony.com/doc/current/scheduler.html)
- Itération sur les bundles des réponses de l'API
- Mise à jour de la base à l'aide du repository
- Mécanisme pour garder à jour les ressources grâce à FHIR
	- https://www.hl7.org/fhir/R4/search.html#lastUpdated
	- BDD des meta des synchros
- Ecran de contrôle des mises à jours
	- Liste des sync
	- Créer / Supprimer des synchro
	- Démarrer / Arrêter des synchro
	- Etat des synchro (OK, KO, STOP)
Généralement on a une synchro par source et par type de ressource

## Gestion des sources
Gérer les sources pour les synchronisations
Une source peut avoir de multiples synchros, on éviter la redondance

## Configurations serveur
- Format de retour préféré
- Taille bundle
	- Taille préférées
	- Taille max

## Subscriber
FHIR définit une notion d'abonnement https://hl7.org/fhir/R4/subscription.html
Utiliser un système d'event listener avec Symfony https://symfony.com/doc/current/event_dispatcher.html

Méthode de validation d'un abonnement à élire :
- Création par l'administrateur
- Validation automatique avec logique
- Validation manuelle par l'administrateur

## Métriques
Métriques des charges du serveur, nombre requêtes, ....
https://les-tilleuls.coop/blog/observer-votre-application-symfony-en-toute-simplicite-avec-opentelemetry-partie-1
Métrique des synchronisations
Utilisation de Prometheus -> natif à frankenPHP
- métriques
- logs
- alertes

## Update des interfaces
Utilisation de Mercure pour mettre à jour les interfaces utilisateurs
(permet au serveur d'envoyer des infos aux clients sans qu'ils aient à en demander)
https://frankenphp.dev/fr/docs/mercure/


