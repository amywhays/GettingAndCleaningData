GettingAndCleaningData
======================

Coursera - Getting And Cleaning Data Course Project
---------------------------------------------------

###Description of Project

####To create one R script called run_analysis.R that does the following: 

1. Merges the training and the test sets from smartphone data to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Acknowledgements
----------------

 Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Website the raw data is from:

(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here is the raw data zip file (Which needs to be unzipped for this script to work.  Unzipped to the "UCI HAR Dataset" directory in your R-Studio working directory.  **You do not need to change your working directory.**): 

(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 




Original experiment description from the Readme.txt:
----------------------------------------------------

        ==================================================================
        Human Activity Recognition Using Smartphones Dataset
        Version 1.0
        ==================================================================
        Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
        Smartlab - Non Linear Complex Systems Laboratory
        DITEN - Università degli Studi di Genova.
        Via Opera Pia 11A, I-16145, Genoa, Italy.
        activityrecognition@smartlab.ws
        www.smartlab.ws
        ==================================================================
        
        
        The experiments have been carried out with a group of 30 volunteers within an age bracket
        of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING
        DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
        waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
        acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have
        been video-recorded to label the data manually. The obtained dataset has been randomly
        partitioned into two sets, where 70% of the volunteers was selected for generating the
        training data and 30% the test data. 
        
        The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise
        filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128
        readings/window). The sensor acceleration signal, which has gravitational and body motion
        components, was separated using a Butterworth low-pass filter into body acceleration and
        gravity. The gravitational force is assumed to have only low frequency components,
        therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of
        features was obtained by calculating variables from the time and frequency domain. See
        'features_info.txt' for more details. 
        
        For each record it is provided:
        ======================================
        
        - Triaxial acceleration from the accelerometer (total acceleration) and the estimated 
        body acceleration.
        - Triaxial Angular velocity from the gyroscope. 
        - A 561-feature vector with time and frequency domain variables. 
        - Its activity label. 
        - An identifier of the subject who carried out the experiment.

Explaination of Scripting Code:
-------------------------------


1. The script starts by loading the data files into the data frames to be analyzed.

```r
##  Load files into data frames
        
        strain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep="")
        xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
        ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, sep="")
        
        stest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep="")
        xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
        ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, sep="")
        
        alabel <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, sep="")
        features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, sep="")
```

2. It then takes the training and test data frames and merges them into xdata and ydata frames.


```r
##  Merges the training and the test sets to create one data set.
        
        xdata <- rbind(xtrain, xtest)
        ydata <- rbind(ytrain, ytest)
```







