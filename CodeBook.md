---
title: DATA DICTIONARY - Tiny Data
output: html_document
---

### Data
Data were downloaded from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Full description can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

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

## Subject : Subject ID : int
* 1..30

## Activity : Activity Type : Factor with 6 levels
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING  

## Measurement : Factor with 66 levels
* TimeBodyAccelerationMeanXaxis
* TimeBodyAccelerationMeanYaxis
* TimeBodyAccelerationMeanZaxis
* TimeBodyAccelerationStandardDeviationXaxis
* TimeBodyAccelerationStandardDeviationYaxis
* TimeBodyAccelerationStandardDeviationZaxis
* TimeGravityAccelerationMeanXaxis
* TimeGravityAccelerationMeanYaxis
* TimeGravityAccelerationMeanZaxis
* TimeGravityAccelerationStandardDeviationXaxis
* TimeGravityAccelerationStandardDeviationYaxis
* TimeGravityAccelerationStandardDeviationZaxis
* TimeBodyAccelerationJerkMeanXaxis
* TimeBodyAccelerationJerkMeanYaxis
* TimeBodyAccelerationJerkMeanZaxis
* TimeBodyAccelerationJerkStandardDeviationXaxis
* TimeBodyAccelerationJerkStandardDeviationYaxis
* TimeBodyAccelerationJerkStandardDeviationZaxis
* TimeBodyGyroscopeMeanXaxis
* TimeBodyGyroscopeMeanYaxis
* TimeBodyGyroscopeMeanZaxis
* TimeBodyGyroscopeStandardDeviationXaxis
* TimeBodyGyroscopeStandardDeviationYaxis
* TimeBodyGyroscopeStandardDeviationZaxis
* TimeBodyGyroscopeJerkMeanXaxis
* TimeBodyGyroscopeJerkMeanYaxis
* TimeBodyGyroscopeJerkMeanZaxis
* TimeBodyGyroscopeJerkStandardDeviationXaxis
* TimeBodyGyroscopeJerkStandardDeviationYaxis
* TimeBodyGyroscopeJerkStandardDeviationZaxis
* TimeBodyAccelerationMagnitudeMean
* TimeBodyAccelerationMagnitudeStandardDeviation
* TimeGravityAccelerationMagnitudeMean
* TimeGravityAccelerationMagnitudeStandardDeviation
* TimeBodyAccelerationJerkMagnitudeMean
* TimeBodyAccelerationJerkMagnitudeStandardDeviation
* TimeBodyGyroscopeMagnitudeMean
* TimeBodyGyroscopeMagnitudeStandardDeviation
* TimeBodyGyroscopeJerkMagnitudeMean
* TimeBodyGyroscopeJerkMagnitudeStandardDeviation
* FrequencyBodyAccelerationMeanXaxis
* FrequencyBodyAccelerationMeanYaxis
* FrequencyBodyAccelerationMeanZaxis
* FrequencyBodyAccelerationStandardDeviationXaxis
* FrequencyBodyAccelerationStandardDeviationYaxis
* FrequencyBodyAccelerationStandardDeviationZaxis
* FrequencyBodyAccelerationJerkMeanXaxis
* FrequencyBodyAccelerationJerkMeanYaxis
* FrequencyBodyAccelerationJerkMeanZaxis
* FrequencyBodyAccelerationJerkStandardDeviationXaxis
* FrequencyBodyAccelerationJerkStandardDeviationYaxis
* FrequencyBodyAccelerationJerkStandardDeviationZaxis
* FrequencyBodyGyroscopeMeanXaxis
* FrequencyBodyGyroscopeMeanYaxis
* FrequencyBodyGyroscopeMeanZaxis
* FrequencyBodyGyroscopeStandardDeviationXaxis
* FrequencyBodyGyroscopeStandardDeviationYaxis
* FrequencyBodyGyroscopeStandardDeviationZaxis
* FrequencyBodyAccelerationMagnitudeMean
* FrequencyBodyAccelerationMagnitudeStandardDeviation
* FrequencyBodyBodyAccelerationJerkMagnitudeMean
* FrequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation
* FrequencyBodyBodyGyroscopeMagnitudeMean
* FrequencyBodyBodyGyroscopeMagnitudeStandardDeviation
* FrequencyBodyBodyGyroscopeJerkMagnitudeMean
* FrequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation

## Mean : Mean of Mesaurement : numeric
