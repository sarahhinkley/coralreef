set.seed(221)

# STEP 1: Initialize your reef
reef <- matrix(0, nrow = 5, ncol = 5)
random_coral <- sample(1:25, size = 8)
for(rc in random_coral) {
  rc_row <- (rc - 1) %/% 5 + 1 #recall %/% is how many times that number can be divided into the other
  rc_col <- (rc - 1) %% 5 + 1 #recall %% is the remainder
  reef[rc_row, rc_col] <- 1 
}
print(reef)

# This is what the reef looks like now:
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    0    1    1    1    0
# [2,]    0    1    0    1    0
# [3,]    1    0    0    1    0
# [4,]    0    0    0    0    0
# [5,]    0    0    0    1    0

# STEP 2: Create vectors `years` and `coral_cover_pct`
years <- seq(from = 2004, to = 2024, by = 2)
years
length(years) #it is important to create length(years) because sometimes you may not know the length of the vector, so 
              #with this function R finds that value for you

coral_cover_pct <- integer(length(years))
coral_cover_pct
# This is what the vectors look like:
# > years
#  [1] 2004 2006 2008 2010 2012 2014 2016 2018 2020 2022 2024
# > coral_cover_pct
#  [1] 0 0 0 0 0 0 0 0 0 0 0


# STEP 3: Calculate coral cover in the first year
# Hint: reef is all 1's and 0's, so the mean of the reef equals the percent cover.
coral_cover_pct[1] <- mean(reef) # [ ] used for indexing, so you put brackets around the 1 because you are trying to look
                                 #the first value from the index of coral_cover_pct vector
coral_cover_pct
# The coral cover percent is:
# > coral_cover_pct
#  [1] 0.32 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
#It is 0.32 because it is taking the mean of the reef and making it the 1st value in the coral_cover_pct index.
#Because the reef has 25 positions, 25 is in the denominator and the reefs is composed of 0s and 1s and with 8 randomly
#placed 1s, the sum of the 25 0s and 1s is 8. Therefore 8 is the sum of the reef and goes in the numerator. This makes 
#8/25 which is 0.32

# STEP 4: Loop over time. Call your iterator `t`. You've already calculated 
# percent cover for the first year, so start your sequence at 2. Fill in the 
# blank below.
for (t in 2:length(years)) {
  # STEP 5: Update current and previous reef
  # Copy reef to a new variable, prev_reef
  prev_reef <- reef #Setting prev_reef to reef let's you remember the coral cover from the previous run so that you can base
                    #your next coral cover on the last one
  # Wipe the new reef clean so that the variable "reef" records the new run's data on coral life/death
  reef <- matrix(0, nrow = 5, ncol = 5) 

  # STEP 6: Loop over the rows and columns. Call your iterators r and c.
  for (r in 1:5) { #1:5 because it is 5 rows in the coral matrix
    for (c in 1:5) { #1:5 because it is 5 columns in the coral matrix

      # STEP 7: Check for coral
      # Check if this cell had a coral in it in the previous reef. Remember in the model, we needed to reference the reef
        #from the prior round because we needed to know if a reef in that location would continue to live or would die off.
      if (prev_reef[r, c] == 1) {
        print(paste("Coral found at", r, c)) #paste function is necessary because print would not be capable of stringing together
                                             #three different values
        
        # STEP 8: Determine coral's fate
        
        # Roll 2d6 for this coral
        coral_outcome <- sum(sample(1:6, size =2, replace = TRUE)) #using the sum function [sum()] is important because you are
                                                                   #pulling multiple samples so you want to use the sum of those
                                                                   #to determine the coral_outcome
        # Fill in the conditions below for mortality and survival
        # Update the reef accordingly
        if (coral_outcome <= 3) {
          # Mortality
          print("Coral died")
          # Update the reef
          reef[r, c] <- 0 #this says that at that row and column point in the matrix, there should be a 0 to represent the
                          #coral's death
        } else {
          # Survival
          print("Coral survived")
          # Update the reef 
          reef[r, c] <- 1 #this says that at that row and column point in the matrix, there should be a 1 to represent the 
                          #coral's death
        }
      }
    }
  }
  print(paste("year:", years[t])) #this prints (for example) "year: 2024" so that we can see the year that the matrix
                                  #correlates with
  print(reef) #this prints the matrix for the year in the console

  # STEP 9: Update coral_cover_pct
  coral_cover_pct[t] <- mean(reef) #this is how you essentially "lock in" the data for the year, by taking 
                                   #the mean of that matrix during that year
}
coral_cover_pct
# When correct, your code will produce this result for the coral cover percent:
#  [1] 0.32 0.24 0.24 0.24 0.24 0.20 0.20 0.20 0.16 0.08 0.08
