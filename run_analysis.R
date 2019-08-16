## dplyr Dependency
library(dplyr)

## string pool of constants
filename <- "Coursera_DS3_Final.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
featuresPath <- "UCI HAR Dataset/features.txt"
activitiesPath <- "UCI HAR Dataset/activity_labels.txt"
subTrainPath <- "UCI HAR Dataset/train/subject_train.txt"
subTestPath <- "UCI HAR Dataset/test/subject_test.txt"
xTrainPath <- "UCI HAR Dataset/train/X_train.txt"
yTrainPath <- "UCI HAR Dataset/train/y_train.txt"
xTestPath <- "UCI HAR Dataset/test/X_test.txt"
yTestPath <- "UCI HAR Dataset/test/y_test.txt"

## download and unzip file
download.file(fileURL, filename, method="curl")
unzip(filename) 

## features and activities extraction
features <- read.table(featuresPath, col.names = c("indexFeature","feature"))
activityLabels <- read.table(activitiesPath, col.names = c("indexActivity", "activity"))

## train data
subject_train <- read.table(subTrainPath, col.names = "subject")
x_train <- read.table(xTrainPath, col.names = features$feature)
y_train <- read.table(yTrainPath, col.names = "indexActivity")

## test data
subject_test <- read.table(subTestPath, col.names = "subject")
x_test <- read.table(xTestPath, col.names = features$feature)
y_test <- read.table(yTestPath, col.names = "indexActivity")

## train and test data merge
x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)
data <- cbind(subject_merged, y_merged, x_merged)

## extraction of the measurements on the mean and standard deviation for each measurement
TidyData <- data %>% select(subject, indexActivity, contains("mean"), contains("std"))
TidyData$indexActivity <- activityLabels[TidyData$indexActivity, 2]

## appropriately labeling the data set with descriptive names
names(TidyData)[2] = "activity"
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("^t", "TimeDomain", names(TidyData))
names(TidyData) <- gsub("^f", "FrequencyDomain", names(TidyData))
names(TidyData) <- gsub("tBody", "TimeBody", names(TidyData))
names(TidyData) <- gsub("-mean()", "Mean", names(TidyData))
names(TidyData) <- gsub("-std()", "StandardDeviation", names(TidyData))
names(TidyData) <- gsub("-freq()", "Frequency", names(TidyData))

## finalizing data
FinalData <- TidyData %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(FinalData, "data.txt", row.name=FALSE)