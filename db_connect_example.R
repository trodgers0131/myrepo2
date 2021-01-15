library(DBI)
con <- dbConnect(odbc::odbc(), Driver="postgresql", 
                 Server = "10.10.100.234", 
                 Port = "5432", 
                 Database = "trodgers", 
                 UID = "trodgers", 
                 PWD = rstudioapi::askForPassword("Database password:"), 
                 BoolsAsChar = "", timeout = 10)

dbGetQuery(con,'
  select 
    column1, 
    column2
  from 
    practice
')


library(datasets)
car <- mtcars
dbWriteTable(con,"cars",car)

dbGetQuery(con,'
  SELECT 
    cyl, 
    avg(mpg),
    count(*)
  FROM 
    cars
  GROUP BY
    cyl
')

library(dplyr)
q1 <- tbl(con, "cars") %>%
  group_by(cyl) %>%
  summarise(
    avg_mpg = mean(mpg),
    total = n())
q1


