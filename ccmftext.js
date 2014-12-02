/*
 *      Creative Common's Media Fingerprint Library
 *      Copyright (c) 2013, Lim Zhi Hao (Ethan)
 *      All rights reserved.
 *      Redistribution and use in source and binary forms, with or without modification, 
 *      are permitted provided that the following conditions are met:
 *
 *      Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 *      Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 *      
 *      THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
 *      AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
 *      IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
 *      IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
 *      INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,  
 *      PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
 *      HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
 *      (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
 *      EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
 */

/*ccmf.namespace('ccmfText');*/

/**
 * The Text class.
 * @class Text
 */

var ccmf = {};

ccmfText = function () {
    'use strict';
};

exports.ccmfText = ccmfText;


/**
 * Text Object Constructor
 * @param none
 * @method create
 * @static
 * @constructor
 * @return {Object} The newly created vector.
 */
/* NN edited: allow parameter override */
ccmfText.create = function (options) {
    'use strict';
    var newObj = new ccmfText();
    if(options != null){
	if(options.stopWords != null) {newObj.stopWords = options.stopWords;}
	if(options.alphabets != null) {newObj.alphabets = options.alphabets;}
	if(options.bands != null) {newObj.bands = options.bands;}
	if(options.n != null) {newObj.n = options.n;}
	if(options.shinglesLen != null) {newObj.shinglesLen = options.shinglesLen;}
    }
    return newObj;
};

/**
 * The Text class prototype
 * @class Text
 */
