# CodeBook

> 1. Each variable you measure should be in one column
2. Each different observation of that variable should be in a different row
3. There should be one table for each "kind" of variable
4. If you have multiple tables, they should include a column in the table that allows them to be linked
-  Information about the variables (including units!) in the data set not contained in the tidy data
-  Information about the summary choices you made
-  Information about the experimental study design you used

## Abstract

This is the code book of the tidy data I produced using the script. It contains description on how I got the data, the transformations I performed to get the tidy data, and the informations on the variables

## Original Data

### About the source of the data

 The original data is collected for a machine learning research experiement on patterns about wearable computing. Source [article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Specifically, the data is collected from the accelerometers from the Samsung Galaxy S smartphone.

### Obtaining the data

 - [Description to the data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
 - [Zipped Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) (approx 62MB)


## Transformations

 The transformation I performed over the original data are listed below:

  1. First I have merged the training and test data sets. By appending rows/observations of both datasets I have created the "merged" dataset. Similarly I have created merged dataset for subject.

  2. I performed Selection by subsetting the merged dataset based on condition that unions the mean() and std() measurements.

  3. I then merged the activity names with activity dataset by matching activity id. The matched the dataset allows me to replace the numeric id with activity strings such as "Walking" and "Laying".

  4. I performed column combine by appending subject, activity and the previous subset together.

  5. I melted the dataset by choosing subject + activity as id. The resulting dataset is a thin, long aggregation of the variables projected by id combination.
  6. Using the melted dataset I am able to cast the average calculation into a new data set, which describes the average/mean of each variable for each subject and activity.

 The involed R functions / packages are: `rbind`, `cbind`, indexing, `merge`, `reshape2::melt` and `reshape2::dcast`

## Variables Description

  There are 35 observations of 68 measurements in the final tidy data. The variables are
```
[1] "subject"                     "activity"                    "tBodyAcc-mean()-X"
[4] "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"
[7] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"
[10] "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"
[13] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"
[16] "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"
[19] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"
[22] "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"
[25] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"
[28] "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"
[31] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"
[34] "tBodyAccMag-std()"           "tGravityAccMag-mean()"       "tGravityAccMag-std()"
[37] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"
[40] "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"
[43] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"
[46] "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"
[49] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"
[52] "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"
[55] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"
[58] "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"
[61] "fBodyAccMag-mean()"          "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()"
[64] "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"
[67] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"
```
1. subject is the subject id, the person who partake the original experiement / range `[1,30]`
2. activity is the activity the person is doing while the data were measured / range `[WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING]`
3. from 3 to 68 these are the mean values of the variables of the measurement / range `[-1,1]`
