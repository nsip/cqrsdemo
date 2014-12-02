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
var jsonhuman = require('./json.human.js-master/src/json.human.js');


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
    res.sendFile('/Users/nickn/Documents/Arbeit/cqrs2/sif1.html');
});

var ret = {output:"", pretty:""};

var stream = require('stream');
var s = new stream.Readable();
s._read = function noop() {};

var ws = new stream.Writable();
ws._write = function(chunk, encoding, done) {
parser.parse(chunk.toString('utf8'));
done();
}

var es = require('event-stream');

var spawn = require('child_process').spawn;
var jq_flatten = spawn('jq', ['-f', 'ceds_flatten.jq'], { stdin: 'pipe' });
var jq_rename = spawn('jq', ['-f', 'ceds_rename.jq'], { stdin: 'pipe' });


var jsonsp  = require('jsonsp');
var parser  = new jsonsp.Parser();
var recordcount = 0;
 parser.on('object', function(data){

console.log(data[0].CEDS[1]);

ret.output += "<br/>\n" + JSON.stringify(data, null, 2).replace(/  /g, '&nbsp;&nbsp;').replace(/\n/g, '<br/>\n') + "<br/><br/>\n";
                        ret.pretty += jsonhuman(data).outerHTML;
ret.count = ++recordcount;

});

s.pipe(es.child(jq_flatten)).pipe(es.child(jq_rename)).pipe(ws);


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



var server = http.createServer(app);
app.post('/myaction', urlencodedParser, function(req, res) {
    if (ret.output) {
        res.send(ret);
        ret.output = "";
        ret.pretty = "";
    }
});


server.listen(10001, function() {
    console.log('Server running at http://127.0.0.1:10001/');
});
