var Kafka = require('kafka-node');

var Producer = Kafka.Producer;
var client = new Kafka.Client('localhost:2181');
var producer = new Producer(client);

var fs = require('fs');
var liner = require('./liner');
var source = fs.createReadStream('./payloads1.txt');
source.pipe(liner);
producer.on('ready', function() {
liner.on('readable', function () {
     var line;
     var payload = {topic: 'sifxml', partition: 1 };
     var message = "";
     var read_crud = false;
     var read_message = false;
     var crud = "";

/* The format of messages is:

{CREATE|UPDATE|DELETE}
<XML>
BLANK

File should end in the extra blank line
*/


     while (line = liner.read()) {
          if(line == "\n") { continue; }
        crud = line; 
        while (line = liner.read()) {
          message = message + line;
          if(line == "\n") {
		message = crud + message;
          	payload.messages = [message];
          	var payloads = [payload];
console.log(payloads);
          	producer.send(payloads,function(err, data){ /*console.log(err ? err : data);*/});
		message = "";
		break;
          }
     }}
})});

