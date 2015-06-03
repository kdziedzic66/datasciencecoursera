random_walk <- function(steps,pr){
    
    z<-0
    for(i in 1:steps){
     k<-rbinom(1,1,pr)
     if(k==1)
       z<-z+1
      else
       z<-z-1
     print(z)
   }
}