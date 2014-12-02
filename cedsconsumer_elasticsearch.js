var Kafka = require('kafka-node');

var zkclient = new Kafka.Client('localhost:2181');

console.log('preparing consumer');
var consumer = new Kafka.Consumer(zkclient, [{
    topic: 'sifcedsjson',
    offset: 0,
    partition: 1
}], {
    autoCommit: false
});

var elasticsearch = require('elasticsearch');
var elastic_client = new elasticsearch.Client({
    host: 'localhost:9200',
    log: 'trace'
});
var id = 0;

var spawn = require('child_process').spawn;

var schools = [];
var lastschool_idx = -1;
var start_indexing = false;
var msgcount = -1;


var offset = new Kafka.Offset(zkclient).fetch([{
    topic: 'sifcedsjson',
    partition: 1,
    time: -1
}], function(err, data) {
    /* get the last message available as of start of message reading loop */
    lastschool_idx = data.sifcedsjson['1'];
    //console.log(data);
    console.log("OFFSET " + lastschool_idx + " (" + schools.length + ")");
    if (!start_indexing && msgcount+1 == lastschool_idx) {
        s.push(null);
	console.log("END INPUT");
    }
});

var stream = require('stream');
var s = new stream.Readable();
s._read = function noop() {};

var jsonsp  = require('jsonsp');
var parser = new jsonsp.Parser();
var ws = new stream.Writable();
ws._write = function(chunk, encoding, done) {
    parser.parse(chunk.toString('utf8'));
    done();
};

var es = require('event-stream');
var jq_core = spawn('jq', ['-f', 'filter.schoolinfo.core.jq'], {
    stdin: 'pipe'
});
var jq_rename = spawn('jq', ['-f', 'ceds_rename_objectfields.jq'], {
    stdin: 'pipe'
});
s.pipe(es.child(jq_core)).pipe(es.child(jq_rename)).pipe(ws);
//s.pipe(ws);


consumer.on('message', function(message) {
var crud = message.value.substr(0, message.value.indexOf("\n"));
if (crud != "CREATE") return;
var body = message.value.substr(message.value.indexOf("\n") + 1);
//console.log(body);
s.push(body);
msgcount++;
if (!start_indexing && msgcount+1 == lastschool_idx) {
    s.push(null);
	console.log("END INPUT");
}
});

parser.on('object', function(data) {
    schools.push(data);
console.log(JSON.stringify(data));
});

ws.on("finish", function(){ index(); });



function same_schools(school_ids, schools) {
    /* If have already matched at least one of the schools, reject */
    var j;
    for(j=0; j < school_ids.length; j++){
      if(schools[school_ids[j]].hasOwnProperty("uniqueid"))
	return false;
    }
    
    var city = schools[school_ids[0]]["CITY"];
    for (j = 1; j < school_ids.length; j++) {
        if (schools[school_ids[j]]["CITY"] != city)
            return false;
    }
    return true;
}

function index() {
    console.log("INDEXING");
    var ccmf = require('./ccmftext');
    var textmod = ccmf.ccmfText.create({
        stopWords: ['to', 'that', 'a', 'for', 'the', 'that', 'have', 'it', 'is', 'school', 'high', 'secondary', 'primary', 'college', 'campus', 'inc'],
        shinglesLen: 2,
        n: 24,
        bands: 12
    });
    var i, j, uniqueid = 1,
        schoolnames = [];
    for (i = 0; i < schools.length; i++) {
        schoolnames[i] = schools[i]["NAME OF INSTITUTION"] + " " + schools[i]["CITY"];
    }
    console.log(schools);

    var matched = 0, unmatched = 0;

    var reg = textmod.register(schoolnames);
    var pairs = textmod.pairs(reg);

pairs.sort(function(a, b){ return b.length - a.length; });

    var j,k;



    for (i = 0; i < pairs.length; i++) {

/* add all combinations of pairs */
	var paircombinations = [];
	if(pairs[i].length == 2)
		paircombinations = [ pairs[i] ];	
	else if(pairs[i].length > 20)  
		/* too many combinations, useless to go through */
		paircombinations = [ pairs[i] ];	
	else
		paircombinations = combinations(pairs[i]).sort(function(a, b){ return b.length - a.length; });

//console.log(paircombinations);

	for(k=0; k< paircombinations.length; k++) {
        if (same_schools(paircombinations[k], schools)) {
console.log("MATCH: " + paircombinations[k]);
            for (j = 0; j < paircombinations[k].length; j++) {
console.log("   " + schools[paircombinations[k][j]]["NAME OF INSTITUTION"] + " " + schools[paircombinations[k][j]]["CITY"]);
                schools[paircombinations[k][j]].uniqueid = uniqueid;
		matched++;
            }
            uniqueid++;
        }}
    }

    for (i = 0; i < schools.length; i++) {

        var json = schools[i];

        if (!json.uniqueid) {
            json.uniqueid = uniqueid++;
console.log("NO MATCH: " + json["NAME OF INSTITUTION"] + " " + json["CITY"]);
		unmatched++;
	}
        var payload = {
            index: 'schools',
            type: 'school_transaction',
            id: i,
            timestamp: json.timestamp,
            body: json
        };

        console.log(payload);

        elastic_client.create(payload , function(error, response){});

    }
console.log("Matched: " + matched + ", Unmatched: " + unmatched);
}

/* https://gist.github.com/axelpale/3118596 */

function k_combinations(set, k) {
	var i, j, combs, head, tailcombs;
	
	if (k > set.length || k <= 0) {
		return [];
	}
	
	if (k == set.length) {
		return [set];
	}
	
	if (k == 1) {
		combs = [];
		for (i = 0; i < set.length; i++) {
			combs.push([set[i]]);
		}
		return combs;
	}
	
	// Assert {1 < k < set.length}
	
	combs = [];
	for (i = 0; i < set.length - k + 1; i++) {
		head = set.slice(i, i+1);
		tailcombs = k_combinations(set.slice(i + 1), k - 1);
		for (j = 0; j < tailcombs.length; j++) {
			combs.push(head.concat(tailcombs[j]));
		}
	}
	return combs;
}
 
 
/**
 * Combinations
 * 
 * Get all possible combinations of elements in a set.
 * 
 * Usage:
 *   combinations(set)
 * 
 * Examples:
 * 
 *   combinations([1, 2, 3])
 *   -> [[1],[2],[3],[1,2],[1,3],[2,3],[1,2,3]]
 * 
 *   combinations([1])
 *   -> [[1]]
 */
function combinations(set) {
	var k, i, combs, k_combs;
	combs = [];
	
	// Calculate all non-empty k-combinations
	for (k = 2; k <= set.length; k++) {
		k_combs = k_combinations(set, k);
//console.log(k_combs);
		for (i = 0; i < k_combs.length; i++) {
			combs.push(k_combs[i]);
		}
//console.log("   "+combs.length+" :: " +k+", " +set.length);
	}
	return combs;
}
