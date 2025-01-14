setwd("~/Documents/Swapnil/Data_Science/R_Projects/Exploratory Data Analysis/week1")
install.packages("sqldf")
library(sqldf)
input_df <- read.csv.sql("household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",sep=";")
input_df$datetime <- strptime(paste(input_df$Date, input_df$Time), format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
plot(input_df$datetime, input_df$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Enegy sub metering")
lines(input_df$datetime, input_df$Sub_metering_2, type = "l", col = "red")
lines(input_df$datetime, input_df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"))
dev.off()