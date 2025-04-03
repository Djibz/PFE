# Journal de bord

## 21/03
- Recherche sur l'observabilité et les métriques
	- OpenTelemetry (dans l'appli, norme) -> Prometheus (BDD) -> Grafana (Affichage - Dashboard)
	- https://les-tilleuls.coop/blog/observer-votre-application-symfony-en-toute-simplicite-avec-opentelemetry-partie-1
	- https://packagist.org/packages/open-telemetry/opentelemetry-auto-doctrine
- Récupération de toutes les ressources de l'ANS avec script python

## 24/03
- [Franken 1.3](https://les-tilleuls.coop/blog/frankenphp-1-3-ameliorations-de-performance-mode-watcher-metriques-prometheus-et-bien-plus#nouvelles-mtriques-prometheus) Fonctionnalités intéressantes
- **1.3** : 54% de requêtes traitées par le worker par rapport à 1.2 -> **1.4** : 13% de requêtes traitées par rapport à 1.3
- Métriques Prometheus natives par le worker Caddy https://caddyserver.com/docs/metrics
	- [Métriques natives Franken](https://les-tilleuls.coop/blog/frankenphp-1-3-ameliorations-de-performance-mode-watcher-metriques-prometheus-et-bien-plus#nouvelles-mtriques-prometheus)
- L'update du skeleton symfony-docker (frankenphp - symfony) fonctionne bien
- eXist-db : Utilise une API REST -> facile à implémenter -> moins bonnes perfs ?
- BaseX -> [Client PHP](https://github.com/BaseXdb/basex/tree/main/basex-api/src/main/php) -> il existe aussi des composants sur packagist
- [Ranking bdd XML](https://db-engines.com/en/ranking/native+xml+dbms)
- [Video symfony UX & Sylius](https://www.youtube.com/watch?v=VgtygyxbdyM) -> interfaces faciles à implémenter
- Mercure : natif à FrankenPHP et simple à utiliser https://frankenphp.dev/fr/docs/mercure/
- EarlyHints natifs à Symfony https://symfony.com/doc/current/controller.html#sending-early-hints
- R6 Version Normative -> Janvier 2026

## 25/03
- MongoDB
	- Pas d'outil pour bulk import de beaucoup de documents (quelques millions)
		- Il aurait peut etre été plus judicieux de tout exporter dans un unique fichier
	- Requêtes très verbeuses
	- Il ne semble pas possible de requêter sur la dernière version directement
		- aggregation & stages mongos ont l'air horribles et ne semblent pas pouvoir faire ce que l'on souhaite
	- [Index seulement sur les valeurs directement](https://www.mongodb.com/docs/manual/core/indexes/index-types/index-single/create-embedded-object-index/)
	- Index partiel (condition d'indexations)
		- Très utile pour gagner de l'espace
		- Besoin de spécifier en plus la condition dans la requête qui correspond a la condition d'indexation
```json
{
  resourceType: "PractitionerRole",
  "extension.url": "https://annuaire.sante.gouv.fr/fhir/StructureDefinition/PractitionerRole-Name",
  extension: {
    $elemMatch: {
      url: "https://annuaire.sante.gouv.fr/fhir/StructureDefinition/PractitionerRole-Name",
			"valueHumanName.given": ['ERWAN']
    }
  }
}
```

- [Helm Chart native à API Platform](https://api-platform.com/docs/deployment/kubernetes/)
- Optimiser perfs frankenPHP https://frankenphp.dev/fr/docs/performance/
	- Redirige vers beaucoup de liens intéressants pour PHP

## 26/03
- Points tuleap
	- Début création de toutes les features, US et tasks
- Point avec Rudy
	- S'occupe de presque toute l'intégration et déploiement continu
	- FHIR Warehouse peut être pilote SonarQube
	- Utilisation d'openshift
- FHIR Paging
	- Pas de trace de [103 Early Hints](developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status/103)
	- Intégrité des paginations https://build.fhir.org/http.html#continuity
- Subscription : impossible de mettre `\_include` (il faut de nouveau requeter l'endpoint)

## 27/03
- Clé composite possible avec doctrine
- Import MongoDB
	- 5.8M fichiers `.json` -> Rust : conversion en 1 `.tsv` : ~15min
	- mongoimport `.tsv` : ~10min (en même temps que le peuplement itératif)
- US toutes définies pour l'API elle même
- Il est possible d'utiliser les early hints dans le code php
	- HttpClient -> utilisation de onHeader
- [Message chat FHIR - Early Hint](https://chat.fhir.org/#narrow/channel/179166-implementers/topic/Early.20Hints)
- Toutes les users story créées

## 28/03
- 103 Early hints ne semble pas très adapté à FHIR

## 31/03
- phpcs
	- Squiz.Strings.DoublelQuoteUsage
- Avec Flo : Bien découper le code
	- Un monorepo qui peut etre split
	- Chaque produit peut etre un ensemble de modules
- **FHIR-CORE** : fluent setters : renvoyer *static*

## 01/04
- API FHIR RPPS
	- **Date début v2 : Avril 2025** (changement de l'info la veille)
	- fin v1 : fin 2025