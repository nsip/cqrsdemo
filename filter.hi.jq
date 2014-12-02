(.. | objects | select(has("value")) | 
select (

( .cedsid == "000488" and .entitytype == "staff"  ) or # Disciplinary Action Taken
( .cedsid == "000439" and .entitytype == "staff"  ) or # Medical Alert Indicator

( .cedsid == "000488" and .entitytype == "student"  ) or 
( .cedsid == "000439" and .entitytype == "student"  ) or 
( .cedsid == "001244" and .entitytype == "student"  ) or # Program Gifted Eligibility Criteria
( .cedsid == "000122" and .entitytype == "student"  ) or # Gifted Talented Indicator
( .cedsid == "000086" and .entitytype == "student"  ) or # Economic Disadvantage Status
( .cedsid == "000180" and .entitytype == "student"  ) or # Limited English Proficiency Status
( .cedsid == "000577" and .entitytype == "student"  ) or # Disability Status
( .cedsid == "001339" and .entitytype == "student"  ) or # Early Learning Program Eligibility Status
( .cedsid == "000110" and .entitytype == "student"  ) or # Exit or Withdrawal Type
( .cedsid == "000108" and .entitytype == "student"  ) or # Exit or Withdrawal Status
( .cedsid == "000151" and .entitytype == "student"  ) or # IDEA Indicator
( .cedsid == "000531" and .entitytype == "student"  ) or # Nonpromotion Reason
( .cedsid == "000193" and .entitytype == "student"  ) or # Neglected Or Delinquent Status

( .cedsid == "001425" and .entitytype == "guardian"  ) or # Person Relationship to Learner Lives With Indicator
( .cedsid == "001424" and .entitytype == "guardian"  ) or # Person Relationship to Learner Contact Restrictions Indicator
( .cedsid == "001428" and .entitytype == "guardian"  ) or # Primary Contact Indicator


( .cedsid == "999999" )


)) 

|= "suppressed"

