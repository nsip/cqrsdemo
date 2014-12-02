(if(has("SchoolInfo")) then (

(.SchoolInfo.PhoneNumberList.PhoneNumber|((arrays|.[]),objects).Number) |= {cedsid : "000279", entitytype : "org" , value : . } |
(.SchoolInfo.PhoneNumberList.PhoneNumber|((arrays|.[]),objects)."@Type") |= {cedsid : "000167", entitytype : "org" , value : . } |
#.SchoolInfo.PhoneNumberList.PhoneNumber[].Extension |= {cedsid : "000279", entitytype : "org" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.PhoneNumberList.PhoneNumber|((arrays|.[]),objects).Number) |={cedsid : "000279", entitytype : "staff" , value : . } |
#(.SchoolInfo.SchoolContactList.SchoolContact.ContactInfo.PhoneNumberList.PhoneNumber|arrays|.[].Number)|={cedsid : "000279", entitytype : "staff" , value : . } |
#(.SchoolInfo.SchoolContactList.SchoolContact.ContactInfo.PhoneNumberList.PhoneNumber|objects|.Number)|={cedsid : "000279", entitytype : "staff" , value : . } |
#.SchoolInfo.SchoolContactList.SchoolContact.ContactInfo.PhoneNumberList.PhoneNumber.Number |= {cedsid : "000279", entitytype : "staff" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact.ContactInfo|((arrays|.[]),objects).PhoneNumberList.PhoneNumber|((arrays|.[]),objects)."@Type") |= {cedsid : "000167", entitytype : "staff" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Address.Street.Line1) |= {cedsid : "000269", entitytype : "staff" , value : . } |
(.SchoolInfo.AddressList.Address|((arrays|.[]),objects).Street.Line1) |= {cedsid : "000269", entitytype : "org" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Address.City) |= {cedsid : "000040", entitytype : "staff" , value : . } |
(.SchoolInfo.AddressList|((arrays|.[]),objects).Address.City) |= {cedsid : "000040", entitytype : "org" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Address.PostalCode) |= {cedsid : "000214", entitytype : "staff" , value : . } |
(.SchoolInfo.AddressList.Address|((arrays|.[]),objects).PostalCode) |= {cedsid : "000214", entitytype : "org" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.EmailList.Email|((arrays|.[]),objects)) |= {cedsid : "000088", entitytype : "staff" , value : . } |
(.SchoolInfo.SchoolEmailList.Email|((arrays|.[]),objects)) |= {cedsid : "000088", entitytype : "org" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Address.GridLocation.Latitude) |= {cedsid : "000606", entitytype : "staff" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Address.GridLocation.Longitude) |= {cedsid : "000607", entitytype : "staff" , value : . } |
(.SchoolInfo.AddressList.Address|((arrays|.[]),objects).GridLocation.Latitude) |= {cedsid : "000606", entitytype : "staff" , value : . } |
(.SchoolInfo.AddressList.Address|((arrays|.[]),objects).GridLocation.Longitude) |= {cedsid : "000607", entitytype : "staff" , value : . }  |
.SchoolInfo.PrincipalInfo.ContactName.GivenName |= {cedsid : "000115", entitytype : "staff" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Name.GivenName) |= {cedsid : "000115", entitytype : "staff" , value : . } |
.SchoolInfo.PrincipalInfo.ContactName.FamilyName |= {cedsid : "000172", entitytype : "staff" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Name.FamilyName) |= {cedsid : "000172", entitytype : "staff" , value : . }  |
.SchoolInfo.PrincipalInfo.ContactName.MiddleName |= {cedsid : "000184", entitytype : "staff" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Name.MiddleName) |= {cedsid : "000184", entitytype : "staff" , value : . }  |
.SchoolInfo.PrincipalInfo.ContactName.Suffix |= {cedsid : "000121", entitytype : "staff" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Name.Suffix) |= {cedsid : "000121", entitytype : "staff" , value : . }  |
.SchoolInfo.PrincipalInfo.ContactName.Title |= {cedsid : "000212", entitytype : "staff" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Name.Title) |= {cedsid : "000212", entitytype : "staff" , value : . }  |
.SchoolInfo.PrincipalInfo.ContactName.FullName |= {cedsid : "000172", entitytype : "staff" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Name.FullName) |= {cedsid : "000172", entitytype : "staff" , value : . }  |
.SchoolInfo.PrincipalInfo.ContactTitle |= {cedsid : "000213", entitytype : "staff" , value : . } |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.PositionTitle) |= {cedsid : "000213", entitytype : "staff" , value : . }  |
(.SchoolInfo.SchoolContactList.SchoolContact|((arrays|.[]),objects).ContactInfo.Role) |= {cedsid : "000213", entitytype : "staff" , value : . }  |
.SchoolInfo.LocalId |=  {cedsid : "001069", entitytype : "org" , value : . , cedsdisambig : {cedsid : "001073", entitytype : "org", value : "School" } }  |
.SchoolInfo.StateProvinceId |=  {cedsid : "001069", entitytype : "org" , value : . , cedsdisambig : {cedsid : "001073", entitytype : "org", value : "SEA" } }  |
.SchoolInfo.CommonwealthId |=  {cedsid : "001069", entitytype : "org" , value : . , cedsdisambig : {cedsid : "001073", entitytype : "org", value : "Federal" } }  |
(.SchoolInfo.OtherIdList.OtherId|((arrays|.[]),objects)) |=  {cedsid : "001069", entitytype : "org" , value : . , cedsdisambig : {cedsid : "001073", entitytype : "org", value : "Other" } }  |
.SchoolInfo.SchoolName |=  {cedsid : "000191", entitytype : "org" , value : . } |
.SchoolInfo.SchoolDistrict |=  {cedsid : "000204", entitytype : "org" , value : . , cedsdisambig: {cedsid : "001156", entitytype : "org" , value : "LEA" } } |
.SchoolInfo.SchoolDistrictLocalId |=  {cedsid : "001068", entitytype : "org" , value : . , cedsdisambig: {cedsid : "001156", entitytype : "org" , value : "LEA" } } |
.SchoolInfo.SchoolType |=  {cedsid : "000241", entitytype : "org" , value : . } |
(.SchoolInfo.SchoolFocusList.SchoolFocus|((arrays|.[]),objects)) |=  {cedsid : "000015", entitytype : "org" , value : . } |
.SchoolInfo.SchoolURL |=  {cedsid : "000704", entitytype : "org" , value : . } |
.SchoolInfo.SessionType |=  {cedsid : "001270", entitytype : "org" , value : . } |
(.SchoolInfo.YearLevels.YearLevel |((arrays|.[]),objects)) |=  {cedsid : "000131", entitytype : "org" , value : . } |
#.SchoolInfo.YearLevels.YearLevel |=  {cedsid : "000131", entitytype : "org" , value : . } |
.SchoolInfo.ARIA |=  {cedsid : "000585", entitytype : "org" , value : . } |
.SchoolInfo.OperationalStatus |=  {cedsid : "000533", entitytype : "org" , value : . } |
# .SchoolInfo.FederalElectorate |=  {cedsid : "000190", entitytype : "org" , value : . } | */
.SchoolInfo.Campus.ParentSchoolId |=  {cedsid : "001069", entitytype : "org" , value : . , cedsdisambig: [ {cedsid : "001156", entitytype: "org" , value : "ParentSchool" } , { cedsid : "001073", entitytype : "org", value : "School" } ] } |
.SchoolInfo.Campus.SchoolCampusId |=  {cedsid : "001069", entitytype : "org" , value : . , cedsdisambig: [ {cedsid : "001156", entitytype: "org" , value : "Campus" } , { cedsid : "001073", entitytype : "org", value : "School" } ] } |
.SchoolInfo.Campus.CampusType |=  {cedsid : "000241", entitytype : "org" , value : . , cedsdisambig: {cedsid : "001156", entitytype: "org" , value : "Campus" } } |
# .SchoolInfo.Campus.AdminStatus |=  {cedsid : "000241", entitytype : "org" , value : . , cedsdisambig: {cedsid : "001156", entitytype: "org" , value : "Campus" } } | */
.SchoolInfo.SchoolSector |=  {cedsid : "000012", entitytype : "org" , value : . } |
# .SchoolInfo.IndependentSchool |=  {cedsid : "000012", entitytype : "org" , value : . } | */
# .SchoolInfo.NonGovSystemicStatus |=  {cedsid : "000012", entitytype : "org" , value : . } | */
# .SchoolInfo.System |=  {cedsid : "000012", entitytype : "org" , value : . } | */
# .SchoolInfo.ReligiousAffiliation |=  {cedsid : "000012", entitytype : "org" , value : . } | */
# .SchoolInfo.SchoolGeographicLocation |=  {cedsid : "000190", entitytype : "org" , value : . } | */
# .SchoolInfo.LocalGovernmentArea |=  {cedsid : "000190", entitytype : "org" , value : . } | */
# .SchoolInfo.JurisdictionLowerHouse |=  {cedsid : "000190", entitytype : "org" , value : . } | */
# .SchoolInfo.SLA |=  {cedsid : "000012", entitytype : "org" , value : . } | */
# .SchoolInfo.SchoolCoEdStatus |=  {cedsid : "000012", entitytype : "org" , value : . } | */
# .SchoolInfo.BoardingSchoolStatus |=  {cedsid : "000012", entitytype : "org" , value : . } | */
.SchoolInfo.Entity_Open |=  {cedsid : "000534", entitytype : "org" , value : . } |
# .SchoolInfo.Entity_Close |=  {cedsid : "000012", entitytype : "org" , value : . } | */
(.SchoolInfo.SchoolGroupList.SchoolGroup|((arrays|.[]),objects)) |=  {cedsid : "000204", entitytype : "org" , value : . , cedsdisambig: {cedsid : "001156", entitytype : "org" , value : "SchoolGroup" } } |
.SchoolInfo.SIF_Metadata.LifeCycle.Created.DateTime |= {cedsid : "timestamp", entitytype: "org", value : . } |
.
) else . end ) | 

