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




ggplot(Barca_Away_Data, aes(x=Date,y=FTAG, color = factor(FTHG))) + geom_point(shape = 2,aes(size = factor(FTHG))) + geom_text(aes(label = HomeTeam), check_overlap = TRUE) + scale_x_date(date_breaks = '2 week')

ggplot(Barca_Home_Data, aes(x=Date,y=FTHG, color = factor(FTAG))) + geom_point(shape = 2,aes(size = factor(FTAG))) + geom_text(aes(label = AwayTeam), check_overlap = TRUE) + scale_x_date(date_breaks = '2 week')




ggplot(Barca_Away_Data, aes(x=FTAG,y=FTHG)) + geom_point(size = 7,shape = 1, color = 'red') + geom_text(aes(label = HomeTeam), check_overlap = TRUE) #+ scale_x_date(date_breaks = '2 week')

       
