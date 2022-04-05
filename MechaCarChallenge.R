# Deliverable 1: Linear Regression to Predict MPG
# Step# 3 Use the library() function to load the dplyr package.
library(dplyr)

# Step# 4  read in the 'MechCar_mpg.csv file as a dataframe
mechcar_mpg_df <- read.csv (file='MechaCar_mpg.csv', check.name=F,stringsAsFactors = F) # 15.2.3
head(mechcar_mpg_df)

# Step#5 Perform linear regression using the lm() function.
lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data = mechcar_mpg_df)

# Step#6 Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data = mechcar_mpg_df))

# Deliverable 2: Create Visualizations for the Trip Analysis
# Step#2 import and read in the Suspension_Coil.csv file as a table.
Suspension_Coil_df <- read.csv (file='Suspension_Coil.csv', check.name=F,stringsAsFactors = F) # 15.2.3
head(Suspension_Coil_df)

# Step#3 Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary <- Suspension_Coil_df %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
total_summary

# Step# 4 Write an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
lot_summary <- Suspension_Coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Medain = median(PSI), Variance = var(PSI), SD = sd(PSI))
lot_summary

# Deliverable 3: T-Tests on Suspension Coils
# Step#1
t.test(Suspension_Coil_df$PSI, mu=1500)

# Step#2
t.test(subset(Suspension_Coil_df,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)
t.test(subset(Suspension_Coil_df,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)
t.test(subset(Suspension_Coil_df,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)