(if(has("TeachingGroup")) then (

(.TeachingGroup.StudentList.TeachingGroupStudent|((arrays|.[]),objects).StudentLocalId) |= {cedsid : "001071", entitytype : "student" , value : . } |
(.TeachingGroup.StudentList.TeachingGroupStudent|((arrays|.[]),objects).Name.GivenName) |= {cedsid : "000115", entitytype : "student" , value : . } |
(.TeachingGroup.StudentList.TeachingGroupStudent|((arrays|.[]),objects).Name.FamilyName) |= {cedsid : "000172", entitytype : "student" , value : . } |
(.TeachingGroup.StudentList.TeachingGroupStudent|((arrays|.[]),objects).Name.MiddleName) |= {cedsid : "000184", entitytype : "student" , value : . } |
(.TeachingGroup.StudentList.TeachingGroupStudent|((arrays|.[]),objects).Name.Suffix) |= {cedsid : "000121", entitytype : "student" , value : . } |
(.TeachingGroup.StudentList.TeachingGroupStudent|((arrays|.[]),objects).Name.Title) |= {cedsid : "000212", entitytype : "student" , value : . } |
(.TeachingGroup.StudentList.TeachingGroupStudent|((arrays|.[]),objects).Name.FullName) |= {cedsid : "000172", entitytype : "student" , value : . } |
(.TeachingGroup.TeacherList.TeachingGroupTeacher|((arrays|.[]),objects).StaffLocalId) |= {cedsid : "001070", entitytype : "staff" , value : . } |
(.TeachingGroup.TeacherList.TeachingGroupTeacher|((arrays|.[]),objects).Name.GivenName)|= {cedsid : "000115", entitytype : "staff" , value : . } |
(.TeachingGroup.TeacherList.TeachingGroupTeacher|((arrays|.[]),objects).Name.FamilyName) |= {cedsid : "000172", entitytype : "staff" , value : . } |
(.TeachingGroup.TeacherList.TeachingGroupTeacher|((arrays|.[]),objects).Name.MiddleName) |= {cedsid : "000184", entitytype : "staff" , value : . } |
(.TeachingGroup.TeacherList.TeachingGroupTeacher|((arrays|.[]),objects).Name.Suffix) |= {cedsid : "000121", entitytype : "staff" , value : . } |
(.TeachingGroup.TeacherList.TeachingGroupTeacher|((arrays|.[]),objects).Name.Title) |= {cedsid : "000212", entitytype : "staff" , value : . } |
(.TeachingGroup.TeacherList.TeachingGroupTeacher|((arrays|.[]),objects).Name.FullName) |= {cedsid : "000172", entitytype : "staff" , value : . } |
.

) else . end ) |

