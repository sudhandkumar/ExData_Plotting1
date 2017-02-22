df1<-read.table("household_power_consumption.txt", header= TRUE, sep=";")
dfFeb <- df1[(df1$Date=="1/2/2007")|(df1$Date=="2/2/2007"),]
dfFeb2 <- dfFeb



# define all the variables

datetime<-strptime(paste(dfFeb2$Date,dfFeb2$Time),"%d/%m/%Y %H:%M:%S")

globalactivepower<-as.numeric(dfFeb2$Global_active_power)

submetering1<-as.numeric(dfFeb2$Sub_metering_1)
submetering2<-as.numeric(dfFeb2$Sub_metering_2)
submetering3<-as.numeric(dfFeb2$Sub_metering_3)

voltage_1<-as.numeric(dfFeb2$Voltage)

globalreactivepower<-as.numeric(dfFeb2$Global_reactive_power)


png("plot4.png",width=480,height = 480)
par(mfrow=c(2,2))
# First two plots in the first row

plot(datetime,globalactivepower,type="l",ylab="Global Active Power")
plot(datetime,voltage_1,type="l",xlab = "datetime", ylab="Voltage")

#Second two plots in the second row 

plot(datetime,submetering1,type="l",xlab="",ylab="Energy SubMetering")
lines(datetime,submetering2,type="l",col="red")
lines(datetime,submetering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))

plot(datetime,globalreactivepower,type="l",xlab = "datetime",ylab="Global reactive Power" )
dev.off()
