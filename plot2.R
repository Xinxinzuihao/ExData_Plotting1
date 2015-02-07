###read in data, subset for "2007-02-01" and "2007-02-02" 
data=read.table(choose.files(),sep = ";", header=T)
twoday=data[data[,1] %in% c("1/2/2007", "2/2/2007"),]

####then add the weekday column, and date time column
datetime=paste(twoday$Date, twoday$Time)
twoday$DateTimes=strptime(datetime, "%d/%m/%Y %H:%M:%S")
twoday$weekday=weekdays(twoday$DateTimes)
#write.table(twoday, file="twodaysdata.txt",row.names = F)

###plot2
png("plot2.png", width=480, height=480)
plot(twoday$DateTimes,as.numeric(as.character(twoday$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()