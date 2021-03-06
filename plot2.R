library("sqldf")
mesql<- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
medata<- read.csv.sql("household_power_consumption.txt", sql= mesql,sep=";")
medata$Date<- as.Date(medata$Date, format= "%d/%m/%Y")
dt<- paste(medata$Date, medata$Time, sep=" ")
medata$Time<- strptime(medata$Time, format="%Y-%m-%d %H:%M:%S")
medata$datetime<- as.POSIXct(dt)
png("plot2.png",width=480,height=480)
plot(medata$datetime,medata$Global_active_power,xlab="",ylab="Global Active Power (kilowatt)",type="l")
dev.off()