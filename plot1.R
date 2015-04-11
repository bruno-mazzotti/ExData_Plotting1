
################################################################################
##
## File: plot1.R
## Author: Bruno Franciscon Mazzotti <bruno.mazzotti@gmail.com>
##
## Course Project 1 - "Exploratory Data Analysis" course of J. H. University
## "Data Science Specialization" on Coursera.
##
## This file contains the source code for the plot #1 of the course project.
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
