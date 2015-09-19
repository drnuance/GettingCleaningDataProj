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

# 4. Appropriately labels the data set with descriptive variable names.
# Do step 4 first because it will be easier to operate with meaning column names
colnames(run.data) <- c("subject_id", "activity_labels_id", column.names[column.needed])
remove(features, column.needed, column.names)

# 3. Uses descriptive activity names to name the activities in the data set 

activity.labels <- read.table("../UCI HAR Dataset/activity_labels.txt", sep="", 
                              header=FALSE, col.names = c("activity_labels_id", "activity_labels"),
                              colClasses = c("integer", "character")) 
run.data <- merge(run.data, activity.labels, by.x="activity_labels_id", by.y="activity_labels_id")

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
run.data.summary <- select(run.data, -activity_labels_id) %>%
        group_by(subject_id, activity_labels) %>%
        summarise_each(funs(mean))
write.csv(run.data.summary, file = "tidy.csv")