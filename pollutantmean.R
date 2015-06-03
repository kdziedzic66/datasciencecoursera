pollutantmean<-function(pollutant,id){
    v<-0
    j<-length(id)
   for(i in 1:j)
    { 
     if(i<10)
       z<-read.csv(paste("00",as.character(i),".csv",sep=""))
     else
       z<-read.csv(paste("0",as.character(i),".csv",sep=""))
    z<-z[[pollutant]]
    v<-c(v,z)
    }
  bad<-is.na(v)
  v<-v[!bad]
  mean(v)
}