
source("getdata.R")


plot.1 <- function(data = NULL)
{
    if (is.null(data))
    {
        data <- get.data()
    }

    png(filename="plot1.png")

    hist(data$Global_active_power, col="red", main="Global Active Power",
         xlab="Global Active Power (kilowatts)")

    dev.off();
}
