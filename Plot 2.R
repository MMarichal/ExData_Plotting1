########## FINAL QUIZ WEEK 1 - EXPLORATORY DATA ANALYSIS ##########

##### ATTRIBUTE INFORMATION #####

#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss
#Global_active_power: household global minute-averaged active power (in kilowatt)
#Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#Voltage: minute-averaged voltage (in volt)
#Global_intensity: household global minute-averaged current intensity (in ampere)
#Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.


##### WD #####
setwd("C:/Users/Maxi/Desktop/R Coursera/4 - Exploratory Data Analysis/Week 1/Quiz")


########## PLOT 2 ##########

##### DATASET #####
d <- read.csv("./Data/household_power_consumption.txt", sep = ";")
head(d)

##### SUBSET #####
d1 <- subset(d, d$Date=="1/2/2007" | d$Date=="2/2/2007")

# Transforming Date and Time vars from characters into objects of type Date and POSIXlt respectively
d1$Date <- as.Date(d1$Date, format="%d/%m/%Y")
d1$Time <- strptime(d1$Time, format="%H:%M:%S")
d1[1:1440,"Time"] <- format(d1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
d1[1441:2880,"Time"] <- format(d1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot.new()

# Basic plot function
png("plot2.png", width = 480, height = 480, units = "px") #create png file
plot(d1$Time, as.numeric(as.character(d1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time") #add main title
dev.off() #close file
