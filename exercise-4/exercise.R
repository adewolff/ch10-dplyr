# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)

# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights <- mutate(flights, airtime_gain = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, desc(airtime_gain))

# Try doing the last 2 steps in a single operation using the pipe operator
flights <- flights %>% mutate(airtime_gain = arr_delay - dep_delay) %>% 
  arrange(desc(airtime_gain))

# Make a histogram of the amount of gain using the `hist` command
hist(flights$airtime_gain)

# On average, did flights gain or lose time?
average_time_gain <- mean(flights$airtime_gain, na.rm = T)

# Create a data.frame that is of flights headed to seatac ('SEA'), 
seattle_bound <- flights %>% filter(dest == "SEA")

# On average, did flights to seatac gain or loose time?
average_seattle_time_gain <- mean(seattle_bound$airtime_gain, na.rm = T)
### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see chapter 11 section on standard evaluation
custom_flight <- function(origin_name, destination_name, column_name){
  custom_dataframe <- flights %>% 
    filter(origin == origin_name, dest == destination_name) %>% 
    select_(column_name)
}

# Retireve the air_time column for flights from JFK to SEA
jfk_sea_airtime <- custom_flight("JFK", "SEA", "air_time")

# What was the average air time of those flights (in hours)?  
jfk_sea_average <- mean(jfk_sea_airtime$air_time, na.rm = T) / 60

# What was the min/max average air time for the JFK to SEA flights?
jfk_sea_airtime <- mutate(jfk_sea_airtime, 
                          average_airtime = 
                            mean(jfk_sea_airtime$air_time, na.rm = T))
