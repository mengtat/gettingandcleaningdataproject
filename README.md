---
title: "README -- Getting and Cleaning Data"
output: html_document
---

You are reading the README for class project for Getting and Cleaning Data. In this project, we learn how to get, clean, transform data. The final deliverable is a tidy data set.


## 5 Steps were performed in the project (project instructions)
1. Merges the training and the test sets to create one data set.
2. racts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### Data
Data were downloaded from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Step 1
1. All data sets from the training and testing set are downloaded and loaded into data frames.
2. Activity, subject, and measurement are combined for both the training and testing data sets (using cbind).
3. training and testing data sets are combined (using rbind) into full_data_df.
4. Activity labels are read into activity_labels_df.

### Step 2
1. full_data_df is subset by selecting only columns with "mean()" and "std()" in their names. The result is stored in mean_and_std_df.

### Step 3
1. mean_and_std_df andactivity_labels_df are merged using their corresponding activity id columns.
2. Activity Id was removed from the data frame.

### Step 4
1. All column names in mean_and_std_df are updated by replacing abbreviation terms with more descriptive terms.

### Step 5
1. mean_and_std_df are melted into a skinny form
2. Mean of measurement are calculated by using the summarise function. Data frame are group_by Subject, Activity, and Measurement.

## Tidy data 
The tidy data was saved to a file called "tidy.txt" and uploaded to Coursera website. It is a tidy data set because it satisfies the following requirements:
* Each variable measurement is in one column
* Each different observation is in one row
* It only contains one kind of variable


## Reading the output file

```{r}
data <- read.table("tidy.txt", header = TRUE) 
View(data)
```
