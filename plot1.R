########                     Exploratory Data Analysis -- Project 1          ########
## Plot 1

## Read Data
hpc<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)

## subset only Feb 1 & Feb 2, 2007
feb1<-subset(hpc,hpc$Date =="1/2/2007")
feb2<-subset(hpc,hpc$Date =="2/2/2007")
data<-rbind(feb1,feb2)

## remove periferal objects
rm(feb1,feb2,hpc)

## Create a 'Timestamp' of class 'Date'
data$Timestamp<-paste(data$Date,data$Time)
data$Timestamp<-as.Date(strptime(data$Timestamp, format="%d/%m/%Y %H:%M:%S"))

## render plot 1
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowats)")

## copy into png
dev.copy(png, file="plot1.png")
dev.off()

