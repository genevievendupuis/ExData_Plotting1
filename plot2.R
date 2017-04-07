## Genevieve Dupuis
## Exploratory Data Analysis, Course Project 1
## plot2


## load data into R
file <- "C:/Coursera/Course4/Week1/household_power_consumption.txt"
electric <- read.table(file, header = TRUE, sep=";",na.strings = "?")

## subset data for Feb. 1-2, 2007
febdat <- subset(electric, Date %in% c("1/2/2007","2/2/2007")) 

## combine date and time for x-axis, add it to dataset
dtime <- paste(febdat$Date,febdat$Time)
dtime <- strptime(dtime, "%d/%m/%Y %H:%M:%S")
cbind(dtime, febdat)

## Create plot 2
with( febdat, plot(dtime, Global_active_power, type = "l", 
	ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png,"plot2.png")
dev.off()