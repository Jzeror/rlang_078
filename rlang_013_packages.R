install.packages("ggplot2")
library(ggplot2)

##read.csv(file="C:\\Users\\1027\\RWorkspace\\jzero\\2013년_전년대비_시간대별_교통사고_사망자_현황.csv")
##1-2-1-2. 시간대별_관광객_지번 (PNU)
x <- c("2","2","3","1","4","4","4","4")
x
qplot(x)
rm(x)

##### mpg 데이터 파악하기
## 내가 모르는 빅데이터를 분석하는 방법
## data = mpg, X축에 변수 지정해 그래프 생성
qplot(data = mpg, x = hwy)
## x 축 cty
qplot(data = mpg, x = cty)

## mpg 데이터를 데이터 프레임으로 만든다
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
summary(mpg)
# 통합 연비 변수 생성
mpg$total <- (mpg$cty + mpg$hwy) / 2
#통합 연비 변수 평균
mean(mpg$total)
# 요약 통계량 산출
summary(mpg$total)
hist(mpg$total)
# total 연비의 평균과 중앙값이 약 20이다
# total 연비가 20~ 25 사이에 해당하는 자동차 모델이 가장 많다.
# 대부분 25 이하이고, 25를 넘기는 자동차는 많지 않다.

## 합격 판정 변수 만들기
# total 이 20 이상이면 pass, 미만이면 fail을 부여하는 test 라는 변수를 생성합니다.
mpg$test <- ifelse(mpg$total >= 20, "pass", "faill")       #ifelse는 ggplot덕에 가능한거.
head(mpg, 20)
# 합격 판정을 받은 자동차 수를 살펴보자
table(mpg$test)
?table()
qplot(mpg$test)
#####걍 해본거 qplot(factor(mpg$test))

##중첩조건문
# total이 30 이상이면 A
# total이 20~30 이면 B
# total이 10~20 미만이면 C
mpg$grade <- ifelse(
  mpg$total >= 30, "A",
  ifelse(mpg$total >= 20, "B",
         ifelse(mpg$total >= 15, "C", "D"))
)
## 원하는 행 지우기 ex 14번째 열인 grade 지우기.
mpg<-mpg[,-14]
mpg <- subset(mpg,select = -grade)

head(mpg, 10)
table(mpg$grade)
qplot(mpg$grade)
head(mpg)
##변수명 변경 
#아직 안함


# ggplot2 패키지에는 미국 동북중부 437개 지역의 
# 인구통계 정보를 담은 midwest 라는 데이터가 
# 들어 있습니다.
# midwest 데이터를 사용해 데이터 분석 문제를 해결하시오
# 1.  pototal 변수를 total 로, popasian 변수를 
# asian 으로 수정하세요
# 2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 
# 백분율' 파생변수를만들고, 히스토그램을 만들어 도시들이
# 어떻게 분포하는지 살펴보시오.
# 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하고
# 'large' , 그 외에는 'small' 을 부여하는 파생변수를 만드시오.
# 'large' 와 'small' 에 해당하는 지역이 얼마나 되는지 
# 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.

#분석
midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
tail(midwest)
dim(midwest) # 437 행, 28 열
str(midwest)
summary(midwest)
#분석끝

# total 과 asian column에 각각 poptotal과 popasian 복사해주기
midwest$total<- midwest$poptotal
midwest$asian <- midwest$popasian
midwest$asian

#asian.total 이라는 새 column 만들기. 
midwest$percasi <- midwest$popasian/midwest$poptotal
#확인
midwest$asian.total
#히스토그램
hist(midwest$asian.total,col='red')
#평균
mean(midwest$asian.total)
#평가
midwest$eval <- ifelse(
  midwest$asian.total>mean(midwest$asian.total),"large","small"
)
# 빈도표
table(midwest$eval)
# 빈도 막대그래프
qplot(midwest$eval)


# 문제를 전부 푼 후 ...
# 변환된 데이터를 csv 파일로 저장합니다.
# 그러면 변형시킨 데이터를 csv를 통해 다른 프로그램
# 예를들면 엑셀이나 DB에 다시 전달할 수 있습니다.

write.csv(midwest, file = "update_midwest.csv")
