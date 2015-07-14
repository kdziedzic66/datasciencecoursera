  library(data.table)

  activity_train<-read.table("y_train.txt",header=FALSE)
  activity_test<-read.table("y_test.txt",header=FALSE)
  activity<-rbind(activity_train,activity_test)
  activitiesNames<-c("walking","walkingUp","walkingDown","sitting","standing","laying")
     for(k in 1:6)
       activity[activity==k]<-activitiesNames[k]
   
  subject_train<-read.table("subject_train.txt",header=FALSE)
  subject_test<-read.table("subject_test.txt",header=FALSE)
  subject<-rbind(subject_train,subject_test)
   
  df<-cbind(subject,activity)
  
   fileNames<-c("body_acc_x_train.txt" , "body_acc_x_test.txt", "body_acc_y_train.txt","body_acc_y_test.txt",
    "body_acc_z_train.txt","body_acc_z_test.txt","body_gyro_x_train.txt","body_gyro_x_test.txt","body_gyro_y_train.txt",
    "body_gyro_y_test.txt","body_gyro_z_train.txt","body_gyro_z_test.txt","total_acc_x_train.txt","total_acc_x_test.txt","total_acc_y_train.txt",
          "total_acc_y_test.txt","total_acc_z_train.txt","total_acc_z_test.txt"  )
    
    iter<-1

    while(iter<length(fileNames)){
               
  temp1<-read.table(fileNames[iter],header=FALSE)
  temp2<-read.table(fileNames[iter+1],header=FALSE)
  temp<-rbind(temp1,temp2)
  x<-apply(temp,1,sd)
  y<-apply(temp,1,mean)
  dt<-cbind(x,y)
  df<-cbind(df,dt)
  iter<-iter+2
  }
   
  
  df<-data.table(df)
  names(df)<-c("Subj","Act","BASdX","BAMX","BASdY","BAMY","BASdZ","BAMZ","BGSdX","BGMX","BGSdY","BGMY","BGSdZ",
    "BGMZ","TASdX","TAMX","TASdY","TAMY","TASdZ","TAMZ")

  newFeaturesNames<-c("Avg1S","Avg1A","Avg2S","Avg2A","Avg3S","Avg3A","Avg4S","Avg4A","Avg5S","Avg5A","Avg6S","Avg6A",
            "Avg7S","Avg7A","Avg8S","Avg8A","Avg9S","Avg9A","Avg10S","Avg10A","Avg11S","Avg11A","Avg12S","Avg12A",
             "Avg13S","Avg13A","Avg14S","Avg14A","Avg15S","Avg15A","Avg16S","Avg16A","Avg17S",
              "Avg17A","Avg18S","Avg18A")

   tempNames<-c("BASdX","BAMX","BASdY","BAMY","BASdZ","BAMZ","BGSdX","BGMX","BGSdY","BGMY","BGSdZ",
    "BGMZ","TASdX","TAMX","TASdY","TAMY","TASdZ","TAMZ")
  
     
    df$Subj<-as.factor(df$Subj)
    df$Act<-as.factor(df$Act)

    for(i in 1:length(tempNames)){
         temp1<-tapply(df[[tempNames[i]]],df$Subj,mean)
         temp2<-tapply(df[[tempNames[i]]],df$Act,mean)
         df[,newFeaturesNames[2*i-1]:=temp1[df$Subj]]
         df[,newFeaturesNames[2*i]:=temp2[df$Act]]
     }
  
    
  write.table(df,"tidyData.txt",row.names=FALSE)
 
