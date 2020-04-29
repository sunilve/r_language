N<-900
count<-0
for (i in rnorm(N)) {
  if(i>-1&i<1){
    count<-count+1
  }
  
}
answer<-count/N
count