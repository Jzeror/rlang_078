result<- function (user){
  
  return (switch(
    toString(sample(1:3,1,replace = TRUE) - user),
    '-2' = {"승리"},
    '1' = {"승리"},
    '-1' = {"패배"},
    '2' = {"패배"},
    '0' = {"비김"}
  ))
}
x<-result(3)
cat(x)
