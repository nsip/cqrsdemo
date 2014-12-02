var goessner = require('./goessner');
var Kafka = require('kafka-node');
var zkclient = new Kafka.Client('localhost:2181');
var consumer = new Kafka.Consumer(zkclient, [{topic: 'sifxml', offset: 0, partition: 1}], {autoCommit: false});
var producer = new Kafka.Producer(zkclient);

var spawn = require('child_process').spawn;

/* jq: child process; input: stream; callback */
function run_jq(jq, input, callback) {
    var data;
    input.pipe(jq.stdin);
    data = '';
    jq.stdout.on("data", function(x) {
        data += x;
    });
    jq.on("close", function(code) {
        //console.log(data);
        return callback(data);
    });
}


producer.on('ready', function() {
consumer.on('message', function(message){
	var crud = message.value.substr(0, message.value.indexOf("\n"));
	var body = message.value.substr(message.value.indexOf("\n")+1);
        var dom = goessner.parseXml(body);
	var json = goessner.xml2json(dom, '\t');

     var payload = {topic: 'sifcedsjson', partition: 1 };


	    var stream = require('stream');
            var s = new stream.Readable();
            s._read = function noop() {};
            s.push(json);
            s.push(null);

console.log(json);
	var jq1 = spawn('jq', ['-f', 'schoolinfo.jq'], { stdin: 'pipe' });
	run_jq(jq1, s, function(data) {
	        payload.messages = [crud + "\n" + data];
       		var payloads = [payload];
console.log(payloads);
	        producer.send(payloads,function(err, data){ /*console.log(err ? err : data);*/});
});

            });
});
