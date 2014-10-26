library(ggplot2)

nei<-readRDS("./summarySCC_PM25.rds")
scc<-readRDS("./Source_Classification_Code.rds")

vehicle<-grepl("Vehicles",scc$EI.Sector) 
vehicle_scc<-subset(scc,vehicle)

nei_baltimore<-subset(nei, nei$fips == "24510")
balt_vehicle_emissions<-subset(nei_baltimore, nei_baltimore$SCC %in% vehicle_scc$SCC)
balt_vehicle_emissions$city<-"Baltimore"

nei_LA<-subset(nei, nei$fips == "06037")
LA_vehicle_emissions<-subset(nei_LA, nei_LA$SCC %in% vehicle_scc$SCC)
LA_vehicle_emissions$city<-"Los Angeles"

combined_vehicle_emissions<-rbind(balt_vehicle_emissions, LA_vehicle_emissions)

png(file="./plot6.png")
g<-qplot(factor(year), data=combined_vehicle_emissions, geom="bar", weight = Emissions, fill=factor(city))
g + labs(title = expression("Baltimore vs. Los Angeles: Motor Vehicle Emissions of PM"[2.5]), y = expression("PM"[2.5]*" emissions (tons)"), x = "Years", fill = "City")
dev.off()