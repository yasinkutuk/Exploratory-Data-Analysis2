#@author:YasinKutuk
# Check if both data exist in the environment. If not, load the data.
if (!"neiData" %in% ls()) {
        neiData <- readRDS("./_coursera_expdata/assignment2/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
        sccData <- readRDS("./_coursera_expdata/assignment2/Source_Classification_Code.rds")
}

subset <- neiData[neiData$fips == "24510", ] 



library(ggplot2)
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./_coursera_expdata/assignment2/plot3.png", 
    width = 480, height = 480, 
    units = "px")
g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
dev.off()
