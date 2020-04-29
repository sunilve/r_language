#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#profit
profit<- (revenue-expenses)
pro<-paste(round(profit/1000,2),"K")
pro
#after_tax profit

after_tax_profit<-(profit-profit*.3)
atp<-paste(round(after_tax_profit/1000,2),"k")
atp

#profit_margin
profit_margin<-after_tax_profit/revenue
pm<- paste(round(profit_margin*100,2),"%")
pm
#good month
x<-mean(after_tax_profit)

dif<-after_tax_profit-x
good_month<-which(dif>0)

good_month  
  
# band month
bad_month<-which(dif<0)
bad_month

 #best month

c<- max(dif)
best_month<-which(dif==c)
best_month

#worst month

d<-min(dif)
worst_month<- which(dif==d)
worst_month
