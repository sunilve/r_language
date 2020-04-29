library(ggplot2)
setwd("C:\\Users\\Sunil\\Desktop")
getwd()
movie<-read.csv("P2-Movie-Ratings.csv")
movie
nrow(movie)
str(movie)
levels(movie$Genre)
qplot(data=movie,x=Rotten.Tomatoes.Ratings..,y=Audience.Ratings..,color=Year.of.release,size=I(.5),shape=I(15),alpha=I(.5),main = "qplot of movie")
colnames(movie)<-c("Film","Genre","CriticRating","AudienceRating","Budgetmillion","Year")
head(movie)
movie$Year<-factor(movie$Year)
class(movie$Year)




#---------------ggplot2 study

ggplot(data=movie,aes(x=AudienceRating,y=CriticRating,color=Year,size=Budgetmillion,alpha=I(.2)))+
  
  geom_point()

#----plotting with layers
p<-ggplot(data=movie,aes(x=AudienceRating,y=CriticRating,color=Year,size=Budgetmillion))
p  
p+geom_point()

#----overriding Aesthetics

q<-ggplot(data=movie,aes(x=AudienceRating,y=CriticRating,color=Genre,size=Budgetmillion))

q+geom_point()

q+geom_point(aes(x=Budgetmillion))+
  xlab("Budgetmillion$$")

#reduce line size

q+geom_point(size=1)+geom_point()

####-----mapping vs setting

r<-ggplot(data=movie,aes(x=CriticRating,y=AudienceRating))

r+geom_point()

#Add colour using mapping

r+geom_point(aes(color=Genre))

#add colour using setting

r+geom_point(colour="SkyBlue")

r+geom_point(aes(size=Budgetmillion))
r+geom_point(size=3,color="Blue")


#-----Histogram and Density charts

s<-ggplot(data=movie,aes(x=Budgetmillion))

s+geom_histogram(binwidth=10)

s+geom_histogram(binwidth=10,fill="Blue")

s+geom_histogram(binwidth=10,aes(fill=Genre),colour="DarkBlue")

s+geom_density(aes(fill=Genre))
s+geom_density(aes(fill=Genre),position="Stack")

#---starting layer tips

t<-ggplot(data=movie,aes(x=AudienceRating))
t+geom_histogram(binwidth = 10,fill="Pink",colour="Black")

t+geom_histogram(binwidth = 10,aes(x=CriticRating),fill="Orange",colour="DarkBlue")


#---------ststistical transformation


u<-ggplot(data=movie,aes(x=CriticRating,y=AudienceRating,colour=Genre))

u+geom_point()+geom_smooth(fill=NA)

#---boxplot

u<-ggplot(data=movie,aes(x=Genre,y=AudienceRating,colour=Genre))

u+geom_boxplot(size=1.1)+geom_jitter()
u+geom_jitter()+geom_boxplot(size=1.2,alpha=.5)


#-----Facets

v<-ggplot(data=movie,aes(x=Budgetmillion))
v+geom_histogram(binwidth = 10,aes(fill=Genre),colour="DarkGreen")

#------use of facets
v+geom_histogram(binwidth = 10,aes(fill=Genre),colour="DarkGreen")+
  
facet_grid(Genre~.,scales="free")

w<-ggplot(data=movie,aes(x=AudienceRating,y=CriticRating,colour=Genre))
w+geom_point(size=3)
+facet_grid(.~Genre)

w+geom_point(size=3)+
  facet_grid(.~Year)

w+geom_point(size=3)+
  geom_smooth()+
  facet_grid(Genre~Year)

#---coordinate

m<-ggplot(data=movie,aes(x=AudienceRating,y=CriticRating,size=Budgetmillion,color=Genre))

m+geom_point()+coord_cartesian(ylim = c(0,50),xlim = c(0,50))


w+geom_point(aes(size=Budgetmillion))+
  geom_smooth()+
  facet_grid(Genre~Year)+
  coord_cartesian(ylim = c(0,100))