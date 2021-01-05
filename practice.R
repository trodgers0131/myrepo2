library(datasets)
data(mtcars)
head(mtcars)

library(dplyr)

mtcars %>% select(mpg)
