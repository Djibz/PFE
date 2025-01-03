
## Avantages OX
* Gestion des utilisateurs
* EAI
	* Acteurs
	* Sources
	* Permission CRUD sur chaque ressource
* Framework Front - *Pas une priorité pour l'entrepôt*
* Modules
* Configuration
* Surcouche cache
* Surcouche RabbitMQ
* Surchouche ORM *Pas adapté*
* Métriques
* AppDeploy
* Travaux déjà entamés
	* Entrepôt fonctionnel
	* Module FHIR


## Inconvénients OX
* ORM pas très adapté
	* MariaDB uniquement
* Projet lourd - *un problème ?*
* Système de versions

## Avantages from-scratch
* Léger
* Service indépendant
	* Version de l'app (stratégie de releases)
	* Process de dev
	* Intégration continue -> pipelines plus légères et moins fréquentes des 2 côtés
	* Déploiement
		* Plus simple (CD) <-> On sait déployer OxPlatform
	* Choix des technos
		* (FrankenPHP)
		* Versions (dernieres versions symfony)
		* BDD (exotiques ou non)
	* ORM adapté

## Inconvénients from-scratch
* Gestion utilisateurs à refaire *avec Symfony*
* EAI non présent
	* Acteurs
	* Sources
	* Permission CRUD
* Configurations uniquement ENV
* Pas de surcouche
	* Cache
	* RabbitMQ
* *Pas AppDeploy*

|                   | **OxPlatform**                                                                                                                                                                                                                                                                                                                                                                            | **From-Scratch**                                                                                                                                                                                                                                                                                                                                                                                            |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Avantages**     | - Gestion des utilisateurs<br>- EAI<br>	- Acteurs<br>	- Sources<br>	- Permission CRUD sur chaque ressource<br>- Framework Front - *Pas une priorité pour l'entrepôt*<br>- Modules<br>- Configuration<br>- Surcouche cache<br>- Surcouche RabbitMQ<br>- Surchouche ORM *Pas adapté*<br>- Métriques<br>- *AppDeploy*<br>- Travaux déjà entamés<br>	- Entrepôt fonctionnel<br>	- Module FHIR | - Léger<br>- Service indépendant<br>	- Version de l'app (stratégie de releases)<br>	- Process de dev<br>	- Intégration continue -> pipelines plus légères et moins fréquentes des 2 côtés<br>	- Déploiement<br>		- Plus simple (CD) <-> On sait déployer OxPlatform<br>	- Choix des technos<br>		- (FrankenPHP)<br>		- Versions (dernieres versions symfony)<br>		- BDD (exotiques ou non)<br>	- ORM adapté |
| **Inconvénients** | - ORM pas très adapté<br>	- MariaDB uniquement<br>- Projet lourd - *un problème ?*<br>- Système de versions                                                                                                                                                                                                                                                                               | - Gestion utilisateurs à refaire *avec Symfony*<br>- EAI non présent<br>	- Acteurs<br>	- Sources<br>	- Permission CRUD<br>- Configurations uniquement ENV<br>- Pas de surcouche<br>	- Cache<br>	- RabbitMQ<br>- *Pas AppDeploy*                                                                                                                                                                             |
