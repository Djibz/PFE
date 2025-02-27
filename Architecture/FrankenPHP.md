HTTP3 **✓**
## Version image FrankenPHP :

`dunglas/frankenphp:<version-franken>-php<version-php>-<distro>`

* Versions peuvent être major, minor ou patch
* distro : `alpine` ou `bookworm` (la version Debian est un peu plus lourde mais plus rapide)

J'utilise php 8.4, bookworm et franken 1.4.2 (1.4.3 sorti ce mardi soir mais cassée)

## Dockerfile
Ajout de la commande `RUN git config --global --add safe.directory /app`
Sinon les commandes symfony font un warning lié à git.

## Users
Utilisateurs Linux avec l'image Docker

L'utilisateur dans l'image est `root`, sinon il ne peut pas écrire dans ./var/cache
Besoin d'exécuter cette commande sous linux : `docker compose run --rm php chown -R $(id -u):$(id -g) .`

## Couplage BDD
Le healthcheck ne marche pas sur toutes les images mariadb
https://mariadb.com/kb/en/using-healthcheck-sh/

Le healthcheck est nécessaire car le conteneur php fail s'il n'arrive pas à se connecter à la BDD

resolution : https://github.com/MariaDB/mariadb-docker/issues/557#issuecomment-2600314913 GA veut dire stable (https://mariadb.com/kb/en/release-notes/)
-> il faut une version mariadb stable
(la version mariadb utilisée dans le xs-skeleton n'est pas stable)

Le nom de la BDD doit être fournit dans `DATABASE_URL` et cette base de donnée doit être déjà présente, sinon le conteneur ne se lance pas (le conteneur démarre automatiquement symfony, qui a besoin de se connecter à la BDD, sinon fail)

## Dépendances Composer
`phpmetrics/phpmetrics` utilise des dépendances trop basses (nikic) -> phpunit ne peut pas aller au dessus de 10
	-> j'ai remove phpmetrics pour mettre phpunit 12

`openxtrem/oas-generator` : pas dispo pour php 8.4
`openxtrem/cache` : pas dispo pour 8.4 mais a utilisé 2.0.4 (qui a besoin de php ^8.1)

## PhpUnit
Symfony/flex créé un phpunit.xml.dist obsolete

Après recherches -> aucune des [recipes symfony](https://github.com/symfony/recipes) n'est à jour à ce niveau là :
* [symfony/phpunit-bridge](https://github.com/symfony/recipes/blob/05995d373497fe263b3fa87f35526cbd6dc73218/symfony/phpunit-bridge/6.3/phpunit.xml.dist)
* [phpunit/phpunit](https://github.com/symfony/recipes/blob/05995d373497fe263b3fa87f35526cbd6dc73218/phpunit/phpunit/9.6/phpunit.xml.dist)
