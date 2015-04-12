# Exploratory Data Analysis
# Course Project 1
# Plot1

#Read Data

library(data.table)

# Read all data
all_data <- fread("household_power_consumption.txt",header=TRUE)

# Filter required date range
data <- all_data[as.Date(all_data$Date,'%d/%m/%Y')==as.Date("2007-02-01") | as.Date(all_data$Date,'%d/%m/%Y') == as.Date("2007-02-02"),]

# Convert to Date Time
data[,DT:=as.POSIXct(strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S'))]

# convert Not Null Values of global active power
active_power<-as.numeric(data$Global_active_power[data$Global_active_power!='?'])

# Histogram
hist(active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)" ,
     col="red")


#Copy to File
dev.copy(png, file="Plot1.png", width=480, height=480)

dev.off()
