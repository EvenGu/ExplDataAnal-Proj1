## load data 
dF <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";")
names <- read.table("household_power_consumption.txt", nrow=1, sep=";", stringsAsFactors = F)
colnames(dF) <- names

### plot1 ###
png(filename="plot1.png", width=480, height=480, units="px")
hist(dF$Global_active_power, col="red", xlab="Global Active Power (killowatts)", main="Global Active Power")
dev.off()
