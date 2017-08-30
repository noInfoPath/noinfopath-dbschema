var sqlClientInit = require("noinfopath-sql-client"),
	schemaConfig = {
		"entityName": "noinfopath_dbschema",
		"primaryKey": "id",
		"nsPrefix": "app",
	},
	sqlClient, schemaCRUD, noDbSchema = {};

function _transform(indata) {
	var noDbSchema = {};

	indata.forEach(function (table) {
		var noTable;
		if (!noDbSchema[table.TABLE_NAME]) {
			noDbSchema[table.TABLE_NAME] = {
				"entityName": table.TABLE_NAME,
				"entityType": table.TABLE_TYPE === "BASE TABLE" ? "T" : "V",
				"primaryKey": "",
				"foreignKeys": {},
				"columns": {}
			};
		}

		noTable = noDbSchema[table.TABLE_NAME];

		if (table.COLUMN_KEY === "PRI") {
			noTable.primaryKey = table.COLUMN_NAME;
		}

		noTable.columns[table.COLUMN_NAME] = {
			columnName: table.COLUMN_NAME,
			type: table.DATA_TYPE,
			length: table.CHARACTER_MAXIMUM_LENGTH,
			nullable: table.IS_NULLABLE === "YES"
		};

	});

	return Promise.resolve(noDbSchema);
}


module.exports = function (sqlConnInfo) {
	if (!sqlConnInfo) throw new Error("sqlConnInfo is a required parameter.")
	sqlClient = sqlClientInit("mysql", sqlConnInfo);
	schemaCRUD = sqlClient.wrapSchema(schemaConfig);

	return new Promise(function (resolve, reject) {
		schemaCRUD.read()
			.then(_transform)
			.then(resolve)
			.catch(function(err){
				reject(new Error("Failed to retrieve schema from database. Make sure the database is supported and has implemented the noinfopath-dbschema view."));
			});
	});
};
