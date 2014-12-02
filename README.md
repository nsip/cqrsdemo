#CQRS demo

Nick Nicholas, [NSIP](http://www.dev.nsip.edu.au/) nick.nicholas@nsip.edu.au

Code used in presentation of CQRS demo, November 2014

The code sets up an [Apache Kafka queue](http://kafka.apache.org/) with topic `sifxml` for 
[SchoolInfo](http://specification.sifassociation.org/Implementation/AU/1.3/html/SIFAU.html#obj:SchoolInfo) 
records in [SIF/XML](https://www.sifassociation.org/) (`xmlproducer.js`). 
It then generates a second Kafka queue, `sifcedsjson`, converting the first queue
into JSON objects, with [CEDS](https://ceds.ed.gov/) identifiers injected (`xmlconsumer.js`)

This second queue is then directed into three different applications:

* Filtering of SIF objects for sensitive elements, replicating the functionality of the [privacy demo](https://github.com/nsip/privacydemo) (`cedsconsumer_filter.js`)
* Flattening of the SIF structure into CEDS key-value pairs (`cedsconsumer_flatten.js`)
* Deduplicating schools and feeding them into Elastic Search (`cedsconsumer_elasticsearch.js`)

The filters manipulating the JSON objects are in [jq](http://stedolan.github.io/jq/), and 
presuppose [SIF-AU 1.3](http://specification.sifassociation.org/Implementation/AU/1.3/html/) for the XML to be filtered.

#KAFKA queues

The input SIF/XML objects for Kafka topic `sifxml`  are in the file `PAYLOADS.txt`, and comprise of all the schools 
in Australia that have changed names 
between 2013 and 2014 in the [MySchool](http://www.myschool.edu.au/) data collection by [ACARA](http://www.acara.edu.au/). 
Records are delimited by double carriage return. To 
convert this into a Task-Based UI, each record is prefixed by a command as header -- in this instance, simply the CRUD command "CREATE".
(The UI commands are kept naive for this demo.)

The `sifcedsjson` Kafka topic has the same CRUD commands, but their payload is in JSON with CEDS identifiers. The SIF/XML
is converted to JSON using the Goessner mapping (`goessner.js`), and a jq filter to inject CEDS identifiers (`schoolinfo.jq`).
This functionality is replicated from the [privacy demo](https://github.com/nsip/privacydemo).



#REQUIREMENTS

#RUNNING

#ACKNOWLEDGEMENTS

goessner.js is licensed under Creative Commons GNU LGPL License, from Stefan Goessner: http://goessner.net/download/prj/jsonxml/

hilitor.js is by Ger Hobbelt: https://github.com/GerHobbelt/hilitor

json.human.js is licensed under the MIT open source license, from Mariano Guerra: https://github.com/marianoguerra/json.human.js


#DEPENDENCIES
