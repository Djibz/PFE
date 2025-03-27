Besoin de m'occuper de la distribution / réplication ?
## Base de données K/V
https://www.dragonflydb.io/guides/key-value-databases
! Besoin d'une stratégie pour history

### LevelDB
### RocksDB
### TiKV
BDD K/V  **CNCF Gratuated**
Wrap pour protocole Redis ou MySQL
#### TiDB
Protocole MySQL

### Redis
Fork -> KeyDB (Snapchat)
php-redis-om

### Dynamo
License propriétaire
### Riak
https://riak.com/products/riak-kv/
Utilise HTTP
Système distribué
Utilise LevelDB
Besoin de `set` pour FHIR history

Resource types -> resource -> version
`Patient` ,`1234`,`1`

Resourcetypes/resource -> version
`Patient/1234`,`1`

### InfluxDB
### ScyllaDB
https://www.scylladb.com/open-source-nosql-database/
Tres bien vendu
Distribué
Wide column

**history :**
https://www.scylladb.com/tech-talk/key-key-value-store-generic-nosql-datastore-with-tombstone-reduction-and-automatic-partition-splitting/

## R-DBMS
Simple table relationnelle ?
`Resource(Type, Id, Version, Value)`
### PostgreSQL
Tables clés valeur HSTORE
