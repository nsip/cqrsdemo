#CQRS demo

Nick Nicholas, [NSIP](http://www.dev.nsip.edu.au/) nick.nicholas@nsip.edu.au

Code used in presentation of CQRS demo, November 2014

The code sets up an [Apache Kafka queue](http://kafka.apache.org/) with topic `sifxml` for 
[SchoolInfo](http://specification.sifassociation.org/Implementation/AU/1.3/html/SIFAU.html#obj:SchoolInfo) 
records in [SIF/XML](https://www.sifassociation.org/) (`xmlproducer.js`). 
It then generates a second Kafka queue, `sifcedsjson`, converting the first queue
into JSON objects, with [CEDS](https://ceds.ed.gov/) identifiers injected (`xmlconsumer.js`)

This second queue is then directed into three different applications:

* Filtering of SIF objects for sensitive elements, replicating the functionality of the [privacy demo](https://github.com/nsip/privacydemo) (`cedsconsumer_filter.js, filter.hi.jq, filter.mid.jq, filter.lo.jq, remove_cedsId.jq`)
* Flattening of the SIF structure into CEDS key-value pairs (`cedsconsumer_flatten.js, ceds_flatten.jq, ceds_rename.jq`)
* Deduplicating schools (using [MinHash](https://en.wikipedia.org/wiki/MinHash) on the name and city), and feeding schools 
into Elastic Search (`cedsconsumer_elasticsearch.js, filter.schoolinfo.core.jq, ceds_rename_objectfields.jq`)

The filters manipulating the JSON objects are in [jq](http://stedolan.github.io/jq/), and 
presuppose [SIF-AU 1.3](http://specification.sifassociation.org/Implementation/AU/1.3/html/) for the XML to be filtered.

#KAFKA QUEUES

The input SIF/XML objects for Kafka topic `sifxml`  are in the file `payloads1.txt`, and comprise of all the schools 
in Australia that have changed names 
between 2013 and 2014 in the [MySchool](http://www.myschool.edu.au/) data collection by [ACARA](http://www.acara.edu.au/). 
Records are delimited by double carriage return. To 
convert this into a Task-Based UI, each record is prefixed by a command as header -- in this instance, simply the CRUD command "CREATE".
(The UI commands are kept naive for this demo.)

The `sifcedsjson` Kafka topic has the same CRUD commands, but their payload is in JSON with CEDS identifiers. The SIF/XML
is converted to JSON using the Goessner mapping (`goessner.js`), and a jq filter to inject CEDS identifiers (`schoolinfo.jq`).
This functionality is replicated from the [privacy demo](https://github.com/nsip/privacydemo).

#MINHASH

The ``cedsconsumer_elasticsearch.js` script uses an implementation of MinHash to deduplicate schools; if any two schools are
identified as being the same, they are both assigned the same identifier (`uniqueid`), otherwise they are assigned separate
identifiers. The MinHash comparison uses a concatenation of the school name and city.

The MinHash comparison treats the following words as stopwords and ignores them in school names:
```
'to', 'that', 'a', 'for', 'the', 'that', 'have', 'it', 'is', 'school', 'high', 'secondary', 'primary', 'college', 'campus', 'inc'
```

The comparison is quite lenient (so it has a small risk of overmatching): it uses 24 hashes, and bands of 2 hashes each for 
a successful hash. Candidate tuples of schools identified in this way are considered duplicates if they are in the same city. 

The comparison allows any combination of schools identified to be tested for identity, from n=2 to n=15. (At n=15, the combinatorial
explosion of combinations makes testing too time consuming.) Including the city name in the input to MinHash ensures that such
combinatorial explosions are averted for Catholic schools, which are notorious for multiple recurrences of the same saints' names.

This is a demonstration of automated deduplication, and is no substitute for properly managing identities of schools, staff, or students.
Schools whose names have completely changed, or which have relocated to another city, will not be detected. (Some 30 schools out of the
150 pairs in the demo data were not matched, mostly because the name had changed; no schools had changed city.)


#REQUIREMENTS

* [Apache Kafka (including Zookeeper)](http://kafka.apache.org/)
* [jq](http://stedolan.github.io/jq/)
* [ElasticSearch](http://www.elasticsearch.org/)
* [node.js](http://nodejs.org/)

* Zookeeper runs on port 2181 (edit in `zookeeper.properties, xmlproducer.js, xmlconsumer.js`)
* Kafka runs on port 9092  (edit in `server.properties`)
* Schools are indexed to the ElasticSearch index `schools`

#ISSUES

Refer also to the issues in the [privacy demo](https://github.com/nsip/privacydemo)


#RUNNING

Change the path to `sif.html` in `cedsconsumer_filter.js` to your absolute path:
```
    res.sendFile('/Users/nickn/Documents/Arbeit/cqrs2/sif.html');
```
Change the path to `sif1.html` in `cedsconsumer_flatten.js` to your absolute path:
```
    res.sendFile('/Users/nickn/Documents/Arbeit/cqrs2/sif1.html');
```

Start up Kafka (your Kafka installation location may vary):
```
/usr/local/opt/kafka/bin/zookeeper-server-start.sh ./zookeeper.properties &
/usr/local/opt/kafka/bin/kafka-server-start.sh ./server.properties &
```

Create the `sifxml` and `sifcedsjson` Kafka topics:
```
/usr/local/opt/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 2 --topic sifxml
/usr/local/opt/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 2 --topic sifcedsjson
```

Start up ElasticSearch (your ElasticSearch installation location may vary; you may also use a front end tool such as 
[Kibana](http://www.elasticsearch.org/overview/kibana/)):
```
bin/elasticsearch --cluster.name MINI_ASL --node.name MINI_ASL_1
```

Populate the `sifxml` Kafka topic (from `payloads1.txt`)
```
node xmlproducer.js
```

Populate the `sifcedsjson` Kafka topic
```
node xmlconsumer.js
```

Consume `sifcedsjson` Kafka topic for filtering sensitive data. Results can be viewed on http://127.0.0.1:10000
```
node cedsconsumer_filter.js
```

Results can be viewed on http://127.0.0.1:10000

Consume `sifcedsjson` Kafka topic for deduplication and insertion into ElasticSearch:
```
node cedsconsumer_elasticsearch.js
```



#CLEANUP

To delete the index in ElasticSearch (while ElasticSearch is still running):
```
curl -XDELETE 'http://localhost:9200/schools/'
```

To kill Kafka (on OSX, your Unix flavour of `ps` may vary):
```
ps -ef | grep zookeeper.properties | grep -v grep | awk '{print $2}'|xargs kill -9
ps -ef | grep server.properties | grep -v grep | awk '{print $2}'|xargs kill -9
```

To clear out the Kafka topics (after Kafka has been killed):
```
rm -r /tmp/kafka-logs
rm -r /tmp/zookeeper
```


#ACKNOWLEDGEMENTS

goessner.js is licensed under Creative Commons GNU LGPL License, from Stefan Goessner: http://goessner.net/download/prj/jsonxml/

hilitor.js is by Ger Hobbelt: https://github.com/GerHobbelt/hilitor

json.human.js is licensed under the MIT open source license, from Mariano Guerra: https://github.com/marianoguerra/json.human.js

ccmf: Creative Commons Media-Fingerprint Library (which has been customised for this project as `ccmftext.js, ccmfhash.js`) is licensed under the
MIT open source licence, by Lim Zhi Hao (Ethan Lim): https://github.com/ethanlim/ccmf


#DEPENDENCIES

Install jq on the command line: https://github.com/stedolan/jq (or ```brew install jq```)

Install node.js

Install all the requisite node.js modules:
```
npm install xmldom
npm install express
npm install body-parser
npm install method-override
npm install pretty-data
npm install kafka-node
npm install elasticsearch
npm install event-stream
npm install crel
npm install yajl [see note]
npm install jsonsp

```

Note: ```jsonsp```, the JSON stream parser, depends on ```node-yajl``` (Yet Another JSON Library). The node.js implementation of
```node-yajl``` is old enough that its installer uses the obsolete command ```node-waf```, which has been superseded by ```node-gyp```.
So you will need to install ```node-yajl``` manually, before installing ```jsonsp```

```
(Download [node-yajl](https://github.com/vibornoff/node-yajl))
node-gyp configure build
node ./test.js
npm install .
```

