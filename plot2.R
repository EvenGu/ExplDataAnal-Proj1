## load data 
dF <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";")
names <- read.table("household_power_consumption.txt", nrow=1, sep=";", stringsAsFactors = F)
colnames(dF) <- names

dateTime <- paste(dF$Date,dF$Time,sep=" ")
dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
### plot2 ###
png(filename="plot2.png", width=480, height=480, units="px")
plot(dateTime, dF$Global_active_power, type = "l", xlab="", ylab="Global Active Power (killowatts)")
dev.off()
