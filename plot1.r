# read the txt file , with the separator = ";"
df1<-read.table("household_power_consumption.txt", header= TRUE, sep=";")

#df1$Date <-as.Date(df1$Date,"%d/%m/%y")
#df1$Time <- strptime(df1$Time,'%H:%M:%S')

#Convert the columns to the relevant types date column as Date and  Time column as time 
dfFeb <- df1[(df1$Date=="1/2/2007")|(df1$Date=="2/2/2007"),]

Global_active_power<-as.numeric(dfFeb$Global_active_power)
png("plot1.png",width=480,height = 480)
hist(Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(Kilowatts)")
dev.off()

