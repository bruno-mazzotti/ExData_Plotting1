
source("getdata.R")


plot.3 <- function(data = NULL)
{
    if (is.null(data))
    {
        data <- get.data()
    }

    Sys.setlocale("LC_TIME", "English")

    png(filename="plot3.png")

    with(data, plot(DateTime, Sub_metering_1, type="l", col="black",
                    ylab="Energy sub metering", xlab=""))
    with(data, lines(DateTime, Sub_metering_2, col="red"))
    with(data, lines(DateTime, Sub_metering_3, col="blue"))

    names <- names(data)
    names <- names[grep("Sub_metering", names)]
    legend("topright", col=c("black", "red", "blue"), legend=names, lwd=1)

    dev.off()
}
