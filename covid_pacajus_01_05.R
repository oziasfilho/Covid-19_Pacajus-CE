install.packages("tidyverse")
install.packages("lubridate")
install.packages("tidylog")
install.packages("data.table")
install.packages("extrafont")


library(tidyverse)
library(lubridate)
library(ggplot2)
library(extrafont)
font_import()
loadfonts(device = "win")
dados<-read.csv("Covid_Pacajus.csv",header = TRUE,sep = ",",encoding = "UTF-8")
dados$Data<-dmy(dados$Data)


ggplot(dados, aes(x=Data, y=N_Casos, group=Situação,color=Situação)) +
  geom_line()+
  geom_point() +
  scale_color_manual(values = color_group) + 
  theme_bw() + 
  ggtitle("Acumulado de Casos de Covid-19 em Pacajus-CE") +
  xlab("Data") + ylab("Nº de Casos") +
  theme(text=element_text(size=8.5,  family="Arial Narrow",face = "bold")) + 
  labs(caption = "Fonte: Boletins Epidemiológicos da Secretaria de Saúde de Pacajus / Ozias Filho")

color_group <- c("darkorange","red")


