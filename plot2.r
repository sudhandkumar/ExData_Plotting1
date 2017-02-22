df1<-read.table("household_power_consumption.txt", header= TRUE, sep=";")

#Convert the columns to the relevant types date column as Date and  Time column as time 
dfFeb <- df1[(df1$Date=="1/2/2007")|(df1$Date=="2/2/2007"),]

dfFeb2 <- dfFeb

datetime<-strptime(paste(dfFeb2$Date,dfFeb2$Time),"%d/%m/%Y %H:%M:%S")
globalactivepower<-as.numeric(dfFeb2$Global_active_power)
png("plot2.png",width=480,height = 480)
plot(datetime,globalactivepower,type="l",xlab="",ylab="Global Active Power(Kilowatt hours)")
dev.off()
