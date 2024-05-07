abc=New_Disburse_OBIEE_for$`Supplier Long Desc`
BigList=New_Disburse_OBIEE_for$`Voucher Id`

def=rep(0,1)
def[1]="WOMEN VENTURE"

Filez=rep(0,100)

#paste0('v#',BigList[1])

i=1
j=1
z=1
while (i<= 60){
  word=abc[i]
  while (j<=1){
    if (word == def[1]){
      Filez[z] = BigList[i]
      z=z+1
    }#end if
    j=j+1
  }#end inner loop
  i=i+1
  j=1
}#end outer loop


#abc = tolower(abc)
# = na_if(abc,'NA')
#abc = str_replace_all(abc,'[[:punct:]]','')
#abc = str_replace_all(abc,' ','')
#abc[is.na(abc)]=0