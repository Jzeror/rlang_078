# 성적표
n<-'홍길동'
kor<-100
eng<-79
math<-90
x<-c(kor,eng,math)
cat("|이름  |","|총점|","|평균|","|등급|\n",
    n,' ',
    sum(x),'  ',
    mean(x),' ',
    switch(
      toString(mean(x)%/%10),
      '10'= "A등급", 
      '9'= "A등급", 
      '8'="B등급",
      '7'='C등급',
      '6'='D',
      '5'='e',
      'f'
    )
)

## stmt 를 합치면 function이 된다. R에서 function을 만드는 것은 객체지향을 하는 것이다.
## 4가지 반드시 있어야 function이 된다. R의 syntax.
##펑션 이름 대문자 ㄴㄴ
grade <- function(n,kor,eng,math){
  x<-c(kor,eng,math)
  return (c(n, sum(x), mean(x), switch(
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

res <- grade('이성',78,79,82)

cat("|이름  |","|총점|","|평균|","|등급|\n",
    res[1],' ',
    grade('이성',78,79,82)[2],'  ',
    res[3],' ',
    grade('이성',78,79,82)[4]
)