
################################################################################
##
## File: plot4.R
## Author: Bruno Franciscon Mazzotti <bruno.mazzotti@gmail.com>
##
## Course Project 1 - "Exploratory Data Analysis" course of J. H. University
## "Data Science Specialization" on Coursera.
##
## This file contains the source code for the plot #4 of the course project.
##
################################################################################


################################################################################
# DEAR COURSERA COLLEAGUE, PLEASE PAY ATTENTION TO THIS NOTE: As stated in the
# course project description "Your code file should include code for reading
# the data so that the plot can be fully reproduced". Such code is present in
# the "getdata.R" file in the repo. Please take a look at it as well in the
# "plotall.R" file. THANKS!
################################################################################


source("getdata.R")


plot.4 <- function(data = NULL)
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
