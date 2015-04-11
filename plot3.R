
################################################################################
##
## File: plot3.R
## Author: Bruno Franciscon Mazzotti <bruno.mazzotti@gmail.com>
##
## Course Project 1 - "Exploratory Data Analysis" course of J. H. University
## "Data Science Specialization" on Coursera.
##
## This file contains the source code for the plot #3 of the course project.
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


plot.3 <- function(data = NULL)
{
    if (is.null(data))
    {
        data <- get.data()
    }

    Sys.setlocale("LC_TIME", "English")

    png(filename="plot3.png")

    with(data,
    {
        plot(DateTime, Sub_metering_1, type="l", col="black",
             ylab="Energy sub metering", xlab="")

        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
    })

    names <- names(data)
    names <- names[grep("Sub_metering", names)]
    legend("topright", col=c("black", "red", "blue"), legend=names, lwd=1)

    dev.off()
}
