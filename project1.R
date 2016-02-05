setwd("~/GitHub/ExData_Plotting1")

library(httr) 


pcdata <- "pcdata"
if(!file.exists(pcdata)){
        dir.create(pcdata)
} 
graphs <- "graphs" 
if(!file.exists(graphs)){
        dir.create(graphs)
}
pwcfile <- paste(getwd(), "/pcdata/household_power_consumption.zip", sep = "")
if(!file.exists(pwcfile)){
        download.file(fileurl1, destfile= pwcfile)
}
pwcfile <- paste(getwd(), "/pcdata/household_power_consumption.txt", sep = "")
if(!file.exists(pwcfile)){
        unzip(pwcfile, list = FALSE, overwrite = FALSE, exdir = pcdata)
}

subset_pwcfile <- paste(getwd(), "/pcdata/subset_pwcfile.rds", sep = "")
if(!file.exists(subset_pwcfile)){
        pcdata <- "pcdata/household_power_consumption.txt"
        convdata <- read.table(pcdata, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
        convdata$Time <- strptime(paste(convdata$Date, convdata$Time), "%d/%m/%Y %H:%M:%S")
        convdata$Date <- as.Date(convdata$Date, "%d/%m/%Y")
        dateconversion <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
        convdata <- subset(convdata, Date %in% dateconversion)
        subset_pwcfile <- paste(getwd(), "/", "pcdata", "/", "subset_pwcfile", ".rds", sep="")
        saveRDS(convdata, subset_pwcfile)
} else {
        pcdata <- "pcdata/subset_pwcfile.rds"
        convdata <- readRDS(pcdata)
}