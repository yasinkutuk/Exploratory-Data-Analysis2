#@author:YasinKutuk
# Check if both data exist in the environment. If not, load the data.
if (!"neiData" %in% ls()) {
        neiData <- readRDS("./_coursera_expdata/assignment2/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
        sccData <- readRDS("./_coursera_expdata/assignment2/Source_Classification_Code.rds")
}

subset <- neiData[neiData$fips == "24510", ] 

head(sccData$Short.Name)



par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./_coursera_expdata/assignment2/plot4.png", 
    width = 480, height = 480, 
    units = "px")
coal <- grep("coal", sccData$Short.Name, ignore.case = T)
coal <- sccData[coal, ]
coal <- neiData[neiData$SCC %in% coal$SCC, ]

coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")
# options(scipen=0)
# options(scipen=999)
plot(coalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()