indata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
plotdata <- indata[indata$Date %in% c("1/2/2007","2/2/2007"),]
Combined_Datetime <-strptime(paste(plotdata$Date,plotdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
plotdata <- cbind(Combined_Datetime, plotdata)

png(file="plot3.png",width=480,height=480)

plot(plotdata$Combined_Datetime,plotdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

lines(plotdata$Combined_Datetime,plotdata$Sub_metering_2,type="l",col="red")

lines(plotdata$Combined_Datetime,plotdata$Sub_metering_3,type="l",col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.off()