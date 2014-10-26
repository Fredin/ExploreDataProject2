library(ggplot2)

nei<-readRDS("./summarySCC_PM25.rds")

nei_baltimore<-subset(nei, nei$fips == "24510")

png(file="./plot3.png")
g<-qplot(factor(year), data=nei_baltimore, geom="bar", weight = Emissions,
         fill=factor(type))
g + labs(title = expression("Total Emissions of PM"[2.5]*" in Baltimore by Source Type"), y = expression("PM"[2.5]*" emissions (tons)"), x = "Years", fill = "Source Type")
dev.off()