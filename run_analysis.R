## Cleaning Data Course Project

library(reshape2)

#Read train and test data into separate data frames
x_train_df <- read.table("x_train.txt")
x_test_df <- read.table("x_test.txt")
y_train_df <- read.table("y_train.txt")
y_test_df <- read.table("y_test.txt")
train_subject <- read.table("subject_train.txt")
test_subject <- read.table("subject_test.txt")

## Capture features names and subject IDs (columns) and index values separately
features_vec <- read.table("features.txt")
names(train_subject) <- "subjectID"
names(test_subject) <- "subjectID"
names(y_train_df) <- "activity"
names(y_test_df) <- "activity"

## Apply column names (features) to the measurements data frames
colnames(x_train_df) <- as.character(features_vec$V2)
colnames(x_test_df) <- as.character(features_vec$V2)

## Combine train and test data into one data frame
train_df <- cbind(train_subject, y_train_df, x_train_df)
test_df <- cbind(test_subject, y_test_df, x_test_df)
combined_df <- rbind(train_df, test_df)

## Search for only column names with std() or mean() in their name
features_index <- grepl("mean\\(\\)", names(combined_df)) | grepl("std\\(\\)", names(combined_df))

## Force first two columns (SubjectID and activity) to remain
features_index[1:2] <- TRUE

## Filter data frame to only include columns with desired names including std() or mean()
combined_df <- combined_df[, features_index]

## Add descriptive names to identify the activities in the data frame
combined_df$activity <- factor(combined_df$activity, labels = c("Walking", "Walking Upstairs", 
                                                                "Walking Downstairs", "Sitting", 
                                                                "Standing", "Laying"))

## Create independent data frame with average of each variable for each activity and each subject
combined_df_melt <- melt(combined_df, id=c("subjectID", "activity"))
combined_df_tidy <- dcast(combined_df_melt, subjectID+activity ~ variable, mean)

## Output independent combined tidy data frame to tidy.txt
write.table(combined_df_tidy, "tidy.txt", sep = "\t")