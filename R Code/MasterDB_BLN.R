Main_Street_COVID_Relief_Grants=CRG

CopyDB_CRG=data.frame (Business_Legal_Name=CRG$`Business Legal Name`,
                       Business_Operating_Name=CRG$`Business Operating Name (if Different)`,
                       StreetAdress=CRG$`Street Address`,
                       County=CRG$County,
                       Email=CRG$Email,
                       Name = paste(CRG$`First Name`, CRG$`Last Name`),
                       Phone_Number=CRG$`Phone Number`,
                       Total_Previous_Grants_Received=CRG$`Award Value ($)`,
                       Grant_Types_Received=rep('CRG',nrow(CRG)))

MasterDB = data.frame (
                       Business_Legal_Name=c(0),
                       Business_Operating_Name=c(0),
                       StreetAdress=c(0),
                       County=c(0),
                       Email=c(0),
                       Name = c(0),
                       Phone_Number=c(0),
                       Total_Previous_Grants_Received=c(0),
                       Grant_Types_Received=c(0))

MasterDetectionDB = data.frame (
                       Business_Legal_Name=c(0),
                       Business_Operating_Name=c(0),
                       StreetAdress=c(0),
                       County=c(0),
                       Email=c(0),
                       Name = c(0),
                       Phone_Number=c(0),
                       Total_Previous_Grants_Received=c(0),
                       Grant_Types_Received=c(0))

#CopyDB_CRG$Business_Legal_Name[178]  = "Mohamed Mohamed CRG 1"
#CopyDB_CRG$Business_Legal_Name[455]  = "Mohamed Mohamed CRG 2"
#CopyDB_CRG$Business_Legal_Name[1675] = "Mohamed Mohamed CRG 3"

Detections=1  

i=1
while (i <= nrow(CopyDB_CRG)) {
  
  MasterDB=rbind(MasterDB,CopyDB_CRG[i,])
  i=i+1
} #end while loop

CopyDB_SBEL=data.frame (Business_Legal_Name              =SBEL_Receipients$`Business Legal Name`,
                        Business_Operating_Name          =SBEL_Receipients$`Business DBA`,
                        StreetAdress                     =SBEL_Receipients$Address,
                        County                           =SBEL_Receipients$County,
                        Email                            =rep(NA,nrow(SBEL_Receipients)),
                        Name                             =SBEL_Receipients$Owner1,
                        Phone_Number                     =rep(NA,nrow(SBEL_Receipients)),
                        Total_Previous_Grants_Received   =SBEL_Receipients$`Loan Amount`,
                        Grant_Types_Received             =rep('SBEL',nrow(SBEL_Receipients)))

i=1
m=1020
while (i <= m) {
  
  Name_B = CopyDB_SBEL$Business_Legal_Name[i]
  Name_Container = MasterDB$Business_Legal_Name == Name_B
  

  if(any(Name_Container,na.rm = TRUE) != TRUE | i == 1){
    
    MasterDB=rbind(MasterDB,CopyDB_SBEL[i,])
    }#end if
  if(any(Name_Container,na.rm = TRUE) == TRUE | i ==1){
    IndexDetect = match(TRUE,Name_Container)
    
    MasterDB$Total_Previous_Grants_Received[IndexDetect]=
      MasterDB$Total_Previous_Grants_Received[IndexDetect] + 
      CopyDB_SBEL$Total_Previous_Grants_Received[i]
  
    MasterDB$Grant_Types_Received[IndexDetect] = 
      paste(MasterDB$Grant_Types_Received[IndexDetect], CopyDB_SBEL$Grant_Types_Received[IndexDetect])
    
    Detections = Detections + 1
    MasterDetectionDB=rbind(MasterDetectionDB,CopyDB_SBEL[i,])
    }#end if
  
  i=i+1
}#end outer while loop
MCMT = Mainstreet_Cultural_Mall_Tenants

CopyDB_MCMT= data.frame (
              Business_Legal_Name                = MCMT$`Tenant Business Legal Name`,
              Business_Operating_Name            = rep(NA,nrow(MCMT)),
              StreetAdress                       = rep(NA,nrow(MCMT)),
              County                             = rep(NA,nrow(MCMT)),
              Email                              = rep(NA,nrow(MCMT)),
              Name                               = MCMT$`Tenant Business Owner Name`,
              Phone_Number                       = rep(NA,nrow(MCMT)),
              Total_Previous_Grants_Received     = MCMT$`$ Total Subgrant`,
              Grant_Types_Received               = rep('MCMT',nrow(MCMT)))

#NA fix before loop initiates
CopyDB_MCMT$Business_Legal_Name[632] = "MissingName"
CopyDB_MCMT$Business_Legal_Name[558] = "Mohamed Shifa Cultural Healing"
CopyDB_MCMT$Business_Legal_Name[73] = ' Mohamed Mohamed MCMT1'


