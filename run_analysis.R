library(dplyr)

# 1. Merges the training and the test sets to create one data set.

# Read in the Train test dataset
x.train <- read.table("../UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
y.train <- read.table("../UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
subject.train <- read.table("../UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

# Read in the Test test dataset
x.test <- read.table("../UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
y.test <- read.table("../UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
subject.test <- read.table("../UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

# Merge data, save ouput for Step 1, and remove intermediate data to release memory
train <- cbind(subject.train, y.train, x.train)
test <- cbind(subject.test, y.test, x.test)
run.data <- rbind(train, test)
remove(subject.test, x.test, y.test, subject.train, x.train, y.train, test, train)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Read features name, pass it to the data, and use it to extract columns
features <- read.table("../UCI HAR Dataset/features.txt")
headers <- features[,2]

names(x.test) <- headers
names(x.train) <- headers

mean_and_std <- grepl("mean\\(\\)|std\\(\\)", headers) # Identify columns related to mean and std
x.test.mean_and_std <- x.test[,mean_and_std] # Note: Logically, it is "or", not "and".
X.train.mean_and_std <- x.train[,mean_and_std]

