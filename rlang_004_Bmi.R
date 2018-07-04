#bmi
res<-function(height, weight){
 return (bmi <-weight/(height/100)^2
  if(bmi<18.5) print("저체중")else
    if(bmi<23)print("비만 전단계")else
      if(bmi<25)print("1단계 비만")else
        if(bmi<30)print("2단계 비만")else print("3단계 비만")
)}

x<-res(186,78)
cat(x)