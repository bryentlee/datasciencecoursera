<<<<<<< HEAD
The run\_analysis.R script performs the data preparation and then
executed by the 5 steps required in the read\_me document

**Download the dataset** Dataset downloaded and unzipped from the folder
called UCI HAR Dataset

**Assign each data to variables** features &lt;- features.txt : 561
rows, 2 columns The features selected for this database come from the
accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ

activity\_label &lt;- activity\_labels.txt (6 rows, 2 columns) List of
descriptive activities performed when the measurements were taken and
its codes (1-6) subject\_test &lt;- test/subject\_test.txt (2947 rows, 1
column) contains test data of 9 volunteers test subjects being observed
x\_test &lt;- test/X\_test.txt (2947 rows, 561 columns) contains
recorded features test data y\_test &lt;- test/y\_test.txt (2947 rows, 1
columns) contains test data of activities’code labels subject\_train
&lt;- test/subject\_train.txt (7352 rows, 1 column) contains train data
of 21 volunteers subjects being observed x\_train &lt;-
test/X\_train.txt (7352 rows, 561 columns) contains recorded features
train data y\_train &lt;- test/y\_train.txt (7352 rows, 1 columns)
contains train data of activities’code labels

**Merges the training and the test sets to create one data set** X
(10299 rows, 561 columns) is created by merging x\_train and x\_test
using rbind() function Y (10299 rows, 1 column) is created by merging
y\_train and y\_test using rbind() function Subject (10299 rows, 1
column) is created by merging subject\_train and subject\_test using
rbind() function Merged (10299 rows, 563 column) is created by merging
Subject, Y and X using cbind() function

**Extracts only the measurements on the mean and standard deviation for
each measurement** Tidy (10299 rows, 88 columns) is created by
subsetting Merged, selecting only columns: subject, code and the
measurements with the word mean and std for each measurement

**Uses descriptive activity names to name the activities in the data
set** Replaced the numbers in code column (second column) of the Tidy
with corresponding activity\_label. Then, “code” column in Tidy renamed
into “activities”

**Appropriately labels the data set with descriptive variable names**

All Acc in column’s name replaced by Accelerometer All Gyro in column’s
name replaced by Gyroscope All BodyBody in column’s name replaced by
Body All Mag in column’s name replaced by Magnitude All start with
character f in column’s name replaced by Frequency All start with
character t in column’s name replaced by Time

**Creates a second, independent tidy data set with the average of each
variable for each activity and each subject**

FinalData (180 rows, 88 columns) is created by sumarizing Tidy taking
the means of each variable for each activity and each subject, after
grouping by subject and activity.

Export FinalData into Final.txt file using write.table
=======
The run_analysis.R script performs the data preparation and then
executed by the 5 steps required in the read_me document

**Download the dataset** Dataset downloaded and unzipped from the folder
called UCI HAR Dataset

**Assign each data to variables** features &lt;- features.txt : 561
rows, 2 columns The features selected for this database come from the
accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ

activity_label &lt;- activity_labels.txt (6 rows, 2 columns) List of
descriptive activities performed when the measurements were taken and
its codes (1-6) subject_test &lt;- test/subject_test.txt (2947 rows, 1
column) contains test data of 9 volunteers test subjects being observed
x_test &lt;- test/X_test.txt (2947 rows, 561 columns) contains
recorded features test data y_test &lt;- test/y_test.txt (2947 rows, 1
columns) contains test data of activities’code labels subject\_train
&lt;- test/subject_train.txt (7352 rows, 1 column) contains train data
of 21 volunteers subjects being observed x_train &lt;-
test/X_train.txt (7352 rows, 561 columns) contains recorded features
train data y_train &lt;- test/y_train.txt (7352 rows, 1 columns)
contains train data of activities’code labels

**Merges the training and the test sets to create one data set** X
(10299 rows, 561 columns) is created by merging x_train and x_test
using rbind() function Y (10299 rows, 1 column) is created by merging
y_train and y_test using rbind() function Subject (10299 rows, 1
column) is created by merging subject_train and subject_test using
rbind() function Merged (10299 rows, 563 column) is created by merging
Subject, Y and X using cbind() function

**Extracts only the measurements on the mean and standard deviation for
each measurement** Tidy (10299 rows, 88 columns) is created by
subsetting Merged, selecting only columns: subject, code and the
measurements with the word mean and std for each measurement

**Uses descriptive activity names to name the activities in the data
set** Replaced the numbers in code column (second column) of the Tidy
with corresponding activity_label. Then, “code” column in Tidy renamed
into “activities”

**Appropriately labels the data set with descriptive variable names**

All Acc in column’s name replaced by Accelerometer All Gyro in column’s
name replaced by Gyroscope All BodyBody in column’s name replaced by
Body All Mag in column’s name replaced by Magnitude All start with
character f in column’s name replaced by Frequency All start with
character t in column’s name replaced by Time

**Creates a second, independent tidy data set with the average of each
variable for each activity and each subject**

FinalData (180 rows, 88 columns) is created by sumarizing Tidy taking
the means of each variable for each activity and each subject, after
grouping by subject and activity.

Export FinalData into Final.txt file using write.table
>>>>>>> 9edf799949c8bc88853bfb52a7f88fb7b8675b85
