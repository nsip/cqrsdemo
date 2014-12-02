# filter of SchoolInfo to extract Task-Based UI core for Elastic Search

def flatten: reduce .[] as $i ([]; if $i | type == "array" then . + ($i | flatten) else . + [$i] end);
def flatten1: reduce .[] as $i ({}; if $i | type == "array" then . + ($i | flatten1) else . + $i end);

[(.. | objects | select(has("cedsid")) |
select (
((
( .cedsid == "000191" ) or 
( .cedsid == "000269" ) or 
( .cedsid == "000040" ) or 
( .cedsid == "timestamp" ) or 

( .cedsid == "999999" )
))

))]

|

[(.. | objects | select(has("entitytype"))  |  del(.entitytype))] |
(.. | objects | select(has("cedsid")) ) |= {(.cedsid) : .value } |
flatten1 |

.


