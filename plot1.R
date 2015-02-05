## Exploratary Data Analysis
## Course Project 1 - Plot1 
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

#open png graphic device
png(file="plot1.png")

## create histogram
hist(rfile$Global_active_power, main="Global Active Power", col="red",
     xlab="Global Active Power(kilowatts)")

#close the graphic device
dev.off()