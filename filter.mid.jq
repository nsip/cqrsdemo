(.. | objects | select(has("value")) | 
select (

( .cedsid == "000033" and .entitytype == "staff"  ) or # Birthdate
( .cedsid == "000016" and .entitytype == "staff"  ) or # American Indian or Alaska Native
( .cedsid == "000255" and .entitytype == "staff"  ) or # Sex
( .cedsid == "000428" and .entitytype == "staff"  ) or # Birthdate Verification
( .cedsid == "000426" and .entitytype == "staff"  ) or # City of Birth
( .cedsid == "000427" and .entitytype == "staff"  ) or # State of Birth Abbreviation
( .cedsid == "000051" and .entitytype == "staff"  ) or # Country of Birth Code
( .cedsid == "000434" and .entitytype == "staff"  ) or # Qualifying Move From Country
( .cedsid == "000432" and .entitytype == "staff"  ) or # Migrant Student Qualifying Arrival Date
( .cedsid == "000317" and .entitytype == "staff"  ) or # Language Code
( .cedsid == "000149" and .entitytype == "staff"  ) or # Homelessness Status
( .cedsid == "000301" and .entitytype == "staff"  ) or # White
( .cedsid == "000189" and .entitytype == "staff"  ) or # Migrant Status
( .cedsid == "000438" and .entitytype == "staff"  ) or # Immunization Record Flag

( .cedsid == "000033" and .entitytype == "student"  ) or 
( .cedsid == "000016" and .entitytype == "student"  ) or # American Indian or Alaska Native
( .cedsid == "000255" and .entitytype == "student"  ) or # Sex
( .cedsid == "000428" and .entitytype == "student"  ) or # Birthdate Verification
( .cedsid == "000426" and .entitytype == "student"  ) or # City of Birth
( .cedsid == "000427" and .entitytype == "student"  ) or # State of Birth Abbreviation
( .cedsid == "000051" and .entitytype == "student"  ) or # Country of Birth Code
( .cedsid == "000434" and .entitytype == "student"  ) or # Qualifying Move From Country
( .cedsid == "000432" and .entitytype == "student"  ) or # Migrant Student Qualifying Arrival Date
( .cedsid == "000317" and .entitytype == "student"  ) or # Language Code
( .cedsid == "000149" and .entitytype == "student"  ) or # Homelessness Status
( .cedsid == "000301" and .entitytype == "student"  ) or # White
( .cedsid == "000189" and .entitytype == "student"  ) or # Migrant Status
( .cedsid == "000438" and .entitytype == "student"  ) or # Immunization Record Flag
( .cedsid == "000279" and .entitytype == "student"  ) or # Phone number
( .cedsid == "000269" and .entitytype == "student"  ) or # Street
( .cedsid == "000040" and .entitytype == "student"  ) or # City
( .cedsid == "000214" and .entitytype == "student"  ) or # Postal Code
( .cedsid == "000606" and .entitytype == "student"  ) or # Longitutde
( .cedsid == "000607" and .entitytype == "student"  ) or # Latitude
( .cedsid == "000088" and .entitytype == "student"  ) or # Email
( .cedsid == "000530" and .entitytype == "student"  ) or # Promotion Reason
( .cedsid == "001016" and .entitytype == "student"  ) or # Assessment Registration Retest Indicator
( .cedsid == "001162" and .entitytype == "student"  ) or # Assessment Registration Test Attempt Indicator
( .cedsid == "000126" and .entitytype == "student"  ) or # Grade Level When Assessed
( .cedsid == "001057" and .entitytype == "student"  ) or # Assessment Registration Grade Level To Be Assessed
( .cedsid == "000138" and .entitytype == "student"  ) or # High School Diploma Type


( .cedsid == "000317" and .entitytype == "guardian"  ) or # Language Code
( .cedsid == "000213" and .entitytype == "guardian"  ) or # Position Title
( .cedsid == "000141" and .entitytype == "guardian"  ) or # Highest Level of Education Completed
( .cedsid == "000016" and .entitytype == "guardian"  ) or # American Indian or Alaska Native
( .cedsid == "000255" and .entitytype == "guardian"  ) or # Sex
( .cedsid == "000428" and .entitytype == "guardian"  ) or # Birthdate Verification
( .cedsid == "000426" and .entitytype == "guardian"  ) or # City of Birth
( .cedsid == "000427" and .entitytype == "guardian"  ) or # State of Birth Abbreviation
( .cedsid == "000051" and .entitytype == "guardian"  ) or # Country of Birth Code
( .cedsid == "000434" and .entitytype == "guardian"  ) or # Qualifying Move From Country
( .cedsid == "000432" and .entitytype == "guardian"  ) or # Migrant Student Qualifying Arrival Date
( .cedsid == "000317" and .entitytype == "guardian"  ) or # Language Code
( .cedsid == "000149" and .entitytype == "guardian"  ) or # Homelessness Status
( .cedsid == "000301" and .entitytype == "guardian"  ) or # White
( .cedsid == "000189" and .entitytype == "guardian"  ) or # Migrant Status
( .cedsid == "000438" and .entitytype == "guardian"  ) or # Immunization Record Flag
( .cedsid == "001230" and .entitytype == "guardian"  ) or # Father's or Paternal Guardian Education
( .cedsid == "000180" and .entitytype == "guardian"  ) or # English Proficiency

( .cedsid == "999999" )


)) 

|= "suppressed"

