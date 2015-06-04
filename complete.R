complete<-function(id=1:30){
    z<-vector()
    length(z)<-length(id)
        for(i in 1:length(id))
         {
          if(i<10)
        x<- read.csv(paste("00",as.character(i),".csv",sep=""))
          else
        x<- read.csv(paste("0",as.character(i),".csv",sep=""))
       x<-c(x["nitrate"],x["sulfate"])
       x<-complete.cases(x)
       z[i]<-length(x)
      }
   df<-data.frame(monitor_id=id,total=z)
   write.table(df,file="complete.csv",sep=",")
   df
}