ccmfText.prototype = {
    
    /**
     * The set of stop words that would be identified
     */
    stopWords : ['to','that','a','for','the','that','have','it','is'],
    alphabets : "abcdefghijklmnopqrstuvwxyz",
    bands : 20,
    n : 100,
    shinglesLen:9,

	
register: function(texts) {
	var searchTextShingles = null,
			searchShinglesFing = null,
			inputShinglesLen = this.shinglesLen,
			signature = [],
			minHashSignature = null;

var ret=[];
var text, i;
			signature = [];
for(i=0; i< texts.length; i++) {
	var searchTextShingles = null,
			searchShinglesFing = null,
			inputShinglesLen = this.shinglesLen,
			minHashSignature = null;

searchTextShingles = this.removedStopWordShingles(texts[i],inputShinglesLen);
		searchShinglesFing = this.shinglesFingerprintConv(searchTextShingles);

		signature.push ( searchShinglesFing);
console.log(texts[i] + " : " + this.minHashSignaturesGen([searchShinglesFing]));
}

		ret = this.minHashSignaturesGen(signature); 
return ret;
},

pairs: function(minHashSignatures) {
var r = this.LSH(minHashSignatures);
return this.candidateTuplesExtraction(r.buckets);
},




    
    /**
     *  Function that determines if word is a stop word
     *  @param {String} word - input word to be checked
     *  @method isStopWord
     *  @return {Bool} true/false 
     */
    isStopWord: function(word){
        'use strict';
        var i = 0,
        max = 0;
        
        for(i=0,max=this.stopWords.length;i<max;i+=1){
            if(word!=undefined&&(word.toLowerCase()===this.stopWords[i])){
                return true;
            }
        }
        return false;
    },
    
    /**
     * Remove the stop words within a textual content
     * @param {String} rawText - raw textual content
     * @method removeStopWords
     * @return {String} fliteredTextString - raw text without stop words 
     */
    removeStopWords: function(rawText){
        'use strict';
        var i = 0,
        max = 0,
        textArray = rawText.split(' '),
        fliteredTextString = '';
        
        for(i=0,max=textArray.length;i<max;i+=1){
            if(this.isStopWord(textArray[i])){
                textArray.splice(i,1);
            }
        }
        
        fliteredTextString = textArray.join(' ');
        
        return fliteredTextString;
    },
    
    /**
     * Extract the shingles based on the characters 
     * Methodology: extract overlapping k-grams and stemmed
     * ie. k=3, {abc,bcd,cde,...} from abcdefgh
     * Recommended for news articles k = 9 
     * @param {String} rawText - raw textual content without white spaces
     * @param {Number} k - length of shingles (substring)
     * @method fixedShinglesWithoutWS
     * @return {Array} shinglesSet - the set of shingles
     */
    fixedShinglesWithoutWS: function(rawText,k){
        'use strict';
        var textWithoutWS = rawText.replace(/\W/g, '').replace(/ /g,''),
        	shinglesSet = new Array(),
        	i,
        	max;
        for(i=0,max=textWithoutWS.length;i<max;i+=1){
            if(i+k-1<max){
                shinglesSet.push(textWithoutWS.substr(i,i+k-1));   
            }
        }
        return shinglesSet;
    },
    
    /**
     * Extract the shingles after removal of stop words
     * ie. k=3, {abc,bcd,cde,...} from abcdefgh
     * Just a wrapper for two functions : removeStopWords => fixedShinglesWithoutWS
     * @param rawText - raw textual content
     * @param k	- length of shingles
     * @method removedStopWordShingles
     * @return {Array} shinglesSet - the set of shingles
     */
    removedStopWordShingles: function(rawText,k){
        'use strict';
        /* After the removal of Stop Words, extract the shingles as usual*/
        var shinglesSet = this.fixedShinglesWithoutWS(this.removeStopWords(rawText),k);  
        return shinglesSet;
    },
    
    /**
     * Extract Shingles via two words after stop word 
     * @param {String} rawText - raw textual content
     * @method stopMoreShingles
     * @return {Array} shinglesSet - the set of shingles
     */
    stopMoreShingles: function(rawText){
        'use strict';
        /* Remove Non-Alpha Characters */
        var textArray = rawText.replace(/\W/g, '').split(' '),
        	shinglesSet=[],
        	i=0,
        	max=0;
        
        for(i=0,max=textArray.length;i<max;i++){
            
            if(this.isStopWord(textArray[i])){
            
                /* Take the next two words and skip them */
                if(i==max-1){
                    shinglesSet.push(textArray[i]);
                }else if(i+1==max-1){
                    shinglesSet.push(textArray[i]+' '+textArray[i+1]);
                }else{                              
                    shinglesSet.push(textArray[i]+' '+textArray[i+1]+' '+textArray[i+2]);
                }
            }
            
        }
        return shinglesSet;
    },
    
    /**
     * Hash Shingles to 32 bit integers
     * @param {Array} shinglesSet - set of shingles
     * @method shinglesFingerprintConv
     * @return {Array} shinglesFingerprint - set of 32 integers
     */
     shinglesFingerprintConv: function(shinglesSet){
    	 'use strict';
        
    	 var shinglesFingerprint = [],
    	 cur_shingle=0,
    	 hexHashString='',
    	 shinglesSetLen = 0,
    	 hash = 0;
       
    	var MD5 = require('./ccmfhash').MD5;
    	 /* Foreach shingles */
    	 for(cur_shingle=0,shinglesSetLen=shinglesSet.length;cur_shingle<shinglesSetLen;cur_shingle+=1){
           
    		 /* Extract the 1st 8 characters of the 128 bit hash (32 bits) */
    		 hexHashString = MD5.encode((shinglesSet[cur_shingle])).substr(0,8);
           
    		 /* Convert it to a 32 bit - 4 bytes integer */
    		 hash = parseInt(hexHashString,16);
           
    		 shinglesFingerprint.push(hash);
    	 }
	       
    	 return shinglesFingerprint;
     },
     
     /**
      *  Generate the minHash Signatures for any size of shingles fingerprint set
      *  @param {Array} shinglesFingSet - a variable set of shingles
      *  @method minHashSignaturesGen
      *  @return {Array} - SIG minhash signature matrix
      */
     minHashSignaturesGen: function(shinglesFingSet){
        'use strict';

        var infinity=1.7976931348623157E+10308,
            universal = 4294967296,
            numOfHashFn = this.n,
            SIG = [],                                  			//Signature Matrix
            hashFnArr = this.hashFnGen(numOfHashFn,universal),  //Generate n random hash function
            hashVal = [],
            c=0,
            i=0,
            r='',
            shingles = 0,
            hashFn = null,
            maxNumOfHashFn = 0,
            shinglesFingSetMax = 0,
            maxNumOfShingles = 0,
            LSHRowLen = 0;
           
        /* Construct the signature matrix */
        for(c=0,shinglesFingSetMax=shinglesFingSet.length;c<shinglesFingSetMax;c+=1){

            /* Initialise all SIC(i,c) to infinity */
            SIG[c] = [];

            /* Foreach column , set all rows to infinity*/
            for(i=0;i<numOfHashFn;i+=1){
                SIG[c].push(infinity); 
            }

            for(shingles=0,maxNumOfShingles=shinglesFingSet[c].length;shingles<maxNumOfShingles;shingles+=1){
                
                /* Obtain one element (4 bytes int) from universal set [Implied c has 1 in row r]
                 * The implication is because all element are a subset of the universal set     
                 */
                r = shinglesFingSet[c][shingles];

                /* Simulate the permutation of the rows     
                * Compute h1(r),h2(r),h3(r),.... 
                */
                hashVal = [];
                for(hashFn=0,maxNumOfHashFn=hashFnArr.length;hashFn<maxNumOfHashFn;hashFn+=1){
                    hashVal.push(hashFnArr[hashFn](r));
                }
                
                /* Both n and SIG[c].length are equal */
                for(i=0,LSHRowLen=SIG[c].length;i<LSHRowLen;i+=1){
                    if(hashVal[i] < SIG[c][i]){
                        SIG[c][i] = hashVal[i];
                    }
                }
            }   
        }
        
        return SIG;
     },
    
     /**
      * Random Hash Function Generator 
      * @param {Number} k - k is the number of random hash to generate
      * @param {Number} rowLen - row length determines the upper limit
      * @method hashFnGen
      * @return {Array} functionArray - an array of random hash functions
      */
     hashFnGen: function(k,rowLen){
    	 'use strict';
    	var MinHashFn = require('./ccmfhash').MinHashFn;
    	 /* Fixed Hash Function Generator - Always Generate a 100 Hash Fn */
         var functionArray =  MinHashFn.Generate();
    	 
         return functionArray;
         
         /* True Random Function Generator */
         
         /*
         var fnArr = new Array(), aRan = [],bRan =[];
         var min = 1;
         var max = rowLen-1;
            
         // This ensure that a and b are not reference of aRan and bRan 
         function createFn(a,b){
             return function(x){
                    
                    // Modulo by row length to fall within it 
                    var value = (a*x+b)%rowLen;
                  
                    return value;
             };
         };   
         
         for(var i=0;i<k;i++){
             
             // These are kept as reference inside the closure 
             aRan = Math.floor(Math.random() * (max - min + 1)) + min;  
             bRan = Math.floor(Math.random() * (max - min + 1)) + min;  
             
             fnArr.push(
                createFn(aRan,bRan)
             );
         }
         
         return fnArr;
         
         */
     },
     
     /**
      * Compare two shingles set
      * Methodology: Practical Method
      * @param shinglesFingA,shinglesFingB
      * @method compareTwoSignatures
      * @return percentage 
      */
     compareTwoSignaturesPractical: function(shinglesFingA,shinglesFingB){
         'use strict';
         
         var shinglesFing = [],
         h = 0,
         n = this.n,
         CollisionCount = 0,
         percentage = 0,
         SIG = null;
         
         shinglesFing[0] = shinglesFingA;
         shinglesFing[1]= shinglesFingB;
         
         SIG = this.minHashSignaturesGen(shinglesFing,n);
         
         /* Determine the ratio of the hash function of SIGA equals to SIGB */ 
         
         for(h=0;h<n;h++){
             if(SIG[0][h]===SIG[1][h]){
                 CollisionCount++;
             }
         }
         
         /* Determine the percentage of equal hash value over all the hash value*/
         percentage = CollisionCount/n*100;
         
         return percentage;
     },
     
     /**
      * Specialised Locality-Sensitive Hashing 
      * @param minHashSignature,band
      * @method LSH
      * @return candidatePairs array of candidate pairs
      */
     LSH : function(minHashSignature,realNumOfBands){
    	 'use strict';
         var    bucketsSize = 104729,
                numOfBands  = this.bands,
                buckets     = new Array(numOfBands),
                hashSet     = new Array(numOfBands),
                curBand     = null, 
                curSet      = null,
                vector      = null,
                row         = null,
                element     = null,
                hash        = null,
                r = 0,
                bucket      = null,
                results		= null;
         // r => num of rows per band
         r = Math.floor(minHashSignature[0].length/numOfBands);
         
         for(curBand=0;curBand<numOfBands;curBand++){
             
                /* New Buckets for each band */
                buckets[curBand] = new Array(bucketsSize);
                hashSet[curBand] = [];
                
                for(bucket=0;bucket<bucketsSize;bucket++){
                    buckets[curBand][bucket]=[];
                }
              
                /* For each minhash signature set */
                for(curSet=0;curSet<minHashSignature.length;curSet++){
                    /* Rows within a single band in one signature */
                    vector = [];

                    for(row=(curBand*(r-1)+curBand);row<(curBand*(r-1)+curBand+r);row++){

                        element = minHashSignature[curSet][row];

                        vector.push(element);
                    }

                    hash = this.LSHHashingFn(vector,bucketsSize);

                    /* Hash this into the current band buckets*/
                    buckets[curBand][hash].push(curSet);
                    /* Also record this hash for the current band  for this set*/
                    hashSet[curBand].push(hash);
                }
         }
         
         results = {
            buckets : buckets,
            hashSet : hashSet
         };
         
         return results;
     },
     
     /**
      * Extract the candidate pairs from all buckets
      * @param {Array} buckets
      * @returns {Array} candidate pairs
      */
     candididatePairsExtraction:function(buckets){
    	 'use strict';
    	 var numOfCandidates = 0,
    	 curBand = 0,
    	 idx = 0,
    	 elems = 0,
    	 combi = null,
    	 insertedCP = null,
    	 candidatePairs = [];
         
         for(curBand=0;curBand<this.bands;curBand++){
            
            for(idx=0;idx<buckets[curBand].length;idx++){

                if(typeof buckets[curBand][idx]!=="undefined" && buckets[curBand][idx].length>1){
                    
                    /* There is one or more pairs in this bucket */
                    
                    /* Extract the pairs */
                    
                	elems = buckets[curBand][idx];
                    
                    combi = this.k_combinations(elems,2);
                    
                    while(combi.length>0){
                        
                        insertedCP = combi.pop();
                        
                        if(!this.candidateExist(candidatePairs,elems))
                             candidatePairs.push(insertedCP);        
                    }
                    
                    numOfCandidates++;
                }
            }
         }
         
         return candidatePairs;	 
     },

/* NN as above, but not pairs, leave sets alone */
candidateTuplesExtraction:function(buckets){
    	 'use strict';
    	 var numOfCandidates = 0,
    	 curBand = 0,
    	 idx = 0,
    	 elems = 0,
    	 combi = null,
    	 insertedCP = null,
    	 candidatePairs = [];
         
         for(curBand=0;curBand<this.bands;curBand++){
            
            for(idx=0;idx<buckets[curBand].length;idx++){

                if(typeof buckets[curBand][idx]!=="undefined" && buckets[curBand][idx].length>1){
                    
                    /* There is one or more pairs in this bucket */
                    
                    /* Extract the pairs */
                    
                	elems = buckets[curBand][idx];
			if(elems.length > 1)
                    
                       if(candidatePairs.indexOf(elems) == -1)
                        {
                             candidatePairs.push(elems);        
                    
                    numOfCandidates++;
	}
                }
            }
         }
     var uniq = function uniqBy(a, key) {
    var seen = {};
    return a.filter(function(item) {
        var k = key(item);
        return seen.hasOwnProperty(k) ? false : (seen[k] = true);
    })
};
    
         return uniq(candidatePairs, JSON.stringify);
     },

     
     /**
      * Hash each vector of each bands into an unsigned integer
      * @param {Array} vector
      * @param {Number} bucketsSize
      * @returns {Number} hash
      */
     LSHHashingFn : function(vector,bucketsSize){
    	 'use strict';
         var hash = 0,
         pts = 0,
         sum = 0;
         
         for(pts=0;pts<vector.length;pts++){
             
             sum += Math.pow(vector[pts],pts);
         }
         
         hash = sum%bucketsSize;
         
         return hash;
     },
     
     /**
      * Find the combinations within characters
      * @param {Array} set	- The set of characters
      * @param {Number} k
      * @returns {Array} combs - All combinations
      */
     k_combinations: function (set, k) {
    	'use strict';
        var i = 0, 
        j = 0, 
        combs = '', 
        head = '', 
        tailcombs = '';
        
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
        
        combs = [];
        for (i = 0; i < set.length - k + 1; i++) {
        	head = set.slice(i, i+1);
        	tailcombs = this.k_combinations(set.slice(i + 1), k - 1);
        	for (j = 0; j < tailcombs.length; j++) {
        		combs.push(head.concat(tailcombs[j]));
        	}
        }
        return combs;
    },
    
    /**
     * If candidate pairs exist in a given set of candidates
     * @param {Array} candidateList
     * @param {Array} potentialCandidate
     * @returns {Boolean} 
     */
     candidateExist : function(candidateList,potentialCandidate){
     
    	 var can = 0;
    	 
    	 for(can=0;can<candidateList.length;can++){
           
           arr = candidateList[can];
           
           if(arr[0]===potentialCandidate[0]&&arr[1]===potentialCandidate[1]){
               return true;
           }
           
        }
        
        return false;
    },


/**
         * Perform lsh and store their signatures 
         * @param minHashSignatures
         * @param callback - Optional 
         * @param metadata - Addition information about the document
         */
        storeLsh : function(minHashSignatures,callback,metadata){
        	'use strict';
        	var 
        		results = null,
        		bandRef = this.rootRef.child('bands'),
        		userRef = this.rootRef.child('users'),
        		authorRef = null,
        		curBandRef = null,
        		curBand = null,
        		set = null,
        		storedInfo = null,
        		escapedEmail = null;
        	
        	/* Parameters Extraction */
        	if(callback==undefined){
				callback = function(error) {
					if (error) {
					    console.log('Data could not be saved.' + error);
					  } else {
					    console.log('Data saved successfully.');
					  }
				};
			}
        	
        	/* Obtain the Vector Hashes */
        	results = LSH(minHashSignatures);
        	
        	for(set=0;set<minHashSignatures.length;set++){
        		
        		if(metadata==undefined){
            		metadata = null;
            	}else{
            		/* Store the work into the author */
            		escapedEmail = this.escapeEmail(metadata['author']['email']);
            		authorRef = userRef.child(escapedEmail);
            		authorRef.child('works').push(JSON.stringify(minHashSignatures[set])); //Register Artist Works
            		
            		userRef.child(escapedEmail).once('value', function(ss) {

            		    if(ss.val() === null ) { 
            		    	/* author does not exist */ 
            		    	callback(true);
            		    	throw new Error("storeLSH: author is not registered");
            		    }else { 
            		    	/* author exists */ 
            		    	// TODO: Can't place Register Author works here after Author identity has been verified
            		    	
            		    	for(curBand=0;curBand<bands;curBand++){
            	        		for(set=0;set<minHashSignatures.length;set++){
            	        			
            	        			curBandRef = bandRef.child(curBand);
            	        			
            	        			/* Stored Data Structure */
            	        			storedInfo = new Object();
            	        			storedInfo['sig'] = minHashSignatures[set];
            	        			storedInfo['metadata'] = metadata;
            	        			
            	        			curBandRef.child(results['hashSet'][curBand][set]).push(JSON.stringify(storedInfo),callback);
            	        		}
            	        	}
            		    }
            		});
            	}
        	}
        },
        
        /**
         * Conduct lsh of a single minhash signature and perform searching at Firebase
         * @param minHashSignatures
         * @param resultCallback - the callback that is invoke the results of the most likely candidates
         */
        conductLsh : function(minHashSignatures,resultCallback){
        	'use strict';
        	
        	this.init();
        	var 
    		results = null,
    		bandRef = this.rootRef.child('bands'),
    		curBandRef = null,
    		curBand = null,
            bucketRef = null,
    		set = null,
    		noOfReturnsCount=0,
    		foundSets=[],
    		setsSimilarToGiven=[],
    		foundSetsInBand=null;
        	
            /* Obtain the vector hashes */
        	results = textMod.LSH(minHashSignatures);
        	
        	for(curBand=0;curBand<textMod.bands;curBand++){
        		
        		for(set=0;set<minHashSignatures.length;set++){
        			
        			curBandRef = bandRef.child(curBand);
                                
                    bucketRef = curBandRef.child(results['hashSet'][curBand][set]);
        		
        			bucketRef.once('value',
        				function(snapshot){
        				
	        				noOfReturnsCount+=1;
	        				
	        				/*
	        				 * Get each band's result 
	        				 * may be 1 or more signatures 
	        				 */
	        				if(snapshot.val()!=null){
	        					
	        					var rawResult = snapshot.val(),
	        						keys = Object.keys(rawResult),
	        						key = null,
	        						jsonResult=[];
	        					
	        					/*
	        					 *  There maybe more then 1 signatures returned on each band (similar to the sent signatures)
	        					 */
	        					for(key=0;key<keys.length;key++){
	        						
	        						var jsonString = rawResult[keys[key]],
	        							jsonObj = JSON.parse(jsonString);
	        						
	        						jsonResult.push(jsonObj);
	        						
	        						//Determine if signature should be in most similar candidate list (signatures not encountered before)
	        						if(setsSimilarToGiven.indexOf(jsonString)==-1){
	        							setsSimilarToGiven.push(jsonString);
	        						}
	        					}
	        					
	        					/* Encap all sets found within a band */
	        					foundSetsInBand = {
	        							'ref':snapshot.ref().toString(),
	        							'json':jsonResult,
	        							'raw':snapshot.val()
	        					};
	        					
	        					foundSets.push(foundSetsInBand);
	        				}
	        				
	        				//Only when all bands have return then compile the full results of most likely candidate
	        				if(noOfReturnsCount==textMod.bands){
	        					
	        					var fullResult = {
	        						'count':setsSimilarToGiven.length,
	        						'sets' :setsSimilarToGiven,
	        						'raw'  :foundSets
	        					};
	        					
	        					resultCallback(fullResult);
	        				}
        			});
        		}
        	}
        },
        
        
        /**
         * Deleted all lsh records based on the minhash signatures
         * @param minHashSignatures
         * @param metadata - Addition information about the document
         * TODO: Currently only support one minhash at a time
         */
        deleteLsh : function(minHashSignatures,metadata){
        	'use strict';
        	
        	this.init();
        	var textMod = ccmf.Text.create(),
        	results = null,
        	bandRef = this.rootRef.child('bands'),
    		userRef = this.rootRef.child('users'),
    		curBandRef = null,
    		curBand = null,
            bucketRef = null,
    		set = null,
    		bucketsCallback = function(snapshot){
        		
    			/* Search through each band */
    			if(snapshot.val()!=null){ 
    				/* If found in current band */
    				var foundSignatureSets = snapshot.val(),
    				keys = Object.keys(foundSignatureSets),
    				key = null;
    				
    				// Remove every signatures that meets the current minhash signature in the bucket
    				for(key=0;key<keys.length;key++){
    					var signatureInfo = JSON.parse(foundSignatureSets[keys[key]]);
    					
    					if(arrayCompare(signatureInfo['sig'],minHashSignatures[0]))
    						//Only remove signatures in the bucket that match the minhash signature completely
    						snapshot.child(keys[key]).ref().remove();
    				}
    				
    				authorRef.child('works').once('value',authorsCallback); //Register Artist Works
    			}
        	},
        	authorsCallback = function(snapshot){
        		        		
    			if(snapshot.val()!=null){ 
    				var foundSignatureSets = snapshot.val(),
    				keys = Object.keys(foundSignatureSets),
    				key = null;
    				
    				// Remove every signatures that meets the current minhash signature in the author's work
    				for(key=0;key<keys.length;key++){
    					
    					var signatureInfo = JSON.parse(foundSignatureSets[keys[key]]);
    					//Only remove signatures in the bucket that match the minhash signature completely
    					if(arrayCompare(signatureInfo,minHashSignatures[0])){				
    						snapshot.child(keys[key]).ref().remove();
    					}
    				}
    			}
        	},
        	arrayCompare = function(A,B){

        		for(var i=0;i<A.length;i++){
        			if(A[i]!==B[i]){		
        				return false;
        			}
        		}
        		return true;
        	};
    			
			/* Obtain the vector hashes */
        	results = textMod.LSH(minHashSignatures);

        	/* Store the work into the author */
    		escapedEmail = this.escapeEmail(metadata['author']['email']);
    		authorRef = userRef.child(escapedEmail);
    		
    		userRef.child(escapedEmail).once('value', function(ss) {
    			if(ss.val() === null ) { 
    		    	/* author does not exist */ 
    		    	throw new Error("storeLSH: author is not registered");
    		    }else { 
		        	for(curBand=0;curBand<textMod.bands;curBand++){
		        		
		        		for(set=0;set<minHashSignatures.length;set++){
		        			
		        			curBandRef = bandRef.child(curBand);
		                                
		                    bucketRef = curBandRef.child(results['hashSet'][curBand][set]);
		        			
		        			bucketRef.once('value',bucketsCallback);
		        		}
		        	}
    		    }
    		});


}
};
