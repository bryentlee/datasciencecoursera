library(dplyr)
#download file and unzip 
filename <- "Samsung.zip"
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, filename, method="curl")
unzip(filename)

#Read all the text files
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Combine test and train sets, then merge into 3 columns (subject, x and y)

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
S <- rbind(subject_train, subject_test)
Merged <- cbind(S, Y, X)

# Create a tidy data set with only mean and std,
# Add a separate column with its descriptive activity names
Tidy <- Merged %>% select(subject, code, contains("mean"), contains("std"))
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
Tidy$code <- activity_label[Tidy$code, 2]

#change column names "code" into "activity" in column 2 
names(Tidy)[2] = "activity"

#Make the variable names prettier by substituting
names(Tidy)<-gsub("Acc", "Accelerometer", names(Tidy))
names(Tidy)<-gsub("Gyro", "Gyroscope", names(Tidy))
names(Tidy)<-gsub("BodyBody", "Body", names(Tidy))
names(Tidy)<-gsub("Mag", "Magnitude", names(Tidy))
names(Tidy)<-gsub("^t", "Time", names(Tidy),ignore.case = TRUE)
names(Tidy)<-gsub("^f", "Frequency", names(Tidy), ignore.case = TRUE)
names(Tidy)<-gsub("tBody", "TimeBody", names(Tidy))
names(Tidy)<-gsub("-mean()", "Mean", names(Tidy), ignore.case = TRUE)
names(Tidy)<-gsub("-std()", "STD", names(Tidy), ignore.case = TRUE)
names(Tidy)<-gsub("-freq()", "Frequency", names(Tidy), ignore.case = TRUE)
names(Tidy)<-gsub("angle", "Angle", names(Tidy))
names(Tidy)<-gsub("gravity", "Gravity", names(Tidy))

#Create a categorized data table grouping by the mean of each subjects and activity

Final <- Tidy %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean=mean))
write.table(Final, "Final.txt", row.name=FALSE)


