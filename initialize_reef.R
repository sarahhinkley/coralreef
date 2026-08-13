set.seed(32) #after runnning this, you have decide the outcome (allows everyone who has this line to get the same values)
              # set.seed defines the randomness

#Create a 5x5 matrix of Os representing the coral reef
reef_init <- matrix(data = 0, nrow = 5, ncol = 5)
reef_init

#Randomly sample coral starting locations
#Label the cells 1 - 25 such that the first row is 1 - 5, the second row is 6 - 10, etc. 
#Randomly sample 8 cell labels (without replacement)
random <- sample(1:25, size = 8, replace = FALSE)

#Rows
(1:25 - 1) %% 5 + 1 

#Columns
(1:25 - 1) %/% 5 + 1

reef <- matrix(0, nrow = 5, ncol = 5)
cell_label <- 6
cell_row <- (6-1) %/% 5 + 1 
cell_col <- (6-1) %% 5 + 1 

reef[cell_row, cell_col] <- 1
reef
