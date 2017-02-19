df1 = read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

df2 = df1[ which(df$Date=='1/2/2007' | df$Date=='2/2/2007'), ]

df3 = na.omit(df2)

df4 = transform(df3, Date = as.Date(Date, "%m/%d/%Y"))

df4$dateTime <- with(df4, as.POSIXct(paste(format(Date, "%d/%m/%Y"), Time), 
                                     format="%m/%d/%Y %H:%M:%S"))

# Draw the three plots
plot(Sub_metering_1 ~ dateTime, df4, type="s", xlab="", ylab="Energy sub meetering")

with(df4, points(dateTime, Sub_metering_2, type="s", col="red"))

with(df4, points(dateTime, Sub_metering_3, type="s", col="blue"))

# Add legend
legend(c("topright"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lwd=c(2.5,2.5, 2.5), col=c("black", "red", "blue"))

# Write the plot to a file
dev.copy(png,'plot3.png')
dev.off()