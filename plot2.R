library(data.table)

#load data
fdata="/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Exploratory Data Analysis/Week 1/Assighnment/ExData_Plotting1/data/household_power_consumption.txt"
data <- fread(fdata, skip = 66637, nrows = 2880, na.strings = "?")
names(data) <- names(fread(fdata, nrows = 1))

# merge date and time and convert to posixct
library(lubridate)
library(dplyr)
data <- data %>% mutate(DateTime = dmy_hms(paste(data$Date, data$Time))) %>% select(DateTime, Global_active_power:Sub_metering_3)

# plot data
par(mfrow = c(1, 1))
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 
# copy to file
dev.copy(device = png, file = "plot2.png") 
dev.off()
#