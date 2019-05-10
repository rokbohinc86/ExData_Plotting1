library(data.table)
library(lubridate)
library(dplyr)

# set localtime so the days of the week come out in english
Sys.setlocale("LC_TIME", "C")

#load data
fdata="/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Exploratory Data Analysis/Week 1/ExData_Plotting1/data/household_power_consumption.txt"
data <- fread(fdata, na.strings = "?") 
# merge date and time and convert to posixct, selects the relevant columns, filters dates for 2007-02-01 and 2007-02-02
data <- data %>% 
        mutate(DateTime = dmy_hms(paste(data$Date, data$Time))) %>% 
        select(DateTime, Global_active_power:Sub_metering_3) %>%
        filter(DateTime>=ymd_hms("2007-02-01-00-00-00") & DateTime < ymd_hms("2007-02-03-00-00-00")) %>%
        tbl_df

# plot data and write to file
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power") 
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage") 
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering") 
points(data$DateTime, data$Sub_metering_1,col="black", type = "l") 
points(data$DateTime, data$Sub_metering_2,col="red", type = "l")
points(data$DateTime, data$Sub_metering_3,col="blue", type = "l")
legend("topright", col = c("black","red", "blue"), lty=1, legend=names(data)[6:8], bty = "n")
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power") 
dev.off()
