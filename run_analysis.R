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

features <- read.table("../UCI HAR Dataset/features.txt", sep="", header=FALSE)
column.names <- as.vector(features[,2])
# Identify columns represent mean or std.
column.needed <- grep(".*[M|m]ean.*|.*[S|s]td.*", column.names)
run.data <- run.data[, c(1,2, column.needed+2)] # Right shift 2 due to subject and y table

# 3. Uses descriptive activity names to name the activities in the data set

colnames(run.data) <- c("subject_id", "activity_labels", column.names[column.needed])
remove(features, column.needed, column.names)

# 4. Appropriately labels the data set with descriptive variable names.

activity.labels <- read.table("../UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
