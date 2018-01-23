# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling
employees <- c(paste("Employee", 1:100))

# Create a vector of 100 random salaries for the year 2016
# Use the `runif()` function to pick random numbers between 40000 and 50000
employees.salaries.2016 <- c(runif(100, 40000, 50000))

# Create a vector of 100 salaries in 2017 that have changed from 2016
# Use `runif()` to add a random number between -5000 and 10000 to each of 2016's
# salaries (the negative number means that a salary may have decreased!)
employees.salaries.2017 <- c(employees.salaries.2016+runif(100, -5000, 10000))

# Create a data frame 'salaries' by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, employees.salaries.2016, employees.salaries.2017, stringsAsFactors = 'FALSE')

# Create a column 'change' that stores each person's change in salary between
# 2016 and 2017
salaries$change <- salaries$employees.salaries.2017 - salaries$employees.salaries.2016
View(salaries)
# Create a column 'got.raise' that is TRUE if the person got a raise (their
# salary went up)
got.raise <- salaries$change[change>0]


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2017 salary of employee 57
salaries[57, 3]

# How many employees got a raise?
length(got.raise)

# What was the dollar value of the highest raise?
max(salaries$change)

# What was the "name" of the employee who received the highest raise?


# What was the largest decrease in salaries between the two years?
min(salaries$change)

# What was the name of the employee who recieved largest decrease in salary?
salaries[,1]

# What was the average salary change?
mean(salaries$change)

# For people who did not get a raise, how much money did they lose on average?


## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory
write.csv()
