# loading libraries
library("dplyr")
# download zip file
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "zip_data.zip")
#unzip to txt file
unzip("zip_data.zip")
#load data
data_for_exercise<-read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
#transform into dplyr compatible format
data_for_exercise<-tbl_df(data_for_exercise)
# filter by date
filtered_data<-filter(data_for_exercise, Date=="1/2/2007"|Date=="2/2/2007")

#the problem is that we need to treat date AND time as a single field
filtered_data$Date_Time<-paste(filtered_data$Date,filtered_data$Time)
#and now format properly
filtered_data$Date_Time<-strptime(filtered_data$Date_Time, format="%d/%m/%Y %H:%M:%S")

# generate plot in png file
png(filename = "plot2.png", width = 480, height = 480)
with(filtered_data, plot(Date_Time,Global_active_power, type="l", xlab="", 
    ylab="Global Active Power (kilowatts)"))
#the axis marks are generated with the spanish abbreviations, as my operating system is Spanish
dev.off()
