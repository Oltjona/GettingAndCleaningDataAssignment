**Code Book**

This code book describes the original data set(which we refer as “raw”)
and also what was done to "clean up" these data in order to produce tidy
data sets required for this course project.

### Overview

[Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of
the original data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

[Full
Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) at
the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Files in the original data set**

The original data set contains these files:

UCI HAR Dataset/activity\_labels.txt

UCI HAR Dataset/features.txt

UCI HAR Dataset/features\_info.txt

UCI HAR Dataset/README.txt

UCI HAR Dataset/test/Inertial Signals/body\_acc\_x\_test.txt

UCI HAR Dataset/test/Inertial Signals/body\_acc\_y\_test.txt

UCI HAR Dataset/test/Inertial Signals/body\_acc\_z\_test.txt

UCI HAR Dataset/test/Inertial Signals/body\_gyro\_x\_test.txt

UCI HAR Dataset/test/Inertial Signals/body\_gyro\_y\_test.txt

UCI HAR Dataset/test/Inertial Signals/body\_gyro\_z\_test.txt

UCI HAR Dataset/test/Inertial Signals/total\_acc\_x\_test.txt

UCI HAR Dataset/test/Inertial Signals/total\_acc\_y\_test.txt

UCI HAR Dataset/test/Inertial Signals/total\_acc\_z\_test.txt

UCI HAR Dataset/test/subject\_test.txt

UCI HAR Dataset/test/X\_test.txt

UCI HAR Dataset/test/y\_test.txt

UCI HAR Dataset/train/Inertial Signals/body\_acc\_x\_train.txt

UCI HAR Dataset/train/Inertial Signals/body\_acc\_y\_train.txt

UCI HAR Dataset/train/Inertial Signals/body\_acc\_z\_train.txt

UCI HAR Dataset/train/Inertial Signals/body\_gyro\_x\_train.txt

UCI HAR Dataset/train/Inertial Signals/body\_gyro\_y\_train.txt

UCI HAR Dataset/train/Inertial Signals/body\_gyro\_z\_train.txt

UCI HAR Dataset/train/Inertial Signals/total\_acc\_x\_train.txt

UCI HAR Dataset/train/Inertial Signals/total\_acc\_y\_train.txt

UCI HAR Dataset/train/Inertial Signals/total\_acc\_z\_train.txt

UCI HAR Dataset/train/subject\_train.txt

UCI HAR Dataset/train/X\_train.txt

UCI HAR Dataset/train/y\_train.txt

The data files consist of some files containing labels and column
(variable) names and other files containing data values. The data values
consist of subject numbers (30), activity types (6), coded as the
integers 1-6, and sensor signals, from a 561-column "feature vector".

**Processing**

To clean-up the data of this project we need to combine into a single
data set the “test” and “train” data set. Only the measurements on the
mean and standard deviation for each measurement are included, (based on
assessment requirement)

The script run\_analysis.R performs the following process to clean up
the data and create tiny data sets:

**Importing the data**

Importing is performed using read.table(). Column names are assigned
with col.names. Further data tidying of column names is performed using
gsub(). For Importing process of all data, some user defined functions
are implemented:

importFeaturesColumnNames

Read "features.txt" text file into *features* data frame

importFeatures

> 1.  Read text files (“X\_train.txt” and “X\_test.txt”) into data frames
    (train\_features and test\_features)

> 2\. Remove all columns except mean() & std() columns as the assessment
> requirement no.2 “Extracts only the measurements on the mean and
> standard deviation for each measurement”.
>
> 3\. Clean up column names: remove dots (.) and capitalize Mean and Std
> using gsub()

importActivityLabels

Read text file ("activity\_labels.txt") into activities data frame

importActivities

> 1.  Read text files (“y\_train.txt” and “y\_test.txt”) into data frames
    (train\_ activities and test\_ activities)

> 2\. Set activity labels as factor labels as the assessment requirement
> no.4 “Appropriately labels the data set with descriptive variable
> names”.

importSubjects

Read text files ("train/subject\_train.txt" and
"train/subject\_train.txt") into data frames (train\_subjects and
train\_subjects)

**Merging the data sets**

The 66 numerical variables of the "features" data set were combined with
the "activites" labled as factors, and integer "subjects" data using
cbind() to produce 68-variable "test" and "train" data sets.

The "test" and "train" data sets were further combined with rbind() to
produce the 10299-row "tidy" data set. Finally, an aggregated
"tidy\_means" data set with 180 rows was produced using aggregate().

**Output file**

The resulting data sets are summarized as follows:

-   tidy

-   tidy\_means

Where "tidy" is the 10299-row combined data set with cleaned-up column
names and labels, and only the mean and standard deviation values from
the "feature vector" data.

"tidy\_means" is the aggregated data set, grouped by subject and
activity, producing a 180-row data frame.

Both data sets have 68 columns.

"tidy\_means" is exported as a text file, "tidy\_means.txt" and is
written to the "UCI HAR Dataset" folder.

This file can be imported and viewed with these commands:

data &lt;- read.table("tidy\_means.txt", header = TRUE)

View(data)
