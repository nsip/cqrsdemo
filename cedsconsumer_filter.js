var Kafka = require('kafka-node');
var zkclient = new Kafka.Client('localhost:2181');
var consumer = new Kafka.Consumer(zkclient, [{
    topic: 'sifcedsjson',
    offset: 0,
    partition: 1
}], {
    autoCommit: false
});
var prettydata = require('pretty-data');
var goessner = require('./goessner');

var express = require('express');
var http = require('http');
var app = express();
app.use(express.static(__dirname));

var bodyParser = require('body-parser');
var methodOverride = require('method-override');

app.use(bodyParser.json());
app.use(methodOverride('X-HTTP-Method-Override'));

var urlencodedParser = bodyParser.urlencoded({
    extended: false
});


app.get('/', function(req, res) {
    res.sendFile('/Users/nickn/Documents/Arbeit/cqrs2/sif.html');
});

var ret = {
    output: ""
};


var stream = require('stream');
var s = new stream.Readable();
s._read = function noop() {};

var ws = new stream.Writable();
ws._write = function(chunk, encoding, done) {
parser.parse(chunk.toString('utf8'));
done();
/*
    var xml = prettydata.pd.xml(goessner.json2xml(chunk, '\t'));
    ret.output += "<br/>\n" + xml.replace(/  /g, '&nbsp;&nbsp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/\n/g, '<br/>') + "<br/><br/>\n";
    ret.pretty = '';
*/
}

var es = require('event-stream');

var spawn = require('child_process').spawn;
var jq_hi = spawn('jq', ['-f', 'filter.hi.jq'], {
    stdin: 'pipe'
});
var jq_mid = spawn('jq', ['-f', 'filter.mid.jq'], {
    stdin: 'pipe'
});
var jq_lo = spawn('jq', ['-f', 'filter.lo.jq'], {
    stdin: 'pipe'
});
var jq3 = spawn('jq', ['-f', 'remove_cedsId.jq'], {
    stdin: 'pipe'
});
/*
s.pipe(jq_hi.stdin);
jq_hi.stdout.pipe(jq_mid.stdin);
jq_mid.stdout.pipe(jq_lo.stdin);
jq_lo.stdout.pipe(jq3.stdin);
*/
var jsonsp  = require('jsonsp');
var parser  = new jsonsp.Parser();
var recordcount=0;
 parser.on('object', function(chunk){
    var xml = prettydata.pd.xml(goessner.json2xml(chunk, '\t'));
    ret.output += "<br/>\n" + xml.replace(/  /g, '&nbsp;&nbsp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/\n/g, '<br/>') + "<br/><br/>\n";
    ret.pretty = '';
    ret.count = ++recordcount;
});

s.pipe(es.child(jq_hi)).pipe(es.child(jq_mid)).pipe(es.child(jq_lo)).pipe(es.child(jq3)).pipe(ws);
//s.pipe(es.split()).pipe(es.child(jq_hi)).pipe(es.child(jq_mid)).pipe(es.child(jq_lo)).pipe(es.child(jq3)).pipe(ws);
//s.pipe(es.split()).pipe(es.child(jq_hi)).pipe(es.child(jq_mid)).pipe(es.child(jq_lo)).pipe(es.child(jq3));


var msgcount = -1;
var lastschool_idx = -1;
var offset = new Kafka.Offset(zkclient).fetch([{
    topic: 'sifcedsjson',
    partition: 1,
    time: -1
}], function(err, data) {
    /* get the last message available as of start of message reading loop */
//console.log("OFFSET INPUT");
    lastschool_idx = data.sifcedsjson['1'];
//console.log(msgcount + " " + lastschool_idx);
    if (msgcount+1 == lastschool_idx) {
	s.push(null);
console.log("CLOSED INPUT");
	}
});

consumer.on('message', function(message) {
    var crud = message.value.substr(0, message.value.indexOf("\n"));
    var body = message.value.substr(message.value.indexOf("\n") + 1);

    s.push(body);
//console.log(msgcount + " " + lastschool_idx);
    msgcount++;
    if (msgcount+1 == lastschool_idx) {
		s.push(null);
console.log("CLOSED INPUT");
}
});

jq_hi.on("end", function(){console.log("END INPUT")});
jq_hi.on("close", function(){console.log("CLOSE INPUT")});
jq_hi.on("data", function(err, data){console.log(data)});
ws.on("finish", function(){console.log("CLOSE INPUT 2")});

var server = http.createServer(app);
app.post('/myaction', urlencodedParser, function(req, res) {
    if (ret.output) {
        res.send(ret);
        ret = {};
    }
});


server.listen(10000, function() {
    console.log('Server running at http://127.0.0.1:10000/');
});
