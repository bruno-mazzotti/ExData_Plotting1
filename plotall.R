
################################################################################
##
## File: plot4.R
## Author: Bruno Franciscon Mazzotti <bruno.mazzotti@gmail.com>
##
## Course Project 1 - "Exploratory Data Analysis" course of J. H. University
## "Data Science Specialization" on Coursera.
##
## This file contains the "main function" source code of the course project. It
## loads the data and make all the plots with a single function.
##
################################################################################


source("getdata.R")
source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")


plot.all <- function()
{
    data <- get.data()

    message("Generating plots...")

    plot.1(data)
    plot.2(data)
    plot.3(data)
    plot.4(data)

    message("Done.")
}
