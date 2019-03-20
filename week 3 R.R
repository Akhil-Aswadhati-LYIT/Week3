# enter data into vectors into the dataframe
date_col <- c("2018-15-10", "2018-01-11", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
# age 99 requires recoding
age_col <- c(32, 45, 25, 39, 99)
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
# NA is inserted in place of missing data
q4_col <- c(5, 5, 5, NA, 2)
q5_col <- c(5, 5, 2, NA, 1)

column_names <- c("Date", "Country", "Gender", "Age", "q1", "q2", "q3", "q4", "q5")

# construct a dataframe from the above vectors

managers <- data.frame(date_col, country_col, gender_col, age_col, q1_col, q2_col,
                       q3_col, q4_col, q5_col)
managers

# Add column names to dataframe using col names vector
colnames(managers) <- column_names

str(managers)
head(managers, 20)

# Recode the incorrect age data from 99 to NA
# a$s means column 's' in table 'a'
managers$Age[managers$Age == 99] <- NA

# create a new attribute called age_cat and set values to the following if true
# <= 25 - Young, >=26 & <=44 - Middle aged, >=45 - elderly, it will also change NA

managers$age_cat[managers$Age <= 25] <- "Young"
managers$age_cat[managers$Age >= 26 & managers$Age <= 44] <- "Middle Aged"
managers$age_cat[managers$Age >= 45] <- "Elderly"
managers$age_cat[is.na(managers$Age)] <- "Elderly"

# add summary column to the dataframe
summary_col <- managers$q1 + managers$q2 + managers$q3 + managers$q4 + managers$q5
managers <- data.frame(managers, summary_col)
managers

#calculate the mea value for each row
mean_value <- rowMeans(managers[5:9])
managers <- data.frame(managers, mean_value)
managers

names(managers)[12] <- "Mean Value" # changing column names
names(managers)[11] <- "Answer Total"
names(managers)[10] <- "Age Category"
managers

# Dealing with missig values
# remove rows that contains NA
new_managers <- na.omit(managers)
new_managers 


# use coplete cases to show rows where data is available
complete_data <- complete.cases(managers)
complete_data
sum(complete_data)

# listing rows without missing values

complete_data <- managers[complete.cases(managers),] # ',' at the end means that the remaining-
                                                      # - rows

complete_data

# sum of all missing values in the age column
sum(is.na(managers$Age))
