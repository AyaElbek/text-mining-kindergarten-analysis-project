#Aidai Elbekova
#Assigment 3

#1 Task
# Download the kindergarten.csv dataset, import it to your environment 
#and assign the dataframe a name.
kindergarten_df <- read.csv(file= "../desktop/text_mining/datasets/kindergarten.csv", sep=",")

#a. Return the number of children whose age is above 36 months.
a <- kindergarten_df[which(kindergarten_df$Months>= 36), ]
print(length(a$Name))

#b. Return the names of the children whose favorite fruit is apple or strawberry.
#olympic_df[which(olympic_df$Team=="United States of America" | olympic_df$Team=="Canada"), ]
b <- kindergarten_df[which (kindergarten_df$Fav_fruit == "apple" | 
                         kindergarten_df$Fav_fruit == "strawberry"), ]
print(b$Name)

#c. Create a new dataframe which shows the children with blue eyes and brown hair.
kindergarten_df2 <- kindergarten_df [which(kindergarten_df$Eye == "blue" &
                                            kindergarten_df$Hair == "brown"), ]
kindergarten_df2

#d. Assume that the current class in the kindergarden is only for kids up to age of 4 (48 months). 
#Add a new column to the dataframe, which shows how many more months
#each child can attend this class.
max_months <- 48
kindergarten_df$months_attend <- max_months - kindergarten_df$Months
print(kindergarten_df)

#2 Task
#a. Return the column sums of the dataframe, for each column, by using a for loop
df_a2 <- data.frame(mylog = c(TRUE, FALSE, FALSE, TRUE), 
                    mynam = c(1, NA, 2, 3))
print(df_a2)
for (i in 1:ncol(df_a2)) {
  sum(df_a2)
}

#b. How does the sum returns a numeric value for a logical column? 
#Explain with a commented line in your R script.
#Answer: For logical column sum is numeric and equal 2. TRUE value is 1, and FALSE is 0

#c. Return the column sums of the dataframe, by using apply function.
apply(df_a2, 2, sum, na.rm=TRUE)

#d. Return the row sums of the dataframe, by using lapply function. 
#What is the class of the output of the function?
lapply(df_a2[c(1:4), ], sum)


#e. Add a new character column to the dataframe by using ifelse() function. 
#The new column should be “available” if there is no NA element in the row 
#and “not available” otherwise.
df_a2$new_col <- for (i in 1:nrow(df_a2)) 
  if (is.na(df_a2[i])) {
    print("not available")
  } else {
    print(df_a2$item[i], "available")
  }

#3 Task
#Create two numeric vectors (A and B) of length 4 each. 
#Assume that each vector shows the number of points team scored in four matches in the tournament. 
#Write a for loop which returns the name of the winning team for each of the four games. 
#In case of a tie, the for loop should return one of the team names randomly.

A <- c(1:4)
B <- c(3:6)

for (i in 1:4)
  if (A > B) {
    print("A")
    } else if (A < B){
        print ("B")
    } else {
        print(sample(A,B,1)) 
    } 


#4 Task
#You bought a stock at price 50. The price of the stock increases or decreases everyday 
#by x percent, where x is a randomly drawn number from a uniform distribution between -10 and 10. 
#Find how many days does it take for the stock price to reach above 70 or below 25?

price1 <- 50
while (price1 > 70) { 
  change1 <- runif (1, min = -10, max = 10) 
  price1 <- price1 + (price1*change1/100) 
  print (price1)
}