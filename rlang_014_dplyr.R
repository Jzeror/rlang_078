## dplyr
# filter() 행추출
# select() 열추출
# arrange() 정렬
# mutate() 변수추가
# summarise() 통계치산출
# group_by() 집단별로 나누기
# left_join() 데이터합치기(열)
# bind_rows() 데이터합치기(행)
# View() 뷰어창에서 데이터 확인 !! 주의 .. V가 대문
install.packages("dplyr")
library(dplyr)

path <-getwd()
path
setwd("csv_exam") ##앞으로 저장하는건 여기다 저장할거야 라는 뜻. path에 나오는 경로 가서 폴더 만들어줘야함.
df_exam <- read.csv("csv_exam.csv") ##csv_exam.csv는 csv_exam폴더에 있어야함. setwd로 설정해놨으니까
df_exam

## 문자가 들어있는 파일을 불러올때는 stringAsFactors = F
## 를 넣어줄것. 지정하지 않으면 문자요소는 factor 로
## 전환 됨. 숫자는 전환 되지 않음

View(df_exam)
df_exam <- rename(df_exam, userid = id)
head(df_exam)

##대망의 문제. 
##평균 avg를 만들어라
library(ggplot2)
is.data.frame(df_exam)












name=paste(sample(x,1,replace = TRUE),sample(y,1,replace=TRUE),sample(z,1,replace=TRUE),sep=" ")
x<-c('김','이','박','이','최','정')
y<-c('지','재','혜','상','호','덕')
z<-c('현','연','민','진','준','태')

grade = function(name){
  
  return()
}