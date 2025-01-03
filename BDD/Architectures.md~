Certains SearchParameters sont complexes
-> besoin de trouver la valeur via FHIRPath (dans le programme, pas la BDD)
	-> Transformation en JSONPath ?!

* Key/value + index tables
* Standard table + index tables
* Full Nosql documents (1 table ou 1 table par type de ressource)
	* https://www.mongodb.com/docs/manual/core/transactions/
* BJSON (postgres) (moteur de conversion FHIRPath -> PJSONPath)
	* https://medium.com/@yurexus/can-postgresql-with-its-jsonb-column-type-replace-mongodb-30dc7feffaf3
	* https://medicalsoftway.sharepoint.com/:w:/r/sites/OXInterop/_layouts/15/doc2.aspx?sourcedoc=%7BDCE69034-F819-4BBC-B5DA-100AB51D2282%7D&file=Analyse%20Moteur%20Stockage.docx&action=default&mobileredirect=true
* Tables nodes (XML) (énormément de jointures)

# Ressources valides 

## Tables d'index
**Inconvénients :**
* Duplique la donnée
* Requêtes SQL complexes

**Avantages** : 
* Base de données relationnelles (persistance, transaction, ...)
* Indépendant du moteur de stockage

Une table resource et un paquet de tables d'index ***<->*** Une table et un paquet de table d'index *par type* de ressource

## Tables de ressources complexes
En NF²
**Inconvénients :**
* Besoin d'une transformation du FHIR Path (dépend du moteur de stockage)
	* A l'execution de la requête
	* Au préalable (pas d'ajout de SearchParam à chaud)
* Très dépendant du moteur de stockage
* Certains moteurs ne supportent pas transaction, persistence, ...

**Avantages** : 
* Pas de duplication de la donnée
* Rapide

```plantuml
@startuml
participant Server
box "Postgres Database" #LightBlue
database Registre
database "Resources Documents" as res
endbox
== Create ==
Server -> Registre: INSERT
Server -> res: INSERT
== Update ==
Server -> Registre: UPDATE
Server -> res: INSERT
== Read ==
Server -> Registre: Get by ID
activate Registre
Registre ->> res: JOIN
res -->> Registre: Document
Registre --> Server: Document
deactivate Registre
== Search ==
Server -> res: Search
activate res
res --> Server: Document
deactivate res
@enduml
```

## Articulations utilisation NoSQL

Nos ressources ne sont théoriquement jamais modifié, quand il y a modification, il y a une nouvelle version. Mécanisme porté par FHIR.

Sans modification, on peut se rapprocher des méthodes de stockages de type NoSQL et garder de la cohérence.


### Gestion de la version actuelle uniquement
Les documents sont modifiés à la volée, avec date de mis à jour

```plantuml
@startuml
participant Server
database "BD Doduments" as nosql
== Creation ==
Server -> nosql: INSERT
== Update ==
Server -> nosql: UPDATE Document
== Read & Search ==
Server -> nosql: GET Document 
nosql --> Server
@enduml
```

### Stockage de toutes les versions sans registre
On fait des operations pour ressortir uniquement les dernières versions

```plantuml
@startuml
participant Server
database "BD Doduments" as nosql
== Creation ==
Server -> nosql: INSERT
== Update ==
Server -> nosql: **INSERT** Document
== Read & Search ==
Server -> nosql: SEARCH Document on version = max(version)
nosql --> Server
@enduml
```

### Toutes les versions avec registre
* Toutes les versions sont enregistrée en NoSQL.
* Une table type relationnelle garde une ligne par resource avec metadata

```plantuml
@startuml
participant Server
database "Registre SQL" as registre
database "BD Doduments" as nosql
== Creation ==
Server -> nosql: INSERT
Server -> registre: INSERT Metadata
== Update ==
Server -> registre: UPDATE Metadata
Server -> nosql: **INSERT** Document
== Read ==
Server -> registre: get last version
registre --> Server: last version ID
Server -> nosql: GET document with ID
nosql --> Server
@enduml
```

### NoSQL Distribué
* Ressources actuelles BDD NoSQL Documents (MongoDB)
* Actuelles + historiques -> BDD NoSQL clé valeur

```plantuml
@startuml
participant Server
database "Registre SQL" as registre
database "BD Doduments" as nosql
database "BD K/V" as kv
== Creation ==
Server -> nosql: INSERT Document
Server -> registre: INSERT Metadata
Server -> kv: INSERT Document
== Update ==
Server -> registre: UPDATE Metadata
Server -> nosql: **UPDATE** Document
Server -> kv: INSERT Document
== Read ==
Server -> registre: get last version
registre --> Server: last version ID
Server -> kv: GET document with ID
kv --> Server
== Search ==
Server -> nosql: SEARCH
alt
    nosql --> Server: Document
else
    nosql --> Server: ID
    Server -> kv: GET by ID
    kv --> Server: Document
end
@enduml
```

# Ressources historiques
## En tant que ressource actuelle
Pas de stockage différent

## Table clé-valeur
Table avec insertion uniquement
**Clé** : (resource\_type, id, version)

historique + actuelle ?
