
#################### ExData_Plotting1 Plot#4  Project. 

setwd("~/Coursera/Coursera 4/Week 1") # Set working directory

## Load libraries
library(dplyr)
library(lubridate)
library(data.table)

#load data. This can take a minute or two.
df <-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Convert the data to date format and create "DateTime" for time series
df$Date <-dmy(df$Date)
df$DateTime <-paste(df$Date, df$Time)
df$DateTime <-ymd_hms(df$DateTime)

#Create the data to be used for the graphs
dfdata <-filter(df, Date>"2007-01-31" & Date<"2007-02-02")

#Convert the data in the filtered data set to numberic for the graphs. 
dfdata$Global_intensity <-as.numeric(as.character(dfdata$Global_intensity))
dfdata$Global_active_power <-as.numeric(as.character(dfdata$Global_active_power))
dfdata$Voltage <-as.numeric(as.character(dfdata$Voltage))
dfdata$Global_reactive_power <-as.numeric(as.character(dfdata$Global_reactive_power))
dfdata$Sub_metering_1 <-as.numeric(as.character(dfdata$Sub_metering_1))
dfdata$Sub_metering_2 <-as.numeric(as.character(dfdata$Sub_metering_2))
dfdata$Sub_metering_3 <-as.numeric(as.character(dfdata$Sub_metering_3))

#Create the plot4 graph and save to png file.
par(mfrow=c(2,2)) #creates the formant or the 2 by 2 graph
plot(dfdata$DateTime,dfdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(dfdata$DateTime,dfdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dfdata$DateTime,dfdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dfdata$DateTime,dfdata$Sub_metering_2,col="red")
lines(dfdata$DateTime,dfdata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "))
plot(dfdata$DateTime,dfdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()




            
            