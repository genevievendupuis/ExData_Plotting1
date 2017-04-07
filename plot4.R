## Genevieve Dupuis
## Exploratory Data Analysis, Course Project 1
## plot4

## load data into R
file <- "C:/Coursera/Course4/Week1/household_power_consumption.txt"
electric <- read.table(file, header = TRUE, sep=";",na.strings = "?")

## subset data for Feb. 1-2, 2007
febdat <- subset(electric, Date %in% c("1/2/2007","2/2/2007")) 

## combine date and time for x-axis, add it to dataset
dtime <- paste(febdat$Date,febdat$Time)
dtime <- strptime(dtime, "%d/%m/%Y %H:%M:%S")
cbind(dtime, febdat)

## Create plot 4
## set up 2x2 plot display
par(mfrow = c(2,2))

## plot 4.1
with( febdat, plot(dtime, Global_active_power, type = "l", 
	ylab = "Global Active Power", xlab = ""))

## plot 4.2
with( febdat, plot(dtime, Voltage, type = "l", 
	ylab = "Voltage", xlab = "datetime"))

## plot 4.3
with( febdat, plot(dtime, Sub_metering_1, type = "l", 
	ylab = "Energy sub metering", xlab = "" ))
with( febdat, points(dtime, Sub_metering_2, type = "l", col = "red"))
with( febdat, points(dtime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	lty = 1, col = c("black", "red", "blue"), bty = "n")

## plot 4.4
with( febdat, plot(dtime, Global_reactive_power, type = "l", xlab = "datetime"))


dev.copy(png,"plot4.png")
dev.off()