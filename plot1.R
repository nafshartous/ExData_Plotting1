df = read.table("household_power_consumption.txt", header=TRUE, sep=";", dec = ".")

df2 = df[ which(df$Date=='1/2/2007' | df$Date=='2/2/2007'), ]

z = transform(df2, Global_active_power = as.numeric(Global_active_power))

hist(z$Global_active_power, xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red", main="Global Active Power") 

dev.copy(png,'foo.png')
dev.off()