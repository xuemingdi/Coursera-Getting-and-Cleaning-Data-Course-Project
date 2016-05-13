library(dplyr)
setwd("F:/NVDIMM/datascience/Coursera/cleandata/final/UCI HAR Dataset")

## Section 1. Merges the training and the test sets to create one data set.

test_set <- read.table("test/X_test.txt")
test_label <- read.table("test/y_test.txt")
test_subject <- read.table("test/subject_test.txt")

train_set <- read.table("train/X_train.txt")
train_label <- read.table("train/y_train.txt")
train_subject <- read.table("train/subject_train.txt")

## Section 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features_info <- read.table("features.txt")
mean_and_std_features <- grep("-(mean|std)\\(\\)", features_info[, 2])

test_data <- cbind(test_label,test_subject,test_set[,mean_and_std_features])
train_data <-cbind(train_label,train_subject,train_set[,mean_and_std_features])

data <- rbind(train_data,test_data)

## Section 3. Use descriptive activity names to name the activities in the data set

colnames(data) <-c("activity","subject",as.character(features_info[mean_and_std_features,2]))

## Section 4. Appropriately label the data set with descriptive activity names.

data$activity<- gsub(1, "WALKING", data$activity)
data$activity<- gsub(2, "WALKING_UPSTAIRS", data$activity)
data$activity<- gsub(3, "WALKING_DOWNSTAIRS", data$activity)
data$activity<- gsub(4, "SITTING", data$activity)
data$activity<- gsub(5, "STANDING", data$activity)
data$activity<- gsub(6, "LAYING", data$activity)


## Section 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_group_data<- (data %>%
                  group_by(subject,activity) %>%
                  summarise_each(funs( mean)))
write.table(tidy_group_data, "tidy_group_data.txt", row.name=FALSE)