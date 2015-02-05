## Exploratary Data Analysis
## Course Project 1 - Plot4 
## 2/5/2015
## input file is located at http://archive.ics.uci.edu/ml/

## find lines starting with 1/2/2007 and 2/2/2007. ^ is used to specify starting
#### location of date strings
x<-grep("^1/2/2007|^2/2/2007",readLines("household_power_consumption.txt"))

# get column names as header are not retrieved correctly when skip is used
colnames = read.table("household_power_consumption.txt",header=TRUE,
                      sep=";",nrows=1)
# read lines starting with 1/2/2007 and 2/2/2007
rfile <- read.table("household_power_consumption.txt", 
                    sep=";", dec = ".",skip=x[1]-1,nrows=length(x),
                    na.strings="?",
                    col.names=names(colnames))

#combine date and time column into one and store it in Date column
rfile$Date <- as.POSIXct(paste(rfile$Date,rfile$Time),format="%d/%m/%Y %H:%M:%S")

#output to png file
png(file="plot4.png")
par(mfrow=c(2,2)) # divide the graph area in 4 blocks

#draw 1st graph
plot(rfile$Date,rfile$Global_active_power,type="l",
     xlab="",ylab="Global Active Power")

#draw 2nd graph
plot(rfile$Date, rfile$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

#draw 3rd graph
with(rfile, plot(Date,Sub_metering_1,col="black",type="l",
                 xlab="",ylab="Energy sub metering"))
with(rfile, lines(Date,Sub_metering_2,col="red"))
with(rfile, lines(Date,Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1), col=c("black","red","blue"),cex=.75,bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#draw 4th graph
plot(rfile$Date, rfile$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

#close the graph device
dev.off()