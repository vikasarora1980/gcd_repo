## Set working directory to the path where UCI HAR Dataset is present

## 0: load required packages

library(reshape2)

## 1: Merges the training and the test sets to create one data set

# read training data in data frames

subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

# read test data in data frames

subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

# read features information in data frames

featureNames <- read.table("./features.txt")

# add column name for subject files

names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

# add column names for measurement files

names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# add column name for label files

names(y_train) <- "activityID"
names(y_test) <- "activityID"

# combine training and test files into one dataset

train <- cbind(subject_train, y_train, X_train)

test <- cbind(subject_test, y_test, X_test)

train_test <- rbind(train, test)

## 2: Extract only the measurements on the mean and standard deviation for each measurement.

# Extracting columns contain "mean()" or "std()"
mean_std <- grepl("mean\\(\\)", names(train_test)) |
        grepl("std\\(\\)", names(train_test))

# Adding subjectID and activityID columns
mean_std[1:2] <- TRUE

# remove unnecessary columns
train_test <- train_test[, mean_std]


## 3: Uses descriptive activity names to name the activities in the data set.
## 4: Appropriately labels the data set with descriptive activity names. 

# convert the activity column from integer to factor
train_test$activityID <- factor(train_test$activityID, labels=c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

## STEP 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# creating tidy data set
melted <- melt(train_test, id=c("subjectID","activityID"))
tidy <- dcast(melted, subjectID+activityID ~ variable, mean)

# writing tidy data set to a file

write.table(tidy, file = "./tidy.txt", row.names=FALSE)