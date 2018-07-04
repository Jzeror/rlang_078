help("solve")
?solve
#jaca : int a = 3;
#Syetem.out.print(a);
a <- "3"
a
b <- 4
b
c <- a + b
a <- 3
c <- a + b
c

a <- c(1,2,3,4)
a
#int[] arr = new int[3];
#arr[0] = 1;
#arr[1] = 2;
#arr[2] = 3;
#위에는 자바
#arr <- c(1,2,3,)


a <- c(1,"2",3,"4")
a

x <-c(1,2,3,4,5,6,7,8,9,10)
y <-sum(x)
y
sum((x-mean(x))^2)/(length(x)-1)

?seq
x <- seq(length=10,from=1,by=1)
x
sum(x)

sum(seq(length=100,from=1,by=1))

?sample
#가위: 1 바위: 2 보자기: 3
sample(1:3,1,replace = TRUE)
com <- sample(1:3,1,replace = TRUE)
cat("컴퓨터",com)
user <- 2
if(com-user ==-2 || com -user ==1)print("승리")else
  if(com-user ==-1 || com - user ==2)print("패배")else print("비김")

#switch  
com <- sample(1:3,1,replace = TRUE)
user <- 2
cat('컴퓨터:',com)
res <- toString(com - user)
cat('결과 :',res)
x <- switch(
  res,
  '-2' = {"승리"},
  '1' = {"승리"},
  '-1' = {"패배"},
  '2' = {"패배"},
  '0' = {"비김"}
)
cat(x)

#하나로 합치기
user <- 2
print(switch(
  toString(sample(1:3,1,replace = TRUE) - user),
  '-2' = {"승리"},
  '1' = {"승리"},
  '-1' = {"패배"},
  '2' = {"패배"},
  '0' = {"비김"}
))

#bmi

height <- 186
weight <- 60
bmi <-weight/(height/100)^2
cat('결과:  ',bmi)
if(bmi<18.5) print("저체중")else
  if(bmi<23)print("비만 전단계")else
    if(bmi<25)print("1단계 비만")else
      if(bmi<30)print("2단계 비만")else print("3단계 비만")


#벡터 만드는법
print(
  c(1:10)
)
print(
  seq(from=1,to=10,by=2)
)
print(
  seq(from=1,length=10,by=2)
)
print(
  seq(1,10,2)
)
print(
  rep(1:5)
)
print(
  rep(1:5,each=2)
)
print(
  rep(1:5,times=2)
)
print(
  rep(1:5,each=2,times=3)
)
print(
  rep(1:5,,times=3,each=2)
)
print(
  rep(1:5,times=3,each=2,len=5)
)
print(
  rep(1:5,each=2,times=3,len=5)
)

#기본타입 : character, wid character, integer,
#floating point, double floating point, Boolean etc.
# R-object : Vector, List , Matric, Array, Factor, Data Frame
# Vector 의 6개 타입
# Logical (T,F), Numeric (실수), Integer (정수),
# Complex (허수), Character (문자열), Raw (주소값)

#계산기

num1 <- 5
num2 <- 2
op <-'%%'
res <- switch (
  op,
  '+' = num1+num2,
  '-' = num1-num2,
  '*' = num1*num2,
  '/' = num1/num2,
  '%%' = num1 %% num2,
  '%/%' = num1 %/% num2
)
cat(num1,op,num2,'=',res)

# 1+2+3+4+5 =15 출력
x <- c(1:5)
cat(x)
for(i in x){
  if(i==5)
    cat(i,"=",sum(x))
  else
    cat(i,"+")
  
}

# 위에꺼 줄이기.
for(i in 1:5){
  if(i==5)
    cat(i,"=",sum(1:5))
  else
    cat(i,"+")
}

#1-2+3-4+5...-100 = -50 출력
x <- c(1:100)
for(i in x){
  if(i==100)
    cat(i,"=",sum(seq(1,100,2))-sum(seq(2,100,2)))
  else if(i%%2==0)
    cat(i,"-")
  else
    cat(i,"+")
}


for(i in 1:100){
  if(i==100)
    cat(i,"=",sum(seq(1,100,2))-sum(seq(2,100,2)))
  else
    switch(
      toString(i%%2),
      '0' = cat(i,"+"),
      '1' = cat(i,"-")
    )
}