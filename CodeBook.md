<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>CodeBook</title>
</head>
<body>
    <h1>CodeBook</h1>
    <h2>Dataset Source</h2>
    <p>
        A complete description of the data source is located here <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">Study Data</a>
        The download location for the zip file holding the actual data is located here <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Zip file</a>
    </p>
    <h2>Data definition</h2>
    <p>
        The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
    </p>
    <p>
        Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
        Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
    </p>
    <p>
        These signals were used to estimate variables of the feature vector for each pattern:
        '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
    </p>
    <p>
        <ul>
            <li>tBodyAcc-XYZ</li>
            <li>tGravityAcc-XYZ</li>
            <li>tBodyAccJerk-XYZ</li>
            <li>tBodyGyro-XYZ</li>
            <li>tBodyGyroJerk-XYZ</li>
            <li>tBodyAccMag</li>
            <li>tGravityAccMag</li>
            <li>tBodyAccJerkMag</li>
            <li>tBodyGyroMag</li>
            <li>tBodyGyroJerkMag</li>
            <li>fBodyAcc-XYZ</li>
            <li>fBodyAccJerk-XYZ</li>
            <li>fBodyGyro-XYZ</li>
            <li>fBodyAccMag</li>
            <li>fBodyAccJerkMag</li>
            <li>fBodyGyroMag</li>
            <li>fBodyGyroJerkMag</li>
        </ul>
    </p>
    <p>
        The set of variables that were estimated from these signals are:
    </p>
    <p>
        <ul>
            <li>mean(): Mean value</li>
            <li>std(): Standard deviation</li>
            <li>mad(): Median absolute deviation</li>
            <li>max(): Largest value in array</li>
            <li>min(): Smallest value in array</li>
            <li>sma(): Signal magnitude area</li>
            <li>energy(): Energy measure. Sum of the squares divided by the number of values.</li>
            <li>iqr(): Interquartile range</li>
            <li>entropy(): Signal entropy</li>
            <li>arCoeff(): Autorregresion coefficients with Burg order equal to 4</li>
            <li>correlation(): correlation coefficient between two signals</li>
            <li>maxInds(): index of the frequency component with largest magnitude</li>
            <li>meanFreq(): Weighted average of the frequency components to obtain a mean frequency</li>
            <li>skewness(): skewness of the frequency domain signal</li>
            <li>kurtosis(): kurtosis of the frequency domain signal</li>
            <li>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.</li>
            <li>angle(): Angle between to vectors.</li>
        </ul>
    </p>
    <p>
        Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
    </p>
    <p>
        <ul>
            <li>gravityMean</li>
            <li>tBodyAccMean</li>
            <li>tBodyAccJerkMean</li>
            <li>tBodyGyroMean</li>
            <li>tBodyGyroJerkMean</li>
        </ul>
    </p>
    <h2>Data extracted</h2>
    <p>
        The featuredata extracted were only those fields for the mean (mean()) and the standard deviation (std())
    </p>
    <h2>Directory structure</h2>
    <p>When extracted from the zip file the following directory structure is created</p> 
    <ul>
        <li>Root -> C:/TidyData/week4ProjectZip
            <ul>
                <li>UCI HAR Dataset.zip -> Zip file containing all files</li>
                <li>Directory created thru unzip -> C:/TidyData/week4ProjectZip/UCI HAR Dataset
                    <ul>
                        <li>activity_labels.txt -> table text file containing ActivityIDs and Activity Names (6 rows, 2 columns)</li>
                        <li>features_info.txt - >Describes feature data collected</li>
                        <li>features.txt -> Descriptive column names for feature vector (561 rows, 2 columns)</li>
                        <li>train data subdirectory -> C:/TidyData/week4ProjectZip/UCI HAR Dataset/train
                            <ul>
                                <li>subject_train.txt -> contains subject ids for all rows in x_train.txt</li>
                                <li>y_train.txt -> contains activity ids for all rows in x_train.txt</li>
                                <li>x_train.txt -> contains feature vector data</li>
                            </ul>
                        </li>
                        <li>
                            test data subdirectory -> C:/TidyData/week4ProjectZip/UCI HAR Dataset/test
                            <ul>
                                <li>subject_test.txt -> contains subject ids for all rows in x_test.txt</li>
                                <li>y_test.txt -> contains activity ids for all rows in x_test.txt</li>
                                <li>x_test.txt -> contains feature vector data</li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
    <h2>Analysis description</h2>
    <p>
        A main function is created to perform the analysis called runAnalysis.  This function is contained in script file runAnalysis.R.
        <h3>Analysis steps</h3>
        <ul>
            <li>Run R studio and load script file runAnalysis.R</li>
            <li>Execute function runAnalysis()
                <ul>
                    <li>Create root directory as defined by mainDir(C:/TidyData) and subDir(week4ProjectZip)</li>
                    <li>Call function downloadZip to download and extract the project zip file</li>
                    <li>Call function getActivityNames to read activity_labels.txt into a data frame (maps activity ID to a descriptive activity name)</li>
                    <li>Call function getFeatureNames to read features.txt into a data frame (descriptive column names for feature vector)</li>
                    <li>Process Train data
                        <ul>
                            <li>Call function getSubject to read in train subject ids</li>
                            <li>Call function getY to read in train activity ids</li>
                            <li>Call function getX to read in train feature data, extract only the mean and std columns, add subjectid column, add activity id column, and merge the activity names</li>
                        </ul>
                    </li>
                    <li>
                        Process Test data
                        <ul>
                            <li>Call function getSubject to read in test subject ids</li>
                            <li>Call function getY to read in test activity ids</li>
                            <li>Call function getX to read in test feature data, extract only the mean and std columns, add subjectid column, add activity id column, and merge the activity names</li>
                        </ul>
                    </li>
                    <li>Merge the train and test data frames using rbind</li>
                    <li>Use the Rshape2 library to create a measure data frame measuring all variables except for ActivityID, ActivityName, and SubjectID</li>
                    <li>Use the dcast function against the measure data frame from previous step to summarize the data using the mean function</li>
                    <li>Write the data from previous step to tidyData.txt</li>
                </ul>
            </li>
        </ul>
    </p>
</body>
</html>