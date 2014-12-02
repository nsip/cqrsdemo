(.. | objects | select(has("value")) | 
select (

( .cedsid == "000279" and .entitytype == "staff"  ) or # Phone number
( .cedsid == "000269" and .entitytype == "staff"  ) or # Street
( .cedsid == "000040" and .entitytype == "staff"  ) or # City
( .cedsid == "000214" and .entitytype == "staff"  ) or # Postal Code
( .cedsid == "000606" and .entitytype == "staff"  ) or # Longitutde
( .cedsid == "000607" and .entitytype == "staff"  ) or # Latitude
( .cedsid == "000088" and .entitytype == "staff"  ) or # Email
( .cedsid == "000115" and .entitytype == "staff"  ) or # Given Name
( .cedsid == "000172" and .entitytype == "staff"  ) or # Family Name
( .cedsid == "000184" and .entitytype == "staff"  ) or # Middle Name
( .cedsid == "000121" and .entitytype == "staff"  ) or # Suffix
( .cedsid == "000212" and .entitytype == "staff"  ) or # Honorific
( .cedsid == "000213" and .entitytype == "staff"  ) or # Position Title
( .cedsid == "001070" and .entitytype == "staff"  ) or # Staff Identifier
( .cedsid == "000347" and .entitytype == "staff"  ) or # Employment Status
( .cedsid == "000118" and .entitytype == "staff"  ) or # Staff Full Time Equivalency
( .cedsid == "000526" and .entitytype == "staff"  ) or # Assignment Start Date
( .cedsid == "000527" and .entitytype == "staff"  ) or # Assignment End Date
( .cedsid == "000087" and .entitytype == "staff"  ) or # Education Staff Classification
( .cedsid == "000528" and .entitytype == "staff"  ) or # Itinerant Teacher
( .cedsid == "000525" and .entitytype == "staff"  ) or # Primary Assingment Indicator
( .cedsid == "000125" and .entitytype == "staff"  ) or # Grade Level When Course Taken
( .cedsid == "000055" and .entitytype == "staff"  ) or # Course Identifier

( .cedsid == "000279" and .entitytype == "student"  ) or 
( .cedsid == "000269" and .entitytype == "student"  ) or 
( .cedsid == "000214" and .entitytype == "student"  ) or 
( .cedsid == "000040" and .entitytype == "student"  ) or 
( .cedsid == "000606" and .entitytype == "student"  ) or 
( .cedsid == "000607" and .entitytype == "student"  ) or 
( .cedsid == "000088" and .entitytype == "student"  ) or
( .cedsid == "000115" and .entitytype == "student"  ) or
( .cedsid == "000172" and .entitytype == "student"  ) or
( .cedsid == "000184" and .entitytype == "student"  ) or
( .cedsid == "000121" and .entitytype == "student"  ) or
( .cedsid == "000212" and .entitytype == "student"  ) or
( .cedsid == "001071" and .entitytype == "student"  ) or # Student Identifier
( .cedsid == "000584" and .entitytype == "student"  ) or # Cohort Graduation Year
( .cedsid == "000107" and .entitytype == "student"  ) or # Exit Date
( .cedsid == "001069" and .entitytype == "student"  ) or # School Identifier
( .cedsid == "000226" and .entitytype == "student"  ) or # Projected Graduation Date
( .cedsid == "000006" and .entitytype == "student"  ) or # Activity Identifier
( .cedsid == "000100" and .entitytype == "student"  ) or # Entry Grade Level
( .cedsid == "000529" and .entitytype == "student"  ) or # First Entry Date into a US School
( .cedsid == "000097" and .entitytype == "student"  ) or # Enrollment Entry Date
( .cedsid == "000094" and .entitytype == "student"  ) or # Enrollment Status
( .cedsid == "000046" and .entitytype == "student"  ) or # Cohort Year
( .cedsid == "000099" and .entitytype == "student"  ) or # Entry Type
( .cedsid == "000961" and .entitytype == "student"  ) or # Assessment Administration Code
( .cedsid == "000962" and .entitytype == "student"  ) or # Assessment Administration Start Date
( .cedsid == "000964" and .entitytype == "student"  ) or # Assessment Administration Finish Date
( .cedsid == "001093" and .entitytype == "student"  ) or # Assessment Session Special Event Description
( .cedsid == "000978" and .entitytype == "student"  ) or # Course Section Identifier
( .cedsid == "000191" and .entitytype == "student"  ) or # School Name

( .cedsid == "000425" and .entitytype == "guardian"  ) or # Person Relationship to Learner Type
( .cedsid == "001423" and .entitytype == "guardian"  ) or # Personl Relationship to Learner Contact Priority Number

( .cedsid == "999999" )


)) 

|= "suppressed"

