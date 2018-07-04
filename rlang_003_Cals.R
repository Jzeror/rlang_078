result <- function(num1,op,num2){
    return( c(num1,op,num2,"=", switch (
      op,
      '+' = num1+num2,
      '-' = num1-num2,
      '*' = num1*num2,
      '/' = num1/num2,
      '%%' = num1 %% num2,
      '%/%' = num1 %/% num2
    )))
}
x<-result(6,'-',5)
cat(x)