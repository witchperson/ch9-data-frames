# Exercise 5: large data sets: Baby Name Popularity Over Time

# Read in the female baby names data file found in the `data` folder into a 
# variable called `names`. Remember to NOT treat the strings as factors!
names <- read.csv('data/female_names.csv', stringsAsFactors=FALSE)

# Create a data frame `names.2013` that contains only the rows for the year 2013
names.2013 <- names[names$year == 2013, ]

# What was the most popular female name in 2013?
most.popular.name.2013 <- names.2013[names.2013$prop == max(names.2013$prop), 'name']

# Write a function `MostPopular` that takes in a year as a value and returns
# the most popular name in that year
MostPopular <- function(year) {
  names.year <- names[names$year == year, ]
  most.popular <- names.year[names.year$prop == max(names.year$prop), 'name']
  return(most.popular)
}

# What was the most popular female name in 1994?
most.popular.1994 <- MostPopular(1994)

# Write a function `NumberInMillion` that takes in a name and a year, and returns
# statistically how many babies out of 1 million born that year have that name. 
# Hint: get the popularity percentage, and take that percentage out of 1 million.
NumberInMillion <- function(name, year) {
  name.popularity <- names[names$year == year & names$name == name, 'prop']
  return(round(name.popularity*1000000,1))
}

# How many babies out of 1 million had the name 'Laura' in 1995?
NumberInMillion('Laura', 1995)

# How many babies out of 1 million had your name in the year you were born?


## Consider: what does this tell you about how easy it is to identify you with 
## just your name and birth year?
