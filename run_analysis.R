####################################################################################
#
# Getting and Cleaning Data Course Project
# 

# Script: run_analysis.R

# Project description:

# You should create one R script called run_analysis.R that does the following. 
# 1 - Merges the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names. 
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average
#     of each variable for each activity and each subject.

# 6 - Please upload the tidy data set created in step 5 of the instructions.
#     Please upload your data set as a txt file created with write.table() using row.name=FALSE

# 7 - Please submit a link to a Github repo with the code for performing your analysis.
#     The code should have a file run_analysis.R in the main directory that can be run as long
#     as the Samsung data is in your working directory. The output should be the tidy data set
#     you submitted for part 1. You should include a README.md in the repo describing how the
#     script works and the code book describing the variables.


# ---------------------------------------------------------------------
# Preparations
# ---------------------------------------------------------------------

workDir <- "E:\\RStudio\\Coursera\\Getting and Cleaning Data\\Week4"
setwd(workDir)


# download the source and unzip into a data directory
urlFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "Dataset.zip"

if (!file.exists("data")) {
  dir.create("data")
}

setwd("data")

if (!file.exists("UCI HAR Dataset")) {
  download.file(urlFile, destfile = "Dataset.zip")
  date()
  
  list.files(pattern = zipFile)
  unzip(zipFile)
  
}


dataDir <- "./UCI HAR Dataset"

setwd(dataDir)


# ---------------------------------------------------------------------
# Functions
# ---------------------------------------------------------------------
# -----------------------------------------------------
# Import "features" column names for 561-feature vector
# -----------------------------------------------------
importFeaturesColumnNames <- function(filename){
  df <- read.table(filename, header = FALSE, 
                   stringsAsFactors = FALSE,
                   col.names = c("number", "name"))
  return(df$name)
}

# -------------------------
# Import feature vector
# -------------------------
importFeatures <- function(filename, colnames){
  # Read text file into data frame
  df <- read.table(filename, header = FALSE, sep = "", 
                   stringsAsFactors = FALSE, col.names = colnames)
  
  # Remove all columns except mean() & std() columns 
  #
  # -- Requirement --
  #
  # 2. Extracts only the measurements on the mean and standard deviation 
  #    for each measurement.
  #
  df <- df[, grep("[.](mean|std)[.]", colnames(df))]
  
  # -- Requirement --
  #
  # 4. Appropriately labels the data set with descriptive variable names.
  #
  
  #
  # Clean up column names: remove dots (.) and capitalize Mean and Std
  
  names(df) <- gsub("[.]", "", names(df))
  names(df) <- gsub("mean", "Mean", names(df))
  names(df) <- gsub("std", "Std", names(df))
  
  return(df)
}

# ----------------------
# Import activity labels
# ----------------------
#
# ** Requirement **
#
# 3. Uses descriptive activity names to name the activities in the data set
#
#
importActivityLabels <- function(filename){
  # Read text file into data frame
  df <- read.table(filename, header = FALSE, 
                   stringsAsFactors = FALSE, 
                   col.names = c("level", "label"))
  
  return(df)
}

# -----------------
# Import activities
# -----------------
importActivities <- function(filename, factors){
  # Read text file into data frame
  df <- read.table(filename, header = FALSE, sep = "", 
                   stringsAsFactors = FALSE, col.names = c("activity"))
  
  # Set activity labels as factor labels
  #
  # -- Requirement --
  #
  # 4. Appropriately labels the data set with descriptive variable names.
  #
  #
  df$activity <- factor(df$activity, 
                        levels = factors$level, labels = factors$label)
  
  return(df)
}


# Import subjects
importSubjects <- function(filename){
  # Read text file into data frame
  df <- read.table(filename, header = FALSE, sep = "", 
                   stringsAsFactors = FALSE, col.names = c("subject"))
  
  return(df)
}

####################################################################################
# 1 - Import all data
####################################################################################

features <- importFeaturesColumnNames("features.txt")
train_features <- importFeatures("train/X_train.txt", features)
test_features <- importFeatures("test/X_test.txt", features)
activities <- importActivityLabels("activity_labels.txt")
train_activities <- importActivities("train/y_train.txt", activities)
test_activities <- importActivities("test/y_test.txt", activities)
train_subjects <- importSubjects("train/subject_train.txt")
test_subjects <- importSubjects("test/subject_test.txt")


####################################################################################
# 2 - Merge training and test set
####################################################################################

# Combine features, activities, and subjects data frames
train <- cbind(train_features, train_activities, train_subjects)
test <- cbind(test_features, test_activities, test_subjects)
#
# Combine train and test data frames into a single data frame
#
# -- Requirement --
#
# 1. Merges the training and the test sets to create one data set.
#
#       Either a wide or a long form of the data is acceptable if it meets the 
#       tidy data principles of week 1 (Each variable you measure should be in 
#       one column, Each different observation of that variable should be in a 
#       different row).
#
# 
tidy <- rbind(train, test)

# -- Requirement --
#
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
#
tidy_means <- with(tidy, aggregate(tidy[,1:66], 
                                   by=list(activity=activity, subject=subject), 
                                   FUN=mean))

# -- Requirement --
#
# Export as a txt file created with write.table() using row.name=FALSE.
#
# Export this data frame to a text file
write.table(tidy_means, file="tidy_means.txt", row.names=FALSE)

# For users of this data set: To Import and view in R, run these commands ...
#data <- read.table("tidy_means.txt", header = TRUE)
#View(data)