library(data.table)

# load data
fdata="/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Exploratory Data Analysis/Week 1/Assighnment/ExData_Plotting1/data/household_power_consumption.txt"
data <- fread(fdata, skip = 66637, nrows = 2880, na.strings = "?")
names(data) <- names(fread(fdata, nrows = 1))

# merge date and time and convert to posixct
library(lubridate)
library(dplyr)
data <- data %>% mutate(DateTime = dmy_hms(paste(data$Date, data$Time))) %>% select(DateTime, Global_active_power:Sub_metering_3)

# plot data and write to file
png("plot3.png")
par(mfrow = c(1, 1))
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering") 
points(data$DateTime, data$Sub_metering_1,col="black", type = "l") 
points(data$DateTime, data$Sub_metering_2,col="red", type = "l")
points(data$DateTime, data$Sub_metering_3,col="blue", type = "l")
legend("topright", col = c("black","red", "blue"), lty=1, legend=names(data)[6:8])
dev.off()
#