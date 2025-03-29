# Questions

- Mise en place du repo
- Protection branche main
- Images docker :
	- Droit d'hébergement des images
	- Faut il héberger l'image de dev ?
- Quels jobs mettre en place
	- SonarQube
- Déploiement continu
	- openshift - reviewapp
	- Quelles technos mettre en place (k8s)
	- Utilisation de l'image de build ?
		- Génération lorsqu'il y a un tag ?
- FHIR Core 8.3 -> mettre en 8.4 ? (pas encore php8.4 avec xs php)
- Plusieurs configs BDD différentes -> comment faire ?


# Recap
- Repo en place (maintainer)
- Image de dev build en local
- SonarQube : en cours de R&D (peut etre fhir warehouse pilote ?)
- Rudy s'occupe de :
	- Amorcer les jobs pour les TU et PHPSTAN
	- Le déploiement continu (openshift, ...)