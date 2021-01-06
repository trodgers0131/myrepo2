library(datasets)
data(CO2)
head(CO2)

library(dplyr)

CO2 %>% select(Plant)
#I deleted 'data(mtcars)'
head(mtcars)


mtcars %>% select(mpg)
