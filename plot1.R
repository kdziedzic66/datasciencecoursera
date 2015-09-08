
library(dplyr)

classes<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses=classes,na.strings = "?")
data<-data%>%select(Date:Sub_metering_3)
data<-data%>%filter(Date=="1/2/2007"|Date=="2/2/2007")
par(mfrow=c(1,1),mar=c(4,4,2,2))
with(data,hist(Global_active_power,xlab="Global active power (kilowatts)",main="Global Active Power",col="red",ylim=c(0,1200)))

dev.copy(png,"plot1.png")
dev.off()

