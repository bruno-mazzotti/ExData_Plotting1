
source("getdata.R")


plot.4 <- function(data)
{
    if (is.null(data))
    {
        data <- get.data()
    }

    Sys.setlocale("LC_TIME", "English")

    png(filename="plot4.png")

    par(mfrow = c(2, 2))

    with(data,
    {
        # Plot (1, 1)

        plot(DateTime, Global_active_power, type="l",
             ylab="Global Active Power", xlab="")

        # Plot (1, 2)

        plot(DateTime, Voltage, type="l", xlab="datetime")

        # Plot (2, 1)

        plot(DateTime, Sub_metering_1, type="l", col="black",
             ylab="Energy sub metering", xlab="")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")

        names <- names(data)
        names <- names[grep("Sub_metering", names)]
        legend("topright", col=c("black", "red", "blue"), legend=names, lwd=1,
               bty="n")

        # Plot (2, 2)

        plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
    })

    dev.off()
}
