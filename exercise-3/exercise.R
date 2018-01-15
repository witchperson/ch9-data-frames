# Exercise 3: working with built-in data sets

# Load R's "USPersonalExpenditure" dataset using the `data()` function
# This will produce a data frame called `USPersonalExpenditure`
data("USPersonalExpenditure")

# The variable `USPersonalExpenditure` is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame(USPersonalExpenditure)

# Luckily, you can pass the USPersonalExpenditure variable as an argument to the
# `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
us.exp <- data.frame(USPersonalExpenditure)

# What are the column names of your dataframe?
colnames(us.exp)

## Consider: why are they so strange? Think about whether you could use a number 
## like 1940 with dollar notation!

# What are the row names of your dataframe?
rownames(us.exp)

# Add a column "category" to your data frame that contains the rownames
us.exp$category <- rownames(us.exp)

# How much money was spent on personal care in 1940?
care.1940 <- us.exp['Personal Care', 'X1940']

# How much money was spent on Food and Tobacco in 1960?
food.1960 <- us.exp['Food and Tobacco', 'X1960']

# What was the highest expenditure category in 1960?
highest.1960 <- us.exp$category[us.exp$X1960 == max(us.exp$X1960)]

# Define a function `HighestCategory` that takes in a year as a parameter, and
# returns the highest spending category of that year
HighestCategory <- function(year) {
  col <- paste0('X',year)
  return( us.exp$category[us.exp[,col] == max(us.exp[,col])] )
}

# Using your function, determine the highest spending category of each year
# Hint: use the `sapply()` function to apply your function to a vector of years
highest <- sapply(seq(1940, 1960, 5), HighestCategory)
