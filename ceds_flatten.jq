def flatten: reduce .[] as $i ([]; if $i | type == "array" then . + ($i | flatten) else . + [$i] end);


( .. | objects | select(has("YearLevels") ) | .YearLevels.YearLevel[].value )  |= ( .Code ) |      # Flatten YearLevels/YearLevel/Code/x to YearLevels/YearLevel/x
( .. | objects | select(has("#text")  ))   |= (."#text") |      # Flatten <x attr=y>z</x> to <x>z</x>

(.SchoolInfo | .. | objects | select(has("value")) | select(has("cedsdisambig") ) | select(.entitytype == "org"))  |=  { CEDS: {(.cedsid) : .value , "cedsdisambig" : (.cedsdisambig) }}  |
(.SchoolInfo | .. | objects | select(has("value")) | select(has("cedsdisambig") ) | select(.entitytype != "org"))  |=  { CEDSOTHER : {(.cedsid) : .value , "cedsdisambig" : (.cedsdisambig)} }  |
(.SchoolInfo | .. | objects | select(has("value")) | select(has("cedsdisambig") | not) | select(.entitytype == "org"))  |=  { CEDS : { (.cedsid) : .value }}   | 
(.SchoolInfo | .. | objects | select(has("value")) | select(has("cedsdisambig") | not) | select(.entitytype != "org"))  |=  { CEDSOTHER: {(.cedsid) : .value }}   | 
( .. | objects | select(has("cedsdisambig")) | .cedsdisambig  ) |=  (   .[] )  |
#( .. | objects ) |
{CEDS : ([( .. | objects | select(has("CEDS"))) | map(.) ] | flatten), CEDSOTHER : ([( .. | objects | select(has("CEDSOTHER"))) | map(.) ] | flatten) }  |
[ . ] |
.

