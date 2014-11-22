run <- function() {
  # const strings for source
  zipFile <- "getdata-projectfiles-UCI HAR Dataset.zip"
  zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  dataFolder <- "UCI HAR Dataset/"
  # check if the folder is present
  # else check if the zip file is present
  if (!file.exists(dataFolder)) {
    if (!file.exists(zipFile)) {
      download.file(zipUrl,destfile = zipFile,method = "curl") # MacOSX, sorry I dont use windows @home
    }
    unzip(zipFile)
  }

  # now lets begin
  # read training set
  train.X <- read.table(paste(dataFolder,"train/X_train.txt" , sep = ""))
  train.y <- read.table(paste(dataFolder,"train/y_train.txt", sep = ""))
  # read test sets
  test.X <- read.table(paste(dataFolder, "test/X_test.txt", sep = ""))
  test.y <- read.table(paste(dataFolder, "test/y_test.txt", sep = ""))

  # subject / people id
  subject.train <- read.table(paste(dataFolder,"train/subject_train.txt", sep = ""))
  subject.test <- read.table(paste(dataFolder, "test/subject_test.txt", sep = ""))

  # activity labels
  activity.labels <- read.table(paste(dataFolder, "activity_labels.txt", sep = ""), stringsAsFactors=F)
  #features
  features <- read.table(paste(dataFolder, "features.txt", sep = ""), stringsAsFactors = F) # must avoid factors

  # Merge: first we find correlation described in codebook that X/y is a table, that
  # X is list of observations for all 561 variables and y is the list of positions/activities
  # whence these X observations were taken.
  # further, subject train/test describes the subject's(people) id of those observations
  # Thus, a reasonable merge is the train.X x train.y + test.X x test.y. subject id can be added
  # as an extra column, if needed.
  merged.data.X <- rbind(train.X, test.X)
  merged.data.y <- rbind(train.y, test.y)
  merged.data.subject <- rbind(subject.train, subject.test)

  # Now, out of 561 variables, extract only vars with mean and std (this is a Union, not a intersection)
  index.vars.Mean <- grepl("mean\\(\\)",features$V2)
  index.vars.Std <- grepl("std\\(\\)",features$V2)
  index.vars.MeanStd <- index.vars.Mean | index.vars.Std

  merged.data.MeanStd <- merged.data.X[,index.vars.MeanStd] # column indexing, we are not filtering anything right now

#   # need helpers to add new variables
#   if (!require("dplyr")) {
#     install.packages("dplyr")
#     require("dplyr")
#   }

  # activity with numeric values or strings?
  merged.data.activity <- merge(merged.data.y, activity.labels, by.y = "V1")

  merged.dataframe <- cbind(merged.data.subject,merged.data.activity$V2,merged.data.MeanStd) # subject|activity|feat...

  # describe the columns
  column_headers <- c("subject", "activity", features$V2[index.vars.MeanStd])

  # set headers
  colnames(merged.dataframe)<-column_headers

  # step 5, create a second independent tidy data set with the average of each variable for each activity and each subject.
  if(!require("reshape2")) {
    install.packages("reshape2")
    require("reshape2")
  }
  melted.data <- melt(merged.dataframe, id.var = c("subject","activity"))
  result <- dcast(melted.data, subject + activity ~ variable, mean)
  # all done!!!! write out the result
  write.table(x = result,file = "tidydata.txt", row.names = F)
  result
}
