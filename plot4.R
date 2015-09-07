library(dplyr)

classes<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses=classes,na.strings = "?")
data<-data%>%select(Date:Sub_metering_3)
data<-data%>%filter(Date=="1/2/2007"|Date=="2/2/2007")
par(mfrow=c(2,2),mar=c(4,4,4,1))
x<-seq(0,nrow(data)-1,by=1)
data<-data%>%mutate(Time=x)
m<-nrow(filter(data,Date=="1/2/2007"))

with(data,plot(Time,Global_active_power,ylab="Global active power",xaxt="n",xlab="",main="",type="line"))
axis(1,at=c(0,m,nrow(data)),labels=c("Thu","Fri","Sat"))

with(data,plot(Time,Voltage,ylab="Voltage",xaxt="n",xlab="datetime",main="",type="line"))
axis(1,at=c(0,m,nrow(data)),labels=c("Thu","Fri","Sat"))

with(data,plot(Time,Sub_metering_1,ylab="Energy sub metering",xaxt="n",xlab="",main="",type="line"))
with(data,lines(Time,Sub_metering_2,col="red"))
with(data,lines(Time,Sub_metering_3,col="blue"))
axis(1,at=c(0,m,nrow(data)),labels=c("Thu","Fri","Sat"))
legend(x=max(data$Time)-1400,y=42,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),bty="n",cex=0.7)

with(data,plot(Time,Global_reactive_power,ylab="Global_reactive_power",xaxt="n",xlab="datetime",main="",type="line"))
axis(1,at=c(0,m,nrow(data)),labels=c("Thu","Fri","Sat"))

dev.copy(png,"plot4.png")
dev.off()

