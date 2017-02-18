df = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

df2 = df[ which(df$Date=='1/2/2007' | df$Date=='2/2/2007'), ]

df3 = na.omit(df2)

hist(df3$Global_active_power, xlab="Global Active Power (kilowatts)", 
      ylab="Frequency", col="Red", main="Global Active Power") 

dev.copy(png,'plot1.png')
dev.off()