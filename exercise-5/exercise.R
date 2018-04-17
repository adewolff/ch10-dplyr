# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)
View(flights)
# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data
flights_month_summary <- flights %>% 
  group_by(month) %>% 
  summarize(average_dep_delay = mean(dep_delay, na.rm = T))
filter(flights_month_summary, average_dep_delay == max(average_dep_delay)) %>% 
  select(month)

# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
with(flights_summary, plot(month, max_dep_delay, pch = 20, 
                           xlab = "Month", ylab = "Max delay", 
                           main = "delays by month"
                           ))

# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
arrival_delays <- flights %>% 
  group_by(dest) %>% 
  summarize(max_arr_delay = max(arr_delay, na.rm = T))

### Bonus ###
# Which city was flown to with the highest average speed?
flights <- mutate(flights, speed = distance / air_time)

fastest_destination <- flights %>% 
  filter(speed == max(speed)) %>% 
  select(dest)
