# Code Book- run_analysis.R

## Description

See readme.MD and the JHU Getting and Cleaning Data course page in Coursera.

## Source Data

A description of the data used in the project can the found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Cleaning steps taken in run_analysis.R:

### Merge training and test data sets into combined data set
Read train and test data into separate data frames. Read subject and features names and subject IDs to add to combined data set later. Apply features as column names of the train and test data. Combine the train and test data into one data frame.

### Extract only mean and standard deviation measurements
Search for only column names with meand() and std() in their name to subset the combined data set. Used the following general expression: "mean\\(\\)" | "std\\(\\)"

### Use descriptive activity names
Added descriptive activity names by applying labels for the corresponding Activity value in each row.

### Appropriately label data set
Kept original measurement names, but Activity column uses descriptive names.

### Create tidy data set with average of measurements on two dimensions- SubjectID and Activity
Melted data by subjectID and activity (using reshape2 library). Used dcast (also from reshape2 library) to cast a molten data frame into a tidy data frame with average of each measurement by subjectID+activity.

## Tidy.txt:

This is the summary of data fields in 'tidy.txt'- the output from run_analysis.R:

### Identifiers

* subjectID - ID of the test subject
* activity - Type of activity performed when measurements were taken

### Activity Labels

* Walking - subject was walking
* Walking Upstairs - subject was walking up a staircase
* Walking Downstairs - subject was walking down a staircase
* Sitting - subject was sitting
* Standing - subject was standing
* Laying - subject was laying down

### Measurements

* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
