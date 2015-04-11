
source("getdata.R")
source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")


plot.all <- function()
{
    data <- get.data()

    plot.1(data)
    plot.2(data)
    plot.3(data)
    plot.4(data)
}
