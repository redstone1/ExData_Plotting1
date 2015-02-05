## Exploratary Data Analysis
## Course Project 1 - Plot2 
## 2/4/2015
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

# open png graphic device
png(file="plot2.png")

## plot the graph
plot(rfile$Date,rfile$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

#close the graph device
dev.off()