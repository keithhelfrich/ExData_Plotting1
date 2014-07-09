########                     Exploratory Data Analysis -- Project 1          ########
## Plot 4

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

## open png device & set mfrow
png(file="plot4.png")
par(mfrow=c(2,2))

## render top left
plot(data$Global_active_power,typ="l",ylab="Global Active Power",xaxt='n')
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

## render top right
plot(data$Voltage,typ="l",ylab="Voltage",xaxt='n',xlab="datetime")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

## render bottom left
plot(data$Sub_metering_1,typ="l",ylab="Energy sub metering",xaxt='n')
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), seg.len=3, bty="n")


## render bottom right
plot(data$Global_reactive_power,typ="l",ylab="Global_reactive_power",xaxt='n',xlab="datetime")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

## close the device
dev.off()
