## Genevieve Dupuis
## Exploratory Data Analysis, Course Project 1
## plot1



## load data into R
file <- "C:/Coursera/Course4/Week1/household_power_consumption.txt"
electric <- read.table(file, header = TRUE, sep=";",na.strings = "?")

## subset data for Feb. 1-2, 2007
febdat <- subset(electric, Date %in% c("1/2/2007","2/2/2007"))

## Create plot 1

with( febdat, hist(Global_active_power, col = "red", 
main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.copy(png,"plot1.png")
dev.off()