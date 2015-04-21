library(reshape)
library(dplyr)

######################################################################################
## Step 1 Merges the training and the test sets to create one data set.
######################################################################################

###########################################
# Reading data sets
###########################################

## read in column headers for test_data_df
features_df <- read.csv("UCI HAR Dataset\\features.txt", sep = "", header = FALSE)
## convert it to a list
features <- as.vector(as.matrix(features_df[2]))

## read in activity labels
activity_labels_df <- read.csv("UCI HAR Dataset\\activity_labels.txt", sep = "", header = FALSE)
names(activity_labels_df) <- c("Id", "Activity")

## read in the test data set
test_activity_df <- read.csv("UCI HAR Dataset\\test\\y_test.txt", header = FALSE)
test_subject_df <- read.csv("UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)
test_data_df <- read.csv("UCI HAR Dataset\\test\\x_test.txt", sep = "" , header = FALSE)

## read in the train data set
train_activity_df <- read.csv("UCI HAR Dataset\\train\\y_train.txt", header = FALSE)
train_subject_df <- read.csv("UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)
train_data_df <- read.csv("UCI HAR Dataset\\train\\x_train.txt", sep = "" , header = FALSE)

###########################################
# Merge data sets
###########################################

## merge subject and data
test_data_df <- cbind(test_subject_df, test_activity_df, test_data_df)
train_data_df <- cbind(train_subject_df, train_activity_df, train_data_df)

## merge test and train
full_data_df <- rbind(test_data_df, train_data_df)

## set headers 
names(full_data_df) <- c("Subject", "Activity_Id", features)

######################################################################################
## Step 2 Extracts only the measurements on the mean and standard deviation for each measurement.
######################################################################################

## get the index of all columns that contain either "mean()" or "std()"
mean_and_std_columns <- c(1, 2, grep("(mean\\(\\)|std\\(\\))", features, ignore.case = TRUE) + 2)

## subsetting the dataframe
mean_and_std_df <- full_data_df[ , mean_and_std_columns]

######################################################################################
## Step 3 Uses descriptive activity names to name the activities in the data set
######################################################################################

mean_and_std_df <- merge(mean_and_std_df, activity_labels_df, by.x="Activity_Id", by.y="Id")

mean_and_std_df <- select(mean_and_std_df, -Activity_Id)


######################################################################################
## Step 4 Appropriately labels the data set with descriptive variable names
######################################################################################

names(mean_and_std_df) <- gsub("mean()", "Mean", names(mean_and_std_df), fixed = TRUE)
names(mean_and_std_df) <- gsub("std()", "StandardDeviation", names(mean_and_std_df), fixed = TRUE)
names(mean_and_std_df) <- gsub("-X", "Xaxis", names(mean_and_std_df), fixed = TRUE)
names(mean_and_std_df) <- gsub("-Y", "Yaxis", names(mean_and_std_df), fixed = TRUE)
names(mean_and_std_df) <- gsub("Mag", "Magnitude", names(mean_and_std_df), fixed = TRUE)
names(mean_and_std_df) <- gsub("Acc", "Acceleration", names(mean_and_std_df), fixed = TRUE)
names(mean_and_std_df) <- gsub("Gyro", "Gyroscope", names(mean_and_std_df), fixed = TRUE)
names(mean_and_std_df) <- gsub("-Z", "Zaxis", names(mean_and_std_df), fixed = TRUE)
names(mean_and_std_df) <- gsub("-", "", names(mean_and_std_df), fixed = TRUE)
names(mean_and_std_df) <- gsub("^f", "Frequency", names(mean_and_std_df))
names(mean_and_std_df) <- gsub("^t", "Time", names(mean_and_std_df))



######################################################################################
## Step 5 From the data set in step 4, creates a second, independent tidy data set with
## the average of each variable for each activity and each subject.
######################################################################################

## collased the data frame
melted_mean_and_std_df <- melt(mean_and_std_df, id=(c("Subject", "Activity")))
names(melted_mean_and_std_df)[3] <- "Measurement"

## summarize data
melted_mean_and_std_df <- group_by(melted_mean_and_std_df, Subject, Activity, Measurement)
tidy_df <- summarise(melted_mean_and_std_df, Mean = mean(value))

## save it to a file
write.table(tidy_df, file="tidy.txt", row.name=FALSE)


## view file
data <- read.table("tidy.txt", header = TRUE) 
View(data)

