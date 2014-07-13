indata <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
plotdata <- indata[indata$Date %in% c("1/2/2007","2/2/2007"),]
Combined_Datetime <-strptime(paste(plotdata$Date,plotdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
plotdata <- cbind(Combined_Datetime, plotdata)

png(file="plot2.png",width=480,height=480)
plot(plotdata$Combined_Datetime,plotdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts")
dev.off()