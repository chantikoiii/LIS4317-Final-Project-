#dataset source: https://archive.ics.uci.edu/dataset/292/wholesale+customers

library(readr)
library(ggplot2)

#data munging
wholesale <- read_csv("Wholesale customers data.csv")

wholesale <- wholesale[,-c(2,5)]

HoReCa <- wholesale[wholesale$Channel == 1,]
HoReCa <- HoReCa[,-1]
HoReCa <- data.frame(colMeans(HoReCa))

Retail <- wholesale[wholesale$Channel == 2,]
Retail <- Retail[,-1]
Retail <- data.frame(colMeans(Retail))

#construct df for grouped bar chart
Location <- c(rep(c("Hotel/Restaurant/Café","Retail"),5))
Item <- c(rep("Fresh",2), rep("Dairy",2), rep("Frozen",2), rep("Detergents & \nPaper",2),rep("Deli",2))
avg <- c(HoReCa[1,],Retail[1,],HoReCa[2,],Retail[2,],HoReCa[3,],Retail[3,],HoReCa[4,],Retail[4,],HoReCa[5,],Retail[5,])

wholesale.gb <- data.frame(Location, Item, avg)

#generate graph
ggplot(wholesale.gb, aes(fill=Item, y=avg, x=Location)) +
  geom_bar(position="dodge",stat="identity") +
  ylab("Mean Spent (¤)") +
  ggtitle("Average Money Spent on Items (Ho/Re/Ca vs. Retail Stores)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_fill_manual(values = c("Fresh"="lightgreen","Dairy"="steelblue","Frozen"="darkmagenta","Detergents & \nPaper"="darkred", "Deli"="gold"))















