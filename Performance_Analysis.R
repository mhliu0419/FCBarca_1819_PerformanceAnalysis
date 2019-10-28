library(dplyr)
library(ggplot2)

df <- read.csv('/Users/ml4274/Downloads/season-1819.csv')

Barca_Home_Data <- filter(df, HomeTeam == 'Barcelona')
Barca_Home_Data$Date <- as.Date(Barca_Home_Data$Date, format = "%d/%m/%Y")


Barca_Away_Data <- filter(df, AwayTeam == 'Barcelona')
Barca_Away_Data$Date <- as.Date(Barca_Away_Data$Date, format = "%d/%m/%Y")



Total_Data <- rbind(Barca_Away_Data, Barca_Home_Data)
Total_Data$Date <- as.Date(Total_Data$Date, format = "%d/%m/%Y")

Barca_Total_Data <- arrange(Total_Data, Date)


ggplot(Barca_Away_Data, aes(x=Date,y=FTAG)) + geom_point() + geom_text(aes(label = HomeTeam), check_overlap = TRUE) + scale_x_date(date_breaks = '2 week')

ggplot(Barca_Home_Data, aes(x=Date,y=FTHG)) + geom_point() + geom_text(aes(label = AwayTeam), check_overlap = TRUE) + scale_x_date(date_breaks = '2 week')

