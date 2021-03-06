#Linguagem R no PowerBI

#Parte I - Graficos no R

#Diret�rio
setwd("seu diret�rio")

#Plot I (Simples)
plot(Temp~Wind,data=dataset)
     
#Plot II (Velocidade do Vento x Temperatura)
plot(Temp~Wind,data=dataset,pch=19,
     main="Temperatura x Velocidade do Vento",
     xlab="Velocidade do Vento",
     ylab="Temperatura")

#Plot III (Package ggplot)
#Instala��o
install.packages("ggplot2")
library("ggplot2")

ggplot(airquality,aes(Temp)) +
  geom_bar()+
  ggtitle("Temperatura - Airquality")+
  labs(x="Temperatura",y="Quantidade")+
  scale_y_continuous(breaks = seq(1:10))+
  theme_bw()
  

#Parte II - Manipula�ao de Tabelas

#Atribui��o a Variavel datataset
dataset <- airquality

#Pacotes
install.packages("dplyr")
library("dplyr")
install.packages("tidyr")
library("tidyr")

#Preparo
air_data <- dataset %>% 
              dplyr::select(Ozone,Solar.R,Month,Temp) %>%
              tidyr::gather(Variavel,Valor,-Solar.R,-Month,-Temp) %>%
              dplyr::arrange(Solar.R)

#Plot IV (Varia�ao Temperatura)
ggplot(air_data,aes(Temp))+
        geom_density()+
        theme_bw()+
        facet_grid(~Month)+
        ggtitle("Varia��o de Temperatura por M�s") +
        labs(xlab="Temperatura",y="Varia��o")
