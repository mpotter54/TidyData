<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>README</title>
</head>
<body>
    <h1>Directory structure</h1>
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
    <h1>Analysis description</h1>
    <p>
        A main function is created to perform the analysis called runAnalysis.  This function is contained in script file runAnalysis.R.
        <h2>Analysis steps</h2>
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