(if(has("StudentPersonal")) then (

.StudentPersonal.LocalId |= {cedsid : "001071", entitytype : "student" , value : . , cedsdisambig : {cedsid : "001073", entitytype : "org", value : "School" } } |
.StudentPersonal.StateProvinceId |= {cedsid : "001071", entitytype : "student" , value : . , cedsdisambig : {cedsid : "001073", entitytype : "org", value : "SEA" } } |
(.StudentPersonal.ElectronicIdList.ElectronicId|((arrays|.[]),objects)) |= {cedsid : "001071", entitytype : "student" , value : . } |
(.StudentPersonal.OtherIdList.OtherId|((arrays|.[]),objects)) |= {cedsid : "001071", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Name.GivenName |= {cedsid : "000115", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Name.FamilyName |= {cedsid : "000172", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Name.MiddleName |= {cedsid : "000184", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Name.Suffix |= {cedsid : "000121", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Name.Title |= {cedsid : "000212", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Name.FullName |= {cedsid : "000172", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.OtherNames.Name|((arrays|.[]),objects).GivenName) |= {cedsid : "000115", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.OtherNames.Name|((arrays|.[]),objects).FamilyName) |= {cedsid : "000172", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.OtherNames.Name|((arrays|.[]),objects).MiddleName) |= {cedsid : "000184", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.OtherNames.Name|((arrays|.[]),objects).Suffix) |= {cedsid : "000121", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.OtherNames.Name|((arrays|.[]),objects).Title) |= {cedsid : "000212", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.OtherNames.Name|((arrays|.[]),objects).FullName) |= {cedsid : "000172", entitytype : "student" , value : . } |
.StudentPersonal.ProjectedGraduationYear |= {cedsid : "000226", entitytype : "student" , value : . } |
.StudentPersonal.OnTimeGraduationYear |= {cedsid : "000584", entitytype : "student" , value : . } |
.StudentPersonal.GraduationDate |= {cedsid : "000107", entitytype : "student" , value : . } |
.StudentPersonal.MostRecent.SchoolLocalId |= {cedsid : "001069", entitytype : "student" , value : . } |
.StudentPersonal.MostRecent.HomeroomLocalId |= {cedsid : "000006", entitytype : "student" , value : . } |
.StudentPersonal.MostRecent.YearLevel |= {cedsid : "000100", entitytype : "student" , value : . } |
#.StudentPersonal.AcceptableUsePolicy |= {cedsid : "xxxx", entitytype : "student" , value : . } | # no CEDS equivalent
.StudentPersonal.FirstAUSchoolEnrollment |= {cedsid : "000529", entitytype : "student" , value : . } | 
(.StudentPersonal.AlertMessages.AlertMessage|((arrays|.[]),objects)) |= {cedsid : "000488", entitytype : "student" , value : . } |
(.StudentPersonal.MedicalAlertMessages.MedicalAlertMessage|((arrays|.[]),objects)) |= {cedsid : "000439", entitytype : "student" , value : . } |
.StudentPersonal.GiftedTalented |= {cedsid : "000122", entitytype : "student" , value : . } |
.StudentPersonal.EconomicDisadvantage |= {cedsid : "000086", entitytype : "student" , value : . } |
.StudentPersonal.ESL |= {cedsid : "000180", entitytype : "student" , value : . } |
#.StudentPersonal.YoungCarersRole |= {cedsid : "000180", entitytype : "student" , value : . } | # no CEDS equivalent
.StudentPersonal.Disability |= {cedsid : "000577", entitytype : "student" , value : . } |
.StudentPersonal.IntegrationAide |= {cedsid : "000577", entitytype : "student" , value : . } |
.StudentPersonal.PrePrimaryEducation |= {cedsid : "001339", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.IndigenousStatus |= {cedsid : "000016", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.Sex |= {cedsid : "000255", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.BirthDate |= {cedsid : "000033", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.BirthDateVerification |= {cedsid : "000428", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.PlaceOfBirth |= {cedsid : "000426", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.StateOfBirth |= {cedsid : "000427", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.CountryOfBirth |= {cedsid : "000051", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.Demographics.CountriesOfCitizenship.CountryOfCitizenship|((arrays|.[]),objects)) |= {cedsid : "000434", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.Demographics.CountriesOfResidency.CountryOfResidency|((arrays|.[]),objects)) |= {cedsid : "000434", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.CountryArrivalDate |= {cedsid : "000432", entitytype : "student" , value : . } |
#.StudentPersonal.PersonInfo.Demographics.AustralianCitizenshipStatus |= {cedsid : "000033", entitytype : "student" , value : . } | # no CEDS equivalent
.StudentPersonal.PersonInfo.Demographics.EnglishProficiency |= {cedsid : "000180", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.Demographics.LanguageList.Language|((arrays|.[]),objects).Code) |= {cedsid : "000317", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.Demographics.LanguageList.Language|((arrays|.[]),objects).OtherCodeList) |= {cedsid : "000317", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.Demographics.LanguageList.Language|((arrays|.[]),objects).Dialect) |= {cedsid : "000317", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.DwellingArrangement.Code |= {cedsid : "000149", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.DwellingArrangement.OtherCodeList |= {cedsid : "000149", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.Religion.Code |= {cedsid : "000301", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.Religion.OtherCodeList |= {cedsid : "000301", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.Demographics.ReligiousEventList.ReligiousEvent|((arrays|.[]),objects).Type) |= {cedsid : "000301", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.Demographics.ReligiousEventList.ReligiousEvent|((arrays|.[]),objects).Date) |= {cedsid : "000301", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.ReligiousRegion |= {cedsid : "000301", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.PermanentResident |= {cedsid : "000189", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.VisaSubClass |= {cedsid : "000189", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.VisaStatisticalCode |= {cedsid : "000189", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.VisaExpiryDate |= {cedsid : "000189", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.ImmunisationCertificateStatus |= {cedsid : "000438", entitytype : "student" , value : . } |
.StudentPersonal.PersonInfo.Demographics.CulturalBackground |= {cedsid : "000301", entitytype : "student" , value : . } |
#.StudentPersonal.PersonInfo.Demographics.MaritalStatus |= {cedsid : "000033", entitytype : "student" , value : . } | # no CEDS equivalent
(.StudentPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).Street) |= {cedsid : "000269", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).City) |= {cedsid : "000040", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).PostalCode) |= {cedsid : "000214", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).GridLocation.Latitude) |= {cedsid : "000606", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).GridLocation.Longitude) |= {cedsid : "000607", entitytype : "student" , value : . }  |
(.StudentPersonal.PersonInfo.PhoneNumberList.PhoneNumber|((arrays|.[]),objects).Number)|= {cedsid : "000279", entitytype : "student" , value : . } |
(.StudentPersonal.PersonInfo.EmailList.Email|((arrays|.[]),objects)) |= {cedsid : "000088", entitytype : "student" , value : . } |
.StudentPersonal.MostRecent.Parent1Language |= {cedsid : "000317", entitytype : "guardian" , value : . } |
.StudentPersonal.MostRecent.Parent1EmploymentType |= {cedsid : "000213", entitytype : "guardian" , value : . } |
.StudentPersonal.MostRecent.Parent1SchoolEducationLevel |= {cedsid : "000141", entitytype : "student" , value : . } |
.StudentPersonal.MostRecent.Parent1NonSchoolEducation |= {cedsid : "000141", entitytype : "student" , value : . } |
.StudentPersonal.MostRecent.Parent2Language |= {cedsid : "000317", entitytype : "guardian" , value : . } |
.StudentPersonal.MostRecent.Parent2EmploymentType |= {cedsid : "000213", entitytype : "guardian" , value : . } |
.StudentPersonal.MostRecent.Parent2SchoolEducationLevel |= {cedsid : "000141", entitytype : "student" , value : . } |
.StudentPersonal.MostRecent.Parent2NonSchoolEducation |= {cedsid : "000141", entitytype : "student" , value : . } |
.

) else . end ) |

(if(has("StudentSchoolEnrollment")) then (
.StudentSchoolEnrollment.SchoolInfoRefId |= {cedsid : "001069", entitytype : "student" , value : .} | 
.StudentSchoolEnrollment.TimeFrame |= {cedsid : "000094", entitytype : "student" , value : .} |
.StudentSchoolEnrollment.SchoolYear |= {cedsid : "000046", entitytype : "student" , value : .} |
.StudentSchoolEnrollment.EntryDate |=  {cedsid : "000097", entitytype : "student" , value : .} | 
.StudentSchoolEnrollment.EntryType.Code |=  {cedsid : "000099", entitytype : "student" , value : .} |
.StudentSchoolEnrollment.EntryType.OtherCodeList |=  {cedsid : "000099", entitytype : "student" , value : .} |
.StudentSchoolEnrollment.YearLevel |=  {cedsid : "000100", entitytype : "student" , value : .} | 
#.StudentSchoolEnrollment.Homeroom |= LO # No equivalent in CEDS
#.StudentSchoolEnrollment.Advisor |= LO # No equivalent in CEDS
#.StudentSchoolEnrollment.Counselor |= LO # No equivalent in CEDS
#.StudentSchoolEnrollment.Homegroup |= LO # No equivalent in CEDS
#.StudentSchoolEnrollment.House |= LO # No equivalent in CEDS
.StudentSchoolEnrollment.IndividualLearningPlan |=  {cedsid : "000151", entitytype : "student" , value : .} | 
.StudentSchoolEnrollment.ExitDate |= {cedsid : "000107", entitytype : "student" , value : .} | 
.StudentSchoolEnrollment.ExitStatus.Code |=  {cedsid : "000108", entitytype : "student" , value : .} | 
.StudentSchoolEnrollment.ExitStatus.OtherCodeList |=  {cedsid : "000108", entitytype : "student" , value : .} | 
.StudentSchoolEnrollment.ExitType.Code |= {cedsid : "000110", entitytype : "student" , value : .} | 
.StudentSchoolEnrollment.ExitType.OtherCodeList |= {cedsid : "000110", entitytype : "student" , value : .} | 
#.StudentSchoolEnrollment.FTE |= LO # No equivalent in CEDS
#.StudentSchoolEnrollment.FTPTStatus |= LO
#.StudentSchoolEnrollment.FFPOS |= HI # No equivalent in CEDS
#.StudentSchoolEnrollment.CatchmentStatus.Code |= LO # No equivalent in CEDS
#.StudentSchoolEnrollment.CatchmentStatus.OtherCodeList |= LO # No equivalent in CEDS
.StudentSchoolEnrollment.RecordClosureReason |= {cedsid : "000531", entitytype : "student" , value : .} | 
.StudentSchoolEnrollment.PromotionInfo.PromotionStatus |= {cedsid : "000530", entitytype : "student" , value : .} | 
#.StudentSchoolEnrollment.PreviousSchool |= LO # No equivalent in CEDS
#.StudentSchoolEnrollment.DestinationSchool |= LO # No equivalent in CEDS
#.StudentSchoolEnrollment.StudentSubjectChoiceList.StudentSubjectChoice |= ME # No equivalent in CEDS
.
) else . end ) |

(if(has("StaffPersonal")) then (
.StaffPersonal.LocalId |= {cedsid : "001070", entitytype : "staff" , value : . , cedsdisambig : {cedsid : "001073", entitytype : "org", value : "School" } } | 
.StaffPersonal.StateProvinceId |= {cedsid : "001070", entitytype : "staff" , value : . , cedsdisambig : {cedsid : "001073", entitytype : "org", value : "SEA" } } |
(.StaffPersonal.ElectronicIdList.ElectronicId|((arrays|.[]),objects)) |= {cedsid : "001070", entitytype : "staff" , value : . } | 
(.StaffPersonal.OtherIdList.OtherId|((arrays|.[]),objects)) |= {cedsid : "001070", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Name.GivenName |= {cedsid : "000115", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Name.FamilyName |= {cedsid : "000172", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Name.MiddleName |= {cedsid : "000184", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Name.Suffix |= {cedsid : "000121", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Name.Title |= {cedsid : "000212", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Name.FullName |= {cedsid : "000172", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.OtherNames.Name.GivenName |= {cedsid : "000115", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.OtherNames.Name.FamilyName |= {cedsid : "000172", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.OtherNames.Name.MiddleName |= {cedsid : "000184", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.OtherNames.Name.Suffix |= {cedsid : "000121", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.OtherNames.Name.Title |= {cedsid : "000212", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.OtherNames.Name.FullName |= {cedsid : "000172", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.IndigenousStatus |= {cedsid : "000016", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.Sex |= {cedsid : "000255", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.BirthDate |= {cedsid : "000033", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.BirthDateVerification |= {cedsid : "000428", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.PlaceOfBirth |= {cedsid : "000426", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.StateOfBirth |= {cedsid : "000427", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.CountryOfBirth |= {cedsid : "000051", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.Demographics.CountriesOfCitizenship.CountryOfCitizenship|((arrays|.[]),objects)) |= {cedsid : "000434", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.Demographics.CountriesOfResidency.CountryOfResidency|((arrays|.[]),objects)) |= {cedsid : "000434", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.CountryArrivalDate |= {cedsid : "000432", entitytype : "staff" , value : . } |
#.StaffPersonal.PersonInfo.Demographics.AustralianCitizenshipStatus |= {cedsid : "000033", entitytype : "staff" , value : . } | # no CEDS equivalent
.StaffPersonal.PersonInfo.Demographics.EnglishProficiency |= {cedsid : "000180", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.Demographics.LanguageList.Language|((arrays|.[]),objects).Code) |= {cedsid : "000317", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.Demographics.LanguageList.Language|((arrays|.[]),objects).OtherCodeList) |= {cedsid : "000317", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.Demographics.LanguageList.Language|((arrays|.[]),objects).Dialect) |= {cedsid : "000317", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.DwellingArrangement.Code |= {cedsid : "000149", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.DwellingArrangement.OtherCodeList |= {cedsid : "000149", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.Religion.Code |= {cedsid : "000301", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.Religion.OtherCodeList |= {cedsid : "000301", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.Demographics.ReligiousEventList.ReligiousEvent|((arrays|.[]),objects).Type) |= {cedsid : "000301", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.Demographics.ReligiousEventList.ReligiousEvent|((arrays|.[]),objects).Date) |= {cedsid : "000301", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.ReligiousRegion |= {cedsid : "000301", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.PermanentResident |= {cedsid : "000189", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.VisaSubClass |= {cedsid : "000189", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.VisaStatisticalCode |= {cedsid : "000189", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.VisaExpiryDate |= {cedsid : "000189", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.ImmunisationCertificateStatus |= {cedsid : "000438", entitytype : "staff" , value : . } |
.StaffPersonal.PersonInfo.Demographics.CulturalBackground |= {cedsid : "000301", entitytype : "staff" , value : . } |
#.StaffPersonal.PersonInfo.Demographics.MaritalStatus |= {cedsid : "000033", entitytype : "staff" , value : . } | # no CEDS equivalent
(.StaffPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).Street) |= {cedsid : "000269", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).City) |= {cedsid : "000040", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).PostalCode) |= {cedsid : "000214", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).GridLocation.Latitude) |= {cedsid : "000606", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).GridLocation.Longitude) |= {cedsid : "000607", entitytype : "staff" , value : . }  |
(.StaffPersonal.PersonInfo.PhoneNumberList.PhoneNumber|((arrays|.[]),objects).Number) |= {cedsid : "000279", entitytype : "staff" , value : . } |
(.StaffPersonal.PersonInfo.EmailList.Email|((arrays|.[]),objects)) |= {cedsid : "000088", entitytype : "staff" , value : . } |
.StaffPersonal.Title |= {cedsid : "000212", entitytype : "staff" , value : . } |
.StaffPersonal.EmploymentStatus |= {cedsid : "000347", entitytype : "staff" , value : . } |
.
) else . end ) |

(if(has("StaffAssignment")) then (
.StaffAssignment.Description |= {cedsid : "000213", entitytype : "staff" , value : . } |
.StaffAssignment.PrimaryAssignment |= {cedsid : "000525", entitytype : "staff" , value : . } |
.StaffAssignment.JobStartDate |= {cedsid : "000526", entitytype : "staff" , value : . } |
.StaffAssignment.JobEndDate |= {cedsid : "000527", entitytype : "staff" , value : . } |
.StaffAssignment.JobFTE |= {cedsid : "000118", entitytype : "staff" , value : . } |
.StaffAssignment.JobFunction |= {cedsid : "000213", entitytype : "staff" , value : . } |
#.StaffAssignment.StaffSubjectList.StaffSubject.PreferenceNumber |= LO # No equivalent in CEDS
(.StaffAssignment.StaffSubjectList.StaffSubject|((arrays|.[]),objects).SubjectLocalId) |= {cedsid : "000055", entitytype : "staff" , value : . } |
(.StaffAssignment.StaffSubjectList.StaffSubject|((arrays|.[]),objects).TimeTableSubjectRefId) |= {cedsid : "000055", entitytype : "staff" , value : . } |
.StaffAssignment.StaffActivity.Code |= {cedsid : "000087", entitytype : "staff" , value : . } |
.StaffAssignment.StaffActivity.OtherCodeList |= {cedsid : "000087", entitytype : "staff" , value : . } |
.StaffAssignment.YearLevels |=  {cedsid : "00125", entitytype : "staff" , value : . } |
.StaffAssignment.CasualReliefTeacher |=  {cedsid : "00528", entitytype : "staff" , value : . } |
#.StaffAssignment.Homegroup |= LO  # No CEDS equivalent
#.StaffAssignment.House |= LO # No CEDS equivalent
.
) else . end ) |

(if(has("StudentContactPersonal")) then (
# .StudentContactPersonal.LocalId |= LO # No CEDS equivalent
#.StudentContactPersonal.OtherIdList.OtherId |= LO # No CEDS equivalent
.StudentContactPersonal.PersonInfo.Name.GivenName |= {cedsid : "000115", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Name.FamilyName |= {cedsid : "000172", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Name.MiddleName |= {cedsid : "000184", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Name.Suffix |= {cedsid : "000121", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Name.Title |= {cedsid : "000212", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Name.FullName |= {cedsid : "000172", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.OtherNames.Name.GivenName |= {cedsid : "000115", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.OtherNames.Name.FamilyName |= {cedsid : "000172", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.OtherNames.Name.MiddleName |= {cedsid : "000184", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.OtherNames.Name.Suffix |= {cedsid : "000121", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.OtherNames.Name.Title |= {cedsid : "000212", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.OtherNames.Name.FullName |= {cedsid : "000172", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.IndigenousStatus |= {cedsid : "000016", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.Sex |= {cedsid : "000255", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.BirthDate |= {cedsid : "000033", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.BirthDateVerification |= {cedsid : "000428", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.PlaceOfBirth |= {cedsid : "000426", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.StateOfBirth |= {cedsid : "000427", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.CountryOfBirth |= {cedsid : "000051", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.Demographics.CountriesOfCitizenship.CountryOfCitizenship|((arrays|.[]),objects)) |= {cedsid : "000434", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.Demographics.CountriesOfResidency.CountryOfResidency|((arrays|.[]),objects)) |= {cedsid : "000434", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.CountryArrivalDate |= {cedsid : "000432", entitytype : "guardian" , value : . } |
#.StudentContactPersonal.PersonInfo.Demographics.AustralianCitizenshipStatus |= {cedsid : "000033", entitytype : "guardian" , value : . } | # no CEDS equivalent
.StudentContactPersonal.PersonInfo.Demographics.EnglishProficiency |= {cedsid : "000180", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.Demographics.LanguageList.Language|((arrays|.[]),objects).Code) |= {cedsid : "000317", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.Demographics.LanguageList.Language|((arrays|.[]),objects).OtherCodeList) |= {cedsid : "000317", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.Demographics.LanguageList.Language|((arrays|.[]),objects).Dialect) |= {cedsid : "000317", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.DwellingArrangement.Code |= {cedsid : "000149", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.DwellingArrangement.OtherCodeList |= {cedsid : "000149", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.Religion.Code |= {cedsid : "000301", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.Religion.OtherCodeList |= {cedsid : "000301", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.Demographics.ReligiousEventList.ReligiousEvent|((arrays|.[]),objects).Type) |= {cedsid : "000301", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.Demographics.ReligiousEventList.ReligiousEvent|((arrays|.[]),objects).Date) |= {cedsid : "000301", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.ReligiousRegion |= {cedsid : "000301", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.PermanentResident |= {cedsid : "000189", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.VisaSubClass |= {cedsid : "000189", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.VisaStatisticalCode |= {cedsid : "000189", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.VisaExpiryDate |= {cedsid : "000189", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.ImmunisationCertificateStatus |= {cedsid : "000438", entitytype : "guardian" , value : . } |
.StudentContactPersonal.PersonInfo.Demographics.CulturalBackground |= {cedsid : "000301", entitytype : "guardian" , value : . } |
#.StudentContactPersonal.PersonInfo.Demographics.MaritalStatus |= {cedsid : "000033", entitytype : "guardian" , value : . } | # no CEDS equivalent
(.StudentContactPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).Street) |= {cedsid : "000269", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).City) |= {cedsid : "000040", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).PostalCode) |= {cedsid : "000214", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).GridLocation.Latitude) |= {cedsid : "000606", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.AddressList.Address|((arrays|.[]),objects).GridLocation.Longitude) |= {cedsid : "000607", entitytype : "guardian" , value : . }  |
(.StudentContactPersonal.PersonInfo.PhoneNumberList.PhoneNumber|((arrays|.[]),objects).Number) |= {cedsid : "000279", entitytype : "guardian" , value : . } |
(.StudentContactPersonal.PersonInfo.EmailList.Email|((arrays|.[]),objects)) |= {cedsid : "000088", entitytype : "guardian" , value : . } |
#.StudentContactPersonal.EmploymentType |= ME # No equivalent in CEDS
.StudentContactPersonal.SchoolEducationLevel |=  {cedsid : "001230", entitytype : "guardian" , value : . } |
.StudentContactPersonal.NonSchoolEducation |=  {cedsid : "001230", entitytype : "guardian" , value : . } |
.
) else . end ) |

(if(has("StudentContactRelationship")) then (
# .StudentContactRelationship.HouseholdList.Household |= LO # No equivalent in CEDS
.StudentContactRelationship.Relationship |= {cedsid : "000425", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.ParentLegalGuardian |= {cedsid : "000425", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.PickupRights |=  {cedsid : "001424", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.LivesWith |= {cedsid : "001425", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.AccessToRecords |= {cedsid : "001428", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.ReceivesAssessmentReport |=  {cedsid : "001428", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.EmergencyContact |=  {cedsid : "001428", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.HasCustody |=  {cedsid : "001428", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.DisciplinaryContact |=  {cedsid : "001428", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.AttendanceContact |=  {cedsid : "001428", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.PrimaryCareProvider |=  {cedsid : "001428", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.FeesBilling |=  {cedsid : "001428", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.FamilyMail |=  {cedsid : "001428", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactFlags.InterventionOrder |=  {cedsid : "001424", entitytype : "guardian" , value : . } |
.StudentContactRelationship.MainlySpeaksEnglishAtHome |= {cedsid : "000180", entitytype : "guardian" , value : . } |
.StudentContactRelationship.ContactSequence |= {cedsid : "001423", entitytype : "guardian" , value : . } |
#.StudentContactRelationship.ContactSequenceSource |= LO # No equivalent in CEDS
.
) else . end ) |

(if(has("Sif3AssessmentRegistration")) then (
.Sif3AssessmentRegistration."@StudentPersonalRefId" |=  {cedsid : "001071", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentAdministrationRefId |=  {cedsid : "000961", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.StartDateTime |=  {cedsid : "000962", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.EndDateTime |=  {cedsid : "000964", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.RetestIndicator |=  {cedsid : "001016", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.TestAttemptIdentifier |= {cedsid : "001162", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.StudentSpecialEvents.StudentSpecialEvent |= {cedsid : "001093", entitytype : "student" , value : . } |
#.Sif3AssessmentRegistration.TestingStatuses.TestingStatus.TestingStatusCode |= LO # No equivalent in CEDS
#.Sif3AssessmentRegistration.TestingStatuses.TestingStatus.TestingStatusDescription |= LO # No equivalent in CEDS
.Sif3AssessmentRegistration.StudentGradeLevel |= {cedsid : "000126", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentGradeLevel |= {cedsid : "001057", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Name.GivenName |= {cedsid : "000115", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Name.FamilyName |= {cedsid : "000172", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Name.MiddleName |= {cedsid : "000184", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Name.Suffix |= {cedsid : "000121", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Name.Title |= {cedsid : "000212", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Name.FullName |= {cedsid : "000172", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.LocalId |= {cedsid : "001071", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.StateProvinceId |= {cedsid : "001071", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Address.Street |= {cedsid : "000269", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Address.City |= {cedsid : "000040", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Address.PostalCode |= {cedsid : "000214", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Address.GridLocation.Latitude |= {cedsid : "000606", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Address.GridLocation.Longitude |= {cedsid : "000607", entitytype : "student" , value : . }  |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Sex |= {cedsid : "000255", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.BirthDate |= {cedsid : "000033", entitytype : "student" , value : . } |
#.Sif3AssessmentRegistration.AssessmentStudentSnapshot.Age |= ME # No CEDS equivalent
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.ProjectedGraduationYear |=  {cedsid : "000226", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.OnTimeGraduationYear |=  {cedsid : "000584", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.GraduationDate |=  {cedsid : "000107", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.GraduationAward |=  {cedsid : "000138", entitytype : "student" , value : . } |
#.Sif3AssessmentRegistration.AssessmentStudentSnapshot.GraduationOnTime |= ME # No CEDS equivalent
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.HomeEnrollment.SchoolName |= {cedsid : "000191", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.HomeEnrollment.SchoolInfoRefId |= {cedsid : "001069", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.HomeEnrollment.LocalId |= {cedsid : "001071", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.HomeEnrollment.StateProvinceId |=  {cedsid : "001071", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.HomeEnrollment.Status |= {cedsid : "000094", entitytype : "student" , value : .} | 
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.HomeEnrollment.GradeLevel |=  {cedsid : "000100", entitytype : "student" , value : .} | 
#.Sif3AssessmentRegistration.AssessmentStudentSnapshot.HomeEnrollment.Homeroom |= LO # No CEDS equivalent
#.Sif3AssessmentRegistration.AssessmentStudentSnapshot.HomeEnrollment.HomeroomNumber |= LO # No CEDS equivalent
#.Sif3AssessmentRegistration.AssessmentStudentSnapshot.HomeEnrollment.FullYearEnrollment |= LO # No CEDS equivalent
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.GiftedTalented |=  {cedsid : "000122", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.EconomicDisadvantage |= {cedsid : "000086", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.AssessmentStudentSnapshot.NeglectedDelinquent |= {cedsid : "000193", entitytype : "student" , value : . } |
.Sif3AssessmentRegistration.StaffPersonalRefId |= {cedsid : "001070", entitytype : "staff" , value : . } |
.Sif3AssessmentRegistration.SectionInfoRefId |= {cedsid : "000978", entitytype : "student" , value : . } |
.
) else . end ) |



# If any LHS values did not exist, we have injected null ceds values into the tree; get rid of them
(del( .. | objects | select(has("cedsid"))| select(.value == null) )) |

.

