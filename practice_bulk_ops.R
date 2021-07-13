library(tidyverse)

# ctrl + shft + C = comment on multiple lines

# Change column types
# mutate_if(is.logical, as.character)


#### New column based on Paste() ####
df <- mtcars
names(df)

df$mpgwt <- paste(df$mpg, df$wt, "lol")

df$mpg <- paste(df$wt, "lol")

# also https://www.marsja.se/r-add-column-to-dataframe-based-on-other-columns-conditions-dplyr/



#### Map iteration ####
# map(object, function)
map(df$cyl, mean)


#### Create function ####
# new_func <- function(arguments){
# expressions
# return(output)
# }


add_text <- paste(df$mpg, "lol")




#### For loop over a matrix ####
# Create a matrix
mat <- matrix(data = seq(10, 20, by=1), nrow = 6, ncol =2)
# Create the loop with r and c to iterate over the matrix
for (r in 1:nrow(mat))   
  for (c in 1:ncol(mat))  
    print(paste("Row", r, "and column",c, "have values of", mat[r,c]))





