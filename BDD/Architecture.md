Certains SearchParameters sont complexes
-> besoin de trouver la valeur via FHIRPath (dans le programme, pas la BDD)
	-> Transformation en JSONPath ?!

* Key/value + index tables
* Standard table + index tables
* Full Nosql documents (1 table)
	* https://www.mongodb.com/docs/manual/core/transactions/
* BJSON (postgres) (moteur de conversion FHIRPath -> PJSONPath)
	* https://medium.com/@yurexus/can-postgresql-with-its-jsonb-column-type-replace-mongodb-30dc7feffaf3
	* https://medicalsoftway.sharepoint.com/:w:/r/sites/OXInterop/_layouts/15/doc2.aspx?sourcedoc=%7BDCE69034-F819-4BBC-B5DA-100AB51D2282%7D&file=Analyse%20Moteur%20Stockage.docx&action=default&mobileredirect=true
* Tables nodes (XML) (énormément de jointures)