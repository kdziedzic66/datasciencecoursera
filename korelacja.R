
 wczytaj<-function(i){
       if(i<10)
     read.csv(paste("00",as.character(i),".csv",sep=""))
       else
     read.csv(paste("0",as.character(i),".csv",sep=""))
}

 korelacja_1<-function(data,threshold){
   x<-data$nitrate
   y<-data$sulfate
   good<-complete.cases(x,y)
   x<-x[good]
   y<-y[good]
   if(length(x)>threshold)
      cor(x,y)
  else 
    NaN
}
 korelacja<-function(threshold=0,id=1:30){
   
   my_data<-lapply(id,wczytaj)
   v<-as.numeric(lapply(my_data,korelacja_1,threshold))
   v
}
