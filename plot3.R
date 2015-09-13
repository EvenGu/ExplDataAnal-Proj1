## load data 
dF <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";")
names <- read.table("household_power_consumption.txt", nrow=1, sep=";", stringsAsFactors = F)
colnames(dF) <- names

dateTime <- paste(dF$Date,dF$Time,sep=" ")
dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
### plot3 ###
png(filename="plot3.png", width=480, height=480, units="px")
plot(rep(dateTime,3), cbind(dF$Sub_metering_1, dF$Sub_metering_2, dF$Sub_metering_3), type = "n", xlab="", ylab="Energy sub metering")
lines(dateTime, dF$Sub_metering_1, col="black")
lines(dateTime, dF$Sub_metering_2, col="red")
lines(dateTime, dF$Sub_metering_3, col="blue")
legend("topright", lty="solid", col=c("black","red","blue"), legend=colnames(dF)[7:9])
dev.off()
