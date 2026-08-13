#Write a function to encapsulate the logic for putting 8 random corals on the initialized reef. 
#Rather than hard-coding the number at 8, make the number of corals an input.


#this is making the grid with some initial corals randomly placed
initial_reef <- function(num_coral) { #reef, n_col, n_row are not imputs because they are not being changed by the function
                                      #num_coral is a parameter, everything within {} is the body
  reef <- matrix(0, nrow = 5, ncol = 5) #by putting the "reef" variable the function, you are self containing the function
                                        #so now the function only has to pull information from inside of it
  random_coral <- sample(1:25, num_coral)
  for (rc in random_coral) { #rc is the iterator, a placeholder AND random_coral is what you are iterating over 
                             #what is being iterated over must be already established and must have multiple positions
    rc_row <- (rc - 1) %/% 5 + 1 
    rc_col <- (rc - 1) %% 5 + 1
    reef[rc_row, rc_col] <- 1 
  }
  return(reef) #the return() sends out the output and a function can only have one output so using return() ends your function
               #thus it needs to be outside of the FOR loop 
}
