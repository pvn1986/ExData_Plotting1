# Exploratory Data Analysis
# Course Project 1
# Plot3

#Read Data

library(data.table)

# Read all data
all_data <- fread("household_power_consumption.txt",header=TRUE)

# Filter required date range
data <- all_data[as.Date(all_data$Date,'%d/%m/%Y')==as.Date("2007-02-01") | as.Date(all_data$Date,'%d/%m/%Y') == as.Date("2007-02-02"),]

# Convert to Date Time
data[,DT:=as.POSIXct(strptime(paste(data$Date,data$Time),format='%d/%m/%Y %H:%M:%S'))]


# Defining file device as resolution varies after screen output
png(filename="Plot3.png", width=480, height=480)

# Plot Graph
plot(data$DT,as.numeric(data$Sub_metering_1[data$Sub_metering_1!='?']), 
     type = "l",
     xlab="",
     ylab="Energy sub metering")
lines(data$DT,as.numeric(data$Sub_metering_2[data$Sub_metering_2!='?']), type = "l",col="red")
lines(data$DT,as.numeric(data$Sub_metering_3[data$Sub_metering_3!='?']), type = "l",col="blue")

legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black","red","blue"),
       cex=1)
     


#Copy to File
# dev.copy(png, file="Plot3.png", width=480, height=480)

dev.off()
