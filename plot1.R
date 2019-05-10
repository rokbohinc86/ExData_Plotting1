library(data.table)

#Load data 
fdata="/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Exploratory Data Analysis/Week 1/Assighnment/ExData_Plotting1/data/household_power_consumption.txt"
data <- fread(fdata, skip = 66637, nrows = 2880, na.strings = "?") # Take only columns  2007-02-01 and 2007-02-02
# Give appropriate column names
names(data) <- names(fread(fdata, nrows = 1))

#plot histogram
par(mfrow = c(1, 1))
hist(data$Global_active_power, xlab="Global active power (kilowatts)", col = "red", main="Global Active Power")
#copy to file
dev.copy(device = png, file = "plot1.png") 
dev.off()
#