#rewrite any(name_detect). 
#Currently gives partial matches contained in other strings instead of exact matches.

i=1
m=977

while (i <= m) {
  
  Name_B = CopyDB_MCMT$Business_Legal_Name[i]
  Name_Container = MasterDB$Business_Legal_Name == Name_B
 
  if(any(Name_Container, na.rm = TRUE) != TRUE | i == 1){
    # | i ==632 removed for now from logical expression
    MasterDB=rbind(MasterDB,CopyDB_MCMT[i,])
  }#end if
  
  if(any(Name_Container, na.rm = TRUE) == TRUE | i ==1 ){
    IndexDetect = match(TRUE,Name_Container)
    MasterDB$Total_Previous_Grants_Received[IndexDetect]=
      MasterDB$Total_Previous_Grants_Received[IndexDetect] + CopyDB_MCMT$Total_Previous_Grants_Received[i]
    
    
    MasterDB$Grant_Types_Received[IndexDetect] = 
      paste(MasterDB$Grant_Types_Received[IndexDetect], CopyDB_MCMT$Grant_Types_Received[IndexDetect])
    
    
    Detections = Detections + 1
    MasterDetectionDB=rbind(MasterDetectionDB,CopyDB_MCMT[i,])
    
    }#end if
  
  i=i+1
}#end outer while loop


SBRG = SBRG_Lottery_Final_Approvals_Distribution_List_rev

CopyDB_SBRG= data.frame (
  Business_Legal_Name                = SBRG$`Business Legal Name`,
  Business_Operating_Name            = SBRG$`Business Operating Name (if different)`,
  StreetAdress                       = SBRG$`Street Address`,
  County                             = SBRG$County,
  Email                              = rep(NA,nrow(SBRG)),
  Name                               = rep(NA,nrow(SBRG)),
  Phone_Number                       = rep(NA,nrow(SBRG)),
  Total_Previous_Grants_Received     = rep(10000,nrow(SBRG)),
  Grant_Types_Received               = rep('SBRG',nrow(SBRG)))

#NA detection and cleaning
CopyDB_SBRG$Business_Legal_Name[6147] = CopyDB_SBRG$Business_Operating_Name[6147]
CopyDB_SBRG$Business_Legal_Name[6148] = CopyDB_SBRG$Business_Operating_Name[6148]
CopyDB_SBRG$Business_Legal_Name[6149] = CopyDB_SBRG$Business_Operating_Name[6149]
CopyDB_SBRG$Business_Legal_Name[6150] = CopyDB_SBRG$Business_Operating_Name[6150]
CopyDB_SBRG$Business_Legal_Name[6151] = CopyDB_SBRG$Business_Operating_Name[6151]




i=1
m=6151
while (i <= m){
  
  
  Name_B = CopyDB_SBRG$Business_Legal_Name[i]
  Name_Container = MasterDB$Business_Legal_Name == Name_B
  
  if(any(Name_Container, na.rm = TRUE) != TRUE | i == 1){
    # | i ==632 removed for now from logical expression
    MasterDB=rbind(MasterDB,CopyDB_SBRG[i,])
  }#end if
  
  if(any(Name_Container, na.rm = TRUE) == TRUE | i ==1 ){
    IndexDetect = match(TRUE,Name_Container)
    MasterDB$Total_Previous_Grants_Received[IndexDetect]=
      MasterDB$Total_Previous_Grants_Received[IndexDetect] + CopyDB_SBRG$Total_Previous_Grants_Received[i]
    
    
    MasterDB$Grant_Types_Received[IndexDetect] = 
      paste(MasterDB$Grant_Types_Received[IndexDetect], CopyDB_SBRG$Grant_Types_Received[IndexDetect])
    
    
    Detections = Detections + 1
    MasterDetectionDB=rbind(MasterDetectionDB,CopyDB_SBRG[i,])
    
  }#end if
  
  i=i+1
  
} #end while loop

CRelief = County_Relief_Grants_Combined_Data_Project_Summary_Data
CopyDB_CRelief = data.frame(
  Business_Legal_Name                = CRelief$`County Relief Grants`,
  Business_Operating_Name            = CRelief$`County Relief Grants`,
  StreetAdress                       = rep(NA,nrow(CRelief)),
  County                             = CRelief$`County Relief Grants`,
  Email                              = rep(NA,nrow(CRelief)),
  Name                               = rep(NA,nrow(CRelief)),
  Phone_Number                       = rep(NA,nrow(CRelief)),
  Total_Previous_Grants_Received     = CRelief$...2,
  Grant_Types_Received               = rep('CountyRelief',nrow(CRelief)))

i=3
m=89

