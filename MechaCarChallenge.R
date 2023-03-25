#import library
library(dplyr)
library(tidyverse)

cut <- group_by(diamonds, cut)
summarize(cut, mean(price), sum(price))

#import csv as DataFrame
df <- read.csv('MechaCar_mpg.csv')
head(df)

#find linear coefficient
df_lr <- lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data = df)
df_lr

#find p-value and r-squared value of linear regression model
df_summary <- summary(df_lr)
df_summary

#import suspension coil csv file
sc_df <- read.csv('Suspension_Coil.csv')
head(sc_df)

#create summary dataframe
total_summary <- summarize(sc_df, mean(PSI),median(PSI),var(PSI),sd(PSI))

#creat lot summary using groupby
lot_summary <- sc_df %>% group_by(Manufacturing_Lot) %>% summarize( mean(PSI),median(PSI),var(PSI),sd(PSI))

#t-test
t.test(sc_df$PSI, mu=1500)

#t-test with subsets
lot1 <- subset(sc_df, Manufacturing_Lot=='Lot1')
lot2 <- subset(sc_df, Manufacturing_Lot=='Lot2')
lot3 <- subset(sc_df, Manufacturing_Lot=='Lot3')
t.test(lot1$PSI, mu=1500)
t.test(lot2$PSI, mu=1500)
t.test(lot3$PSI, mu=1500)



