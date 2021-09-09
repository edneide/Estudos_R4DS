# Capítulo 2 ----
library(tidyverse)

## drop_na()---------

aq.nomissing <- drop_na(airquality) 
head(aq.nomissing)

head(airquality)

## tibble()---------

library(tibble)
mtcars

mtcars_named <- rownames_to_column(mtcars, var = "car_name")

## gather()----------

## spread()----------

# Capítulo 3----------

## Histogramas----
library(datasets)
head(airquality)

hist(airquality$Temp)

hist(airquality$Temp, 
     xlab = "Temperature (Degres Fahrenheit)",
     main = "Temperature in New York City May 1- September 30, 1973",
     breaks = 10)

## Gráficos de Densidade----
hist(airquality$Temp, 
     xlab = "Temperature (Degres Fahrenheit)",
     main = "Temperature in New York City May 1- September 30, 1973",
     breaks = 10,
     probability = TRUE)
lines(density(airquality$Temp))

## Gráfico de barras----
library(MASS)
head(Cars93[1:3])

table(Cars93$Type)
barplot(table(Cars93$Type),
        ylim = c(0,25),
        xlab = "Type",
        ylab = "Frequency",
        axis.lty = "solid",
        space = .5,
        )

library(dplyr)
USA.Cars93 <- Cars93 %>% 
  filter(Origin == "USA" )

table(USA.Cars93$Cylinders)

barplot(table(USA.Cars93$Cylinders),
        xlab = "Type",
        ylab = "Frequency",
        axis.lty = "solid",
        space = .5,
)

### Agrupando barras----

library(datasets)
females <- HairEyeColor[, , 2]
females

color.names = c("black", "grey40", "grey80", "white")

# traspondo a matriz females
t(females)
barplot(t(females),
        beside = TRUE,
        ylim = c(0, 70),
        xlab = "Hair Color",
        ylab = "Frequency of Eye Color",
        col = color.names,
        axis.lty = "solid",
        main = "FEMALES"
        )
legend("top",
       rownames(t(females)),
       cex = 0.8,
       fill = color.names,
       title = "Eye Color"
       )

## Projeto Rápido: Fazendo o mesmo para Males----
colors() # para ver todas as cores
colors()[grep("yellow", colors())]

### Males----
males <- HairEyeColor[, , 1]
males  
t(males)

color.names2 = c("brown4", "skyblue", "yellowgreen", "lightgreen")

barplot(t(males),
        beside = TRUE,
        ylim = c(0, 70),
        xlab = "Hair Color",
        ylab = "Frequency of Eye Color",
        col = color.names2,
        axis.lty = "solid",
        main = "MALES"  
)
legend("top",
       rownames(t(males)),
       cex = 0.8,
       fill = color.names2,
       title = "Eye Color"
)

## Projeto Rápido: Revendo o Agrupamento----

Type.Origin <- Cars93 %>% 
  dplyr::select(Type, Origin)

table_type <- table(Type.Origin$Type, Type.Origin$Origin)

barplot(
  t(table_type),
  beside = TRUE,
  xlab = "Type",
  ylab = "Frequency",
  axis.lty = "solid",
  col = c("black", "white")
)
legend("topright",
       rownames(t(table_type)),
       cex = 0.8,
       fill = c("black", "white"),
       title = "Origin"
)

## Gráficos de pizza----
library(MASS)
pie(table(Cars93$Type))

## Gráficos de dispersão----
library(datasets)
plot(airquality$Wind, airquality$Temp, 
     pch = 16,
     xlab = "Wind Velocity (MPH)",
     ylab = "Temperature (Farenheit)",
     main = "Temperature vs Wind Velocity"
     )

plot(airquality$Temp ~ airquality$Wind, 
     pch = 16,
     xlab = "Wind Velocity (MPH)",
     ylab = "Temperature (Farenheit)",
     main = "Temperature vs Wind Velocity"
)

## Matriz do gráfico de dispersão----
Ozone.Temp.Wind <- subset(airquality, select = c(Ozone, Temp, Wind))
head(Ozone.Temp.Wind)

pairs(Ozone.Temp.Wind)

## Diagramas de Caixa----
boxplot(Temp ~ Month, 
        data = airquality,
        xaxt = "n")  
axis(1, at=1:5, labels=c("May", "June", "July", "August", "September"))

## Evoluindo para ggplot2----
library(ggplot2)

ggplot(airquality, aes(x = Temp)) +
  geom_histogram()

### Histogramas----
airquality %>% 
  ggplot(aes(x = Temp)) +
  geom_histogram(binwidth = 5,
                 color = "black",
                 fill = "grey80"
                 ) +
  theme_bw() +
  labs(x = "Temperature (Fahrenheit)",
       y = "Frequency",
       title = "Temperature in the airquality Data Frame"
       )
  
### Gráficos de barras----
library(MASS)
ggplot(Cars93, aes(x = Type)) +
  geom_bar() +
  labs(y = "Frequency",
       title = "Car Type and Frequency in Cars93"
         ) +
  theme_wsj()