while (i <= m){
  
  
  Name_B = CopyDB_CRelief$Business_Legal_Name[i]
  Name_Container = MasterDB$Business_Legal_Name == Name_B
  
  if(any(Name_Container, na.rm = TRUE) != TRUE){
    # | i ==632 removed for now from logical expression
    MasterDB=rbind(MasterDB,CopyDB_CRelief[i,])
  }#end if
  
  if(any(Name_Container, na.rm = TRUE) == TRUE){
    IndexDetect = match(TRUE,Name_Container)
    MasterDB$Total_Previous_Grants_Received[IndexDetect]=
      as.numeric(MasterDB$Total_Previous_Grants_Received[IndexDetect]) + 
      as.numeric(CopyDB_CRelief$Total_Previous_Grants_Received[i])
    
    Detections = Detections + 1
    MasterDetectionDB=rbind(MasterDetectionDB,CopyDB_CRelief[i,])
    
  }#end if
  
  i=i+1
  
} #end while loop


ConvR = Convention_Center_Relief_Grant_Awardees
CopyDB_ConvR = data.frame(
  Business_Legal_Name                = ConvR$`Operating Convention Center Legal Name`,
  Business_Operating_Name            = ConvR$`Operating Convention Center Legal Name`,
  StreetAdress                       = rep(NA,nrow(ConvR)),
  County                             = rep(NA,nrow(ConvR)),
  Email                              = rep(NA,nrow(ConvR)),
  Name                               = rep(NA,nrow(ConvR)),
  Phone_Number                       = rep(NA,nrow(ConvR)),
  Total_Previous_Grants_Received     = ConvR$`Award  Amount`,
  Grant_Types_Received               = rep('ConventionRelief',nrow(ConvR)))

i=1
m=15

while (i <= m){
  
  
  Name_B = CopyDB_ConvR$Business_Legal_Name[i]
  Name_Container = MasterDB$Business_Legal_Name == Name_B
  
  if(any(Name_Container, na.rm = TRUE) != TRUE){
    # | i ==632 removed for now from logical expression
    MasterDB=rbind(MasterDB,CopyDB_ConvR[i,])
  }#end if
  
  if(any(Name_Container, na.rm = TRUE) == TRUE){
    IndexDetect = match(TRUE,Name_Container)
    
    MasterDB$Total_Previous_Grants_Received[IndexDetect]=
      as.numeric(MasterDB$Total_Previous_Grants_Received[IndexDetect]) + 
      as.numeric(CopyDB_ConvR$Total_Previous_Grants_Received[i])
    
    
    MasterDB$Grant_Types_Received[IndexDetect] = 
      paste(MasterDB$Grant_Types_Received[IndexDetect], CopyDB_ConvR$Grant_Types_Received[IndexDetect])
    
    
    Detections = Detections + 1
    MasterDetectionDB=rbind(MasterDetectionDB,CopyDB_ConvR[i,])
    
  }#end if
  
  i=i+1
  
} #end while loop


Movie = Movie_Theater_Relief_Grant_Awardees
CopyDB_Movie = data.frame(
  Business_Legal_Name                = Movie$`Movie Theater Name`,
  Business_Operating_Name            = Movie$`Movie Theater Name`,
  StreetAdress                       = rep(NA,nrow(Movie)),
  County                             = rep(NA,nrow(Movie)),
  Email                              = rep(NA,nrow(Movie)),
  Name                               = rep(NA,nrow(Movie)),
  Phone_Number                       = rep(NA,nrow(Movie)),
  Total_Previous_Grants_Received     = Movie$`Total Award Amount`,
  Grant_Types_Received               = rep('MovieTheaterRelief',nrow(Movie)))

i=1
m=73

while (i <= m){
  
  
  Name_B = CopyDB_Movie$Business_Legal_Name[i]
  Name_Container = MasterDB$Business_Legal_Name == Name_B
  
  if(any(Name_Container, na.rm = TRUE) != TRUE){
    # | i ==632 removed for now from logical expression
    MasterDB=rbind(MasterDB,CopyDB_Movie[i,])
  }#end if
  
  if(any(Name_Container, na.rm = TRUE) == TRUE){
    IndexDetect = match(TRUE,Name_Container)
    
    MasterDB$Total_Previous_Grants_Received[IndexDetect]=
      as.numeric(MasterDB$Total_Previous_Grants_Received[IndexDetect]) + 
      as.numeric(CopyDB_Movie$Total_Previous_Grants_Received[i])
    
    MasterDB$Grant_Types_Received[IndexDetect] = 
      paste(MasterDB$Grant_Types_Received[IndexDetect], CopyDB_Movie$Grant_Types_Received[IndexDetect])
    
    
    Detections = Detections + 1
    MasterDetectionDB=rbind(MasterDetectionDB,CopyDB_Movie[i,])
    
  }#end if
  
  i=i+1
  
} #end while loop

