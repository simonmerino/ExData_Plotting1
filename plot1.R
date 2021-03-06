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
# generate plot in png file
png(filename = "plot1.png", width = 480, height = 480)
hist(filtered_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", col="red")
dev.off()
