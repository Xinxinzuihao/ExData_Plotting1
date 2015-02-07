####read in data, subset for "2007-02-01" and "2007-02-02" 
data=read.table(choose.files(),sep = ";", header=T)
#twoday=read.table(choose.files(), header=T)
twoday=data[data[,1] %in% c("1/2/2007", "2/2/2007"),]


####then add the weekday column, and date time column
datetime=paste(twoday$Date, twoday$Time)
twoday$DateTimes=strptime(datetime, "%d/%m/%Y %H:%M:%S")
twoday$weekday=weekdays(twoday$DateTimes)
#write.table(twoday, file="twodaysdata.txt",row.names = F)

###plot4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#first plot
plot(twoday$DateTimes,as.numeric(as.character(twoday$Global_active_power)),type="l",xlab="",ylab="Global Active Power")
#second plot
plot(twoday$DateTimes,as.numeric(as.character(twoday$Voltage)),type="l",xlab="datetime",ylab="Voltage")
#third plot
plot(twoday$DateTimes,as.numeric(as.character(twoday$Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering")
lines(twoday$DateTimes,as.numeric(as.character(twoday$Sub_metering_2)), type="l", col="red")
lines(twoday$DateTimes,as.numeric(as.character(twoday$Sub_metering_3)), type="l", col="blue")
legend('topright', names(twoday)[7:9], lty=1, col=c("black","red", "blue"), bty='n')
#fourth plot
plot(twoday$DateTimes,as.numeric(as.character(twoday$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()