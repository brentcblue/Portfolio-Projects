MasterDB_V3 = data.frame (
    Business_Legal_Name=c(0),
    Business_Operation_Entities=c(0),
    StreetAdress=c(0),
    County=c(0),
    Email=c(0),
    Name = c(0),
    Phone_Number=c(0),
    Total_Previous_Grants_Received=c(0),
    Grant_Types_Received=c(0))

MasterDB_V2 = MasterDB_Bland
#MasterDB_V2 = MasterDB

library(stringr)

#MasterDB$Name

i=1
m=13826

while ( i <=m) {
  if (is.na(MasterDB_V2$Business_Operating_Name[i]) == TRUE){
    MasterDB_V2$Business_Operating_Name[i] <- MasterDB_V2$Business_Legal_Name[i]
  }
  i=i+1
}

Detections2 = 1



#MasterDB_V2$Phone_Number[1240] = NA

i=1
while ( i <=m) {
    if (is.na(MasterDB_V2$Phone_Number[i]) == TRUE || MasterDB_V2$Phone_Number[i] == 0 ){
    MasterDB_V2$Phone_Number[i] = 100
  }
  i=i+1
}

i=1
n=1



while (i <= m){
  Phone_DB = MasterDB_V2$Phone_Number[i]
  #Email_DB = MasterDB_V2[i]
while (n <= m){
  
  if (Phone_DB == MasterDB_V2$Phone_Number[n] && Phone_DB[n] != 100) {
    MasterDB_V2$Business_Operating_Name[n] = paste(MasterDB_V2$Business_Operating_Name[i], MasterDB_V2$Business_Operating_Name[n])
  MasterDB_V2$Total_Previous_Grants_Received[i] = 
    as.numeric(MasterDB_V2$Total_Previous_Grants_Received[i]) +
    as.numeric(MasterDB_V2$Total_Previous_Grants_Received[n])
    Detections2 = 1 +1
  }
  
  
  n=n+1
}#end inner while
  
  i=i+1
  
} #end while loop
Detections2