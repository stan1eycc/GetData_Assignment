# Requirements

The data for this project [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# File list

* 'README.md'
* 'run_analysis.R'

# How the script works

* Read test data set and train data set into data tables.
* Map activity labels from activity_labels.txt by merge().
* Rename column names according to names in features.txt.
* Merge two data sets into a single one
* Extract mean and std columns by grep()
* With library dplyr, summarize the average of each records which are grouped by subject_id and activity_label
* Write result to file result.txt

# For each record it is provided

* **subject_id** - An identifier of the subject who carried out the experiment.
* **activity_label** - The name of activities.

The following variables come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

* **tBodyAcc-mean()-XYZ**
* **tBodyAcc-std()-XYZ**
* **tGravityAcc-mean()-XYZ**
* **tGravityAcc-std()-XYZ**
* **tBodyGyro-mean()-XYZ**
* **tBodyGyro-std()-XYZ**

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

* **tBodyAccJerk-mean()-XYZ**
* **tBodyAccJerk-std()-XYZ**
* **tBodyGyroJerk-mean()-XYZ**
* **tBodyGyroJerk-std()-XYZ**
* **tBodyAccMag-mean()**
* **tBodyAccMag-std()**
* **tGravityAccMag-mean()**
* **tGravityAccMag-std()**
* **tBodyAccJerkMag-mean()**
* **tBodyAccJerkMag-std()**
* **tBodyGyroMag-mean()**
* **tBodyGyroMag-std()**
* **tBodyGyroJerkMag-mean()**
* **tBodyGyroJerkMag-std()**

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

* **fBodyAcc-mean()-XYZ**
* **fBodyAcc-std()-XYZ**
* **fBodyAccJerk-mean()-XYZ**
* **fBodyAccJerk-std()-XYZ**
* **fBodyGyro-mean()-XYZ**
* **fBodyGyro-std()-XYZ**
* **fBodyAccMag-mean()**
* **fBodyAccMag-std()**
* **fBodyAccJerkMag-mean()**
* **fBodyAccJerkMag-std()**
* **fBodyGyroMag-mean()**
* **fBodyGyroMag-std()**
* **fBodyGyroJerkMag-mean()**
* **fBodyGyroJerkMag-std()**

Previous signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Two sets of variables were estimated from these signals, inlcuding mean value and standard deviation.
