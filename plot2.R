df1 = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

df2 = df1[ which(df$Date=='1/2/2007' | df$Date=='2/2/2007'), ]

df3 = na.omit(df2)

df4 = transform(df3, Date = as.Date(Date, "%m/%d/%Y"))

df4$dateTime <- with(df4, as.POSIXct(paste(format(Date, "%d/%m/%Y"), Time), 
                                     format="%m/%d/%Y %H:%M:%S"))

plot(Global_active_power ~ dateTime, df4, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,'plot2.png')
dev.off()