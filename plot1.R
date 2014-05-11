library("sqldf")
mesql<- "select * from file where Date = '1/2/2007' or Date = '2/2/2007'"
medata<- read.csv.sql("household_power_consumption.txt", sql= mesql,sep=";")
png("plot1.png",width=480,height=480)
hist(medata$Global_active_power,main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()