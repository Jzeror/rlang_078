grade <- function(name,kor,eng,math){
  x<-c(kor,eng,math)
  return (list(name=name, rsum=sum(x), rmean=mean(x), rgrade=switch(
    toString(mean(x)%/%10),
    '10'= "A등급", 
    '9'= "A등급", 
    '8'="B등급",
    '7'='C등급',
    '6'='D',
    '5'='e',
    'f'
  )))
}




sejong <- grade('세종대왕',100,79,98)
lee<- grade('이성계',10,90,67)
park<- grade('박지원',70,90,85)
un<- grade('언더더씨',54,28,12)
do<- grade('도게자',88,41,64)


grade.data <- data.frame(
name=c(sejong$name,lee$name,park$name,un$name,do$name),
sum=c(sejong$rsum,lee$rsum,park$rsum,un$rsum,do$rsum),
mean=c(sejong$rmean,lee$rmean,park$rmean,un$rmean,do$rmean),
grade=c(sejong$rgrade,lee$rgrade,park$rgrade,un$rgrade,do$rgrade),
stringsAsFactors = FALSE
)

print(grade.data)  


result <- data.frame(grade.data$name, grade.data$sum)
print(result)


pie(grade.data$sum, grade.data$name)


barplot(grade.data$rmean)

barplot(x, col = c("purple", "violetred1", "green3","cornsilk", "cyan"))

plot(grade.data$sum,type = "o")
