#Code for Detection of past grants For Priority Selection

library(stringr)
library(dplyr)

#lower case remove spaces
# tolower(a)
# b=tolower(a)
#Remove punctuation from strings
#Due to text formatting, It must be before the space removal
# str_replace_all(b2,'[[:punct:]]','')
# str_replace_all(b,' ','')

#Detect for single case, Returns full list of binaries.
# str_detect(a,Data1)

BLN_CRG = CRG_New_Copy$`Business Legal Name`
BOP_CRG = CRG_New_Copy$`Business Operating Name (if Different)`

BLN_CRG = tolower(BLN_CRG)
BLN_CRG = na_if(BLN_CRG,'na')
BLN_CRG = str_replace_all(BLN_CRG,'[[:punct:]]','')
BLN_CRG = str_replace_all(BLN_CRG,' ','')
BLN_CRG[is.na(BLN_CRG)]=0


BOP_CRG = tolower(BOP_CRG)
BOP_CRG = str_replace_all(BOP_CRG,'[[:punct:]]','')
BOP_CRG = str_replace_all(BOP_CRG,' ','')
BOP_CRG[is.na(BOP_CRG)]=0

MovieTheaterName = Copy_of_Movie_Theater_and_Convention_Center_Awardees_Brandon_Toner$`Operating Movie Theater Legal Name`
MovieTheaterName = tolower(MovieTheaterName)
MovieTheaterName = str_replace_all(MovieTheaterName,'[[:punct:]]','')
MovieTheaterName = str_replace_all(MovieTheaterName,' ','')
MovieTheaterName[is.na(MovieTheaterName)]=0

SBRG_BLN=SBRG_Lottery_Final_Approved_Awards_rev$`Business Legal Name`
SBRG_BLN = tolower(SBRG_BLN)
SBRG_BLN = str_replace_all(SBRG_BLN,'[[:punct:]]','')
SBRG_BLN = str_replace_all(SBRG_BLN,' ','')
SBRG_BLN[is.na(SBRG_BLN)]=0

SBEL_BLN = SBEL_List_Final$`Business Legal Name`
SBEL_BLN = tolower(SBEL_BLN)
SBEL_BLN = str_replace_all(SBEL_BLN,'[[:punct:]]','')
SBEL_BLN = str_replace_all(SBEL_BLN,' ','')
SBEL_BLN[is.na(SBEL_BLN)]=0

County_BLN=County_Relief_Grants_Combined_Data_Clean_revised6821_2_digit_NAICS_Project_Summary_Data$`Business Name`
County_BLN = tolower(County_BLN)
County_BLN = str_replace_all(County_BLN,'[[:punct:]]','')
County_BLN = str_replace_all(County_BLN,' ','')
County_BLN[is.na(County_BLN)]=0



BN_Detection_movie        = matrix(0,length(BLN_CRG),1)
BN_Detection_SBRG         = matrix(0,length(BLN_CRG),1)
BN_Detection_SBEL         = matrix(0,length(BLN_CRG),1)
BN_Detection_CountyRelief = matrix(0,length(BLN_CRG),1)

i  = 1
m1 = 1
m2 = 1
m3 = 1
m4 = 1
while (i <= length(BLN_CRG)) {
  thread1=BLN_CRG[i]
  #thread2=BOP_CRG[i]
  
  if (BLN_CRG[i] != '0') {
    
    
    while (m1 <= length(MovieTheaterName)) {
        if (thread1 == MovieTheaterName[m1]) {
        #a=1
        BN_Detection_movie[i] = 1
        }#end if
      m1=m1+1
    }#end while
    m1=1
    
    while (m2 <= length(SBRG_BLN)) {
      
      if (thread1 == SBRG_BLN[m2] && SBRG_BLN[m2] != '0') {
        #a=1
        BN_Detection_SBRG[i] = 1
      }#end if
      m2=m2+1
    }#end while
    m2=1
    
    while (m3 <= length(SBEL_BLN)) {
      
      if (thread1 == SBEL_BLN[m3] && SBEL_BLN[m3] != '0') {
        #a=1
        BN_Detection_SBEL[i] = 1
      }#end if
      m3=m3+1
    }#end while
    m3=1    
    
    while (m4 <= length(County_BLN)) {
      
      if (thread1 == County_BLN[m4] && County_BLN[m4] != '0') {
        #a=1
        BN_Detection_CountyRelief[i] = 1
      }#end if
      m4=m4+1
    }#end while
    m4=1    
    
    
    
  }#end if
 
  #a=0
  i=i+1
}#End while loop
