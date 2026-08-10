set.seed(123) 
die <- 1:6 #1:6 is a vector of numbers, this basically says the the variable "dice" holds the numbers 1 through 6
rolls <- sample(die, size = 2, replace = TRUE) #replace = TRUE means the same number can show up multiple times,
                                                #size = 2 means that we want to run the function 2 times
                                                #die tells the function to pull the variable and its vector of numbers
roll_total <- sum(rolls) 