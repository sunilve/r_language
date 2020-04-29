#Homeowrk 6
library(ggplot2)
library(dplyr)
setwd("C:\\Users\\Sunil\\Desktop")
getwd()
movies<-read.csv("homework6.csv")
movies
str(movies)
nrow(movies)
summary(movies)


p<-movies[movies$Genre=="action"|movies$Genre=="adventure"|movies$Genre=="animation"|movies$Genre=="comedy"|movies$Genre=="drama",]
work<-p[p$Studio=="Buena Vista Studios"|p$Studio=="Fox"|p$Studio=="Paramount Pictures"|p$Studio=="Sony"|p$Studio=="Universal"|p$Studio=="WB",]

nrow(p)
nrow(work)
# plot work
str(work)

q<-ggplot(data=work,aes(x=Genre,y=Gross...US))
t<-q+geom_jitter(aes(size=Budget...mill.,color=Studio),width = .5,height = .5)+geom_boxplot(size=1.2,alpha=.7,outlier.color = NA)+ylab("Gross % US")+
ggtitle("Domestic Gross % by Genre")+
  theme(axis.title.x=element_text(colour="Blue"),axis.title.y = element_text(colour = "Blue"),legend.text=element_text(size=10),text=element_text(family = "Comic Sans MS"))
t$labels$size <- "Budget $M"
t

