**"Getting and Cleaning Data" course Project**

Prepared by: Oltjona Dyrmishi

**Project Description**

The data linked to from the course website represent data collected from
the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain. See
'features\_info.txt' for more details.

**Purpose**

The purpose of this project is to demonstrate your ability to collect,
work with, and clean a data set.

**Goal**

The goal is to prepare tidy data that can be used for later analysis.
You will be graded by your peers on a series of yes/no questions related
to the project.

**Submission Requirements**

You will be required to submit:

1.  a tidy data set as described below,

2.  a link to a Github repository with your script for performing the
    analysis, and

3.  a code book that describes the variables, the data, and any
    transformations or work that you performed to clean up the data
    called CodeBook.md.

You should also include a README.md in the repo with your scripts. This
repo explains how all of the scripts work and how they are connected.

**Detailed Requirements**

(repeated in the source script "run\_analysis.R" alongside the actual
execution code):

1.  Merges the training and the test sets to create one data set.

2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.

3.  Uses descriptive activity names to name the activities in the data
    set

4.  Appropriately labels the data set with descriptive variable names.

5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and
    each subject.

6.  Please upload the tidy data set created in step 5 of
    the instructions. Please upload your data set as a txt file created
    with write.table() using row.name=FALSE

7.  Please submit a link to a Github repo with the code for performing
    your analysis. The code should have a file run\_analysis.R in the
    main directory that can be run as long as the Samsung data is in
    your working directory. The output should be the tidy data set you
    submitted for part 1. You should include a README.md in the repo
    describing how the script works and the code book describing
    the variables.

**Results**

-   [run\_analysis.R](https://github.com/brianhigh/smartphone-activity/blob/master/run_analysis.R) -
    The R code which performs all clean-up work

-   Tidy\_means.txt - contains the final tidied output data.

-   [CodeBook.md](https://github.com/brianhigh/smartphone-activity/blob/master/CodeBook.md) -
    Describes the variables, the data, and clean-up work performed

-   [README.md](https://github.com/brianhigh/smartphone-activity/blob/master/README.md) -
    This document explains the project, files, and how they work

**Running the script**

The description how the result has been achieved is contained within the
source file "run\_analysis.R".

This can be run as one big batch of instructions from the R console. The
only customization proably needed is to set the starting directory. Just
search for the line workDir &lt;- E:\\\\RStudio\\\\Coursera\\\\Getting
and Cleaning Data\\\\Week4" and change it to your environment.

**Importing the output file**

-   You can confirm that the output data file meets the requirements by:

    data &lt;- read.table("tidy\_means.txt", header = TRUE)

    View(data)

**Analyzed source data**

[*https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip*](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

(see below for licensing conditions of the data itself)

**Notes about data structure:**

-   "X\_train.txt" has 7352 lines with sample values -&gt; 561 columns,
    described by name in "features.txt" and with more info in
    "features\_info.txt"

-   "subject\_train.txt" has 7352 lines with coded values for the
    person (subject)

-   "y\_train.txt" has 7352 lines with coded values for the activity

> The same structure is repeated for test (replace "train" with "test"
> in file names, 2947 lines with measurement values which are added to
> the 7352 lines from the training set).

**Analyze data license:**

Use of this dataset in publications must be acknowledged by referencing
the following publication \[1\]

\[1\] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or
explicit can be addressed to the authors or their institutions for its
use or misuse. Any commercial use is prohibited.
