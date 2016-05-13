# Coursera-Getting-and-Cleaning-Data-Course-Project

This course project target is for review the Getting and Cleaning Data Coursera course. 

The project related description is in : CodeBook.md

The R source code is run_analysis.R, and it does the following:
  
Load the activity and feature info.
Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
Loads the activity and subject data for each dataset, and merges those columns with the dataset
Merges the two datasets
Gsub the activity columns names
Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair by using group_by and summarise_each.

The result is shown in the file tidy_group_data.txt.
