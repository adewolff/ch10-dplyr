# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library("fueleconomy")

# You should have have access to the `vehicles` data.frame
vehicles <- data.frame(vehicles, stringsAsFactors = F)

# Create a data.frame of vehicles from 1997
vehicles_1997 <- vehicles[vehicles$year == 1997,]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(vehicles_1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
econobox <- vehicles[vehicles$drive == "2-Wheel Drive" & vehicles$cty > 20,]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst_econobox <- econobox$id[econobox$hwy == min(econobox$hwy)]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
best_econobox <- function(year, make){
  vehicles_year_make <- vehicles[vehicles$year == year & vehicles$make == make,]
  highest_hwy <- vehicles_year_make$id[vehicles_year_make$hwy == max(vehicles_year_make$hwy)]
}

# What was the most efficient honda model of 1995?
honda_1995 <- best_econobox(1995, "Honda")
