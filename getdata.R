
################################################################################
##
## File: getdata.R
## Author: Bruno Franciscon Mazzotti <bruno.mazzotti@gmail.com>
##
## Course Project 1 - "Exploratory Data Analysis" course of J. H. University
## "Data Science Specialization" on Coursera.
##
## This file contains source code to read and process the data used in the
## course project.
##
################################################################################


options(warn=-1)

suppressMessages(library(tools))
suppressMessages(library(data.table))

options(warn=0)


# Download zip file from course website and check its integrity.
download.raw.data <- function(raw.data.file)
{
    # Download file.

    base.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2F"
    file.url <- paste(base.url, "household_power_consumption.zip", sep="")

    message("Downloading raw data, please wait...")

    download.success <- download.file(file.url, destfile = raw.data.file,
                                      mode="wb", quiet=TRUE)

    if (download.success != 0)
    {
        stop("Could not download raw data file.")
    }

    # Compute MD5 hash of file content to check data integrity.

    data.md5 <- md5sum(raw.data.file)
    data.md5 <- data.md5[[raw.data.file]]

    if (data.md5 != "41f51806846b6b567b8ae701a300a3de")
    {
        stop("Raw data file seems to be corrupted or incomplete.")
    }

    message("Raw data downloaded.")
}


# Turn downloaded data into a tidy subset used in the project's plots.
process.raw.data <- function(raw.data.file, tidy.data.file)
{
    # Extract zip file.

    zip.content.file <- "household_power_consumption.txt"

    message("Processing raw data...")

    unzip(raw.data.file)

    if (!file.exists(zip.content.file))
    {
        stop("Could not extract compressed raw data file.")
    }

    # Read entire file as string data.

    cols <- rep("string", 9)
    data <- fread(zip.content.file, na.strings="?", sep=";", colClasses=cols,
                  showProgress=FALSE)

    # Subset data with only the dates of interest.

    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

    # Merge Date and Time columns into a single POSIXct column. Old columns are
    # droped.

    DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    DateTime <- as.POSIXct(DateTime)
    data <- subset(data, select=-c(1, 2))
    data <- cbind(DateTime, data)

    # Convert numeric columns from string to numeric data type.

    data[, Global_active_power := as.numeric(Global_active_power)]
    data[, Global_reactive_power := as.numeric(Global_reactive_power)]
    data[, Voltage := as.numeric(Voltage)]
    data[, Global_intensity := as.numeric(Global_intensity)]
    data[, Sub_metering_1 := as.numeric(Sub_metering_1)]
    data[, Sub_metering_2 := as.numeric(Sub_metering_2)]
    data[, Sub_metering_3 := as.numeric(Sub_metering_3)]

    # Remove extracted file to save disk space.

    file.remove(zip.content.file)

    # Save tidy data file.

    message("Saving tidy data...")

    write.table(data, file=tidy.data.file, sep=";")

    message("Raw data processed.")

    data
}


# Read tidy data file.
read.tidy.data <- function(tidy.data.file)
{
    data        <- read.csv("tidydata.txt", sep=";", quote="")
    names(data) <- gsub("\\.", "", gsub("X\\.", "", names(data)))

    data$DateTime       <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
    data$DateTime       <- as.POSIXct(data$DateTime)
    data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
    data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
    data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

    data
}


# Main file function. Do all the job to get and process data by calling other
# functions.
get.data <- function ()
{
    data <- NULL

    raw.data.file  <- "rawdata.zip"
    tidy.data.file <- "tidydata.txt"

    if (!file.exists(tidy.data.file))
    {
        if (!file.exists(raw.data.file))
        {
            download.raw.data(raw.data.file)
        }
        else
        {
            message("Raw data already present.")
        }

        data <- process.raw.data(raw.data.file, tidy.data.file)
    }
    else
    {
        message("Tidy data already present.")

        data <- read.tidy.data(tidy.data.file)
    }

    data
}
