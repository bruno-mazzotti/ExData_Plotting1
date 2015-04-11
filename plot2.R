
source("getdata.R")


plot.2 <- function(data)
{
    if (is.null(data))
    {
        data <- get.data()
    }

    Sys.setlocale("LC_TIME", "English")

    png(filename="plot2.png")

    with(data, plot(DateTime, Global_active_power, type="l",
                    ylab="Global Active Power (kilowatts)", xlab=""))

    dev.off()
}
