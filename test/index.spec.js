var assert = require("assert"),
	sqlConnInfo = require("./fixtures/sql-conn-info"),
	noDbSchemaInit = require("../index"),
	noDbSchema
	;

describe("Testing noinfopath-dbschema", function(){
	it("should have initialized the module's initializers as a function", function() {
		assert(typeof(noDbSchemaInit) === "function");
	});

	it("should return a Promise object", function() {
		noDbSchema = noDbSchemaInit(sqlConnInfo);
		assert(typeof(noDbSchema) === "object");
	});

	it("should return a promise to return the schema.", function() {
		assert(typeof(noDbSchema.then) === "function");
		assert(typeof(noDbSchema.catch) === "function");
	});

	it("should return transformed schema from database as a hashtable.", function(done) {
		noDbSchema.then(function(transformed){
			assert(typeof(transformed) === "object");
			done();
		})
		.catch(function(err){
			done(err);
		});
	});
});
