# main script function to perform entire analysis
runAnalysis <- function()
{
        # set global project directory
        mainDir <- "C:/TidyData"
        dir.create(mainDir)
        subDir <- "week4ProjectZip"
        dir.create(file.path(mainDir, subDir))
        setwd(file.path(mainDir, subDir))
        # set download zip filename
        zipfilename <- "UCI HAR Dataset.zip"
        # perform download and extract
        downloadZip(zipfilename)
        #  setup current working dir
        workingdir <- "C:/TidyData/week4ProjectZip"
        workingSubDir <- "UCI HAR Dataset"
        setwd(file.path(workingdir, workingSubDir))
        #get activity labels
        activityFileName <- "activity_labels.txt"
        dfActivityNames <- getActivityNames(activityFileName)
        #get feature vector labels
        featureFileName <- "features.txt"
        dfFeatureNames <- getFeatureNames(featureFileName)
        #get train data
        workingdir <- "C:/TidyData/week4ProjectZip/UCI HAR Dataset"
        trainSubDir <- "train"
        testSubDir <- "test"
        # get subject ids train
        setwd(file.path(workingdir, trainSubDir))
        subjectFileName <- "subject_train.txt"
        dfSubjectTrain <- getSubject(subjectFileName)
        # get subject ids test
        setwd(file.path(workingdir, testSubDir))
        subjectFileName <- "subject_test.txt"
        dfSubjectTest <- getSubject(subjectFileName)
        # get activity ids train
        setwd(file.path(workingdir, trainSubDir))
        featureFileName <- "y_train.txt"
        dfFeatureTrain <- getY(featureFileName)
        # get activity ids test
        setwd(file.path(workingdir, testSubDir))
        featureFileName <- "y_test.txt"
        dfFeatureTest <- getY(featureFileName)
        # get Body Acc, Total Acc, Body Gyro Train (Not needed for analysis)
        # InertialSignalsSubDir <- "Inertial Signals"
        # setwd(file.path(file.path(workingdir, trainSubDir), InertialSignalsSubDir))
        # dfBodyAccTrain <- getBodyAcc(trainSubDir)
        # dfTotalAccTrain <- getTotalAcc(trainSubDir)
        # dfBodyGyroTrain <- getBodyGyro(trainSubDir)
        # get feature data train
        setwd(file.path(workingdir, trainSubDir))
        featureDataName <- "X_train.txt"
        dfXTrain <- getX(featureDataName, dfFeatureTrain, dfSubjectTrain, dfFeatureNames, dfActivityNames)#, dfBodyAccTrain, dfTotalAccTrain, dfBodyGyroTrain#)
        # get Body Acc, Total Acc, Body Gyro Test  (Not needed for analysis)
        # setwd(file.path(file.path(workingdir, testSubDir), InertialSignalsSubDir))
        # dfBodyAccTest <- getBodyAcc(testSubDir)
        # dfTotalAccTest <- getTotalAcc(testSubDir)
        # dfBodyGyroTest <- getBodyGyro(testSubDir)
        # get feature data test
        setwd(file.path(workingdir, testSubDir))
        featureDataName <- "X_test.txt"
        dfXTest <- getX(featureDataName, dfFeatureTest, dfSubjectTest, dfFeatureNames, dfActivityNames)#, dfBodyAccTest, dfTotalAccTest, dfBodyGyroTest)
        # output complete dataset
        dfOut <- rbind(dfXTrain, dfXTest)
        # load library needed for second dataset
        library(reshape2)
        # non-measured/measured columns for melt
        ids <- c("ActivityID", "ActivityName", "SubjectID")
        measureIds <- names(dfOut)[!names(dfOut) %in% ids]
        dfMelt <- melt(dfOut, ids, measureIds)
        # calculate mean all mesaure vars
        dfOut2 <- dcast(dfMelt, ActivityID + ActivityName + SubjectID ~ variable, mean)
        # output tidy dataset
        setwd(mainDir)
        filenameTidyData <- "tidyData.txt"
        write.table(dfOut2, filenameTidyData, row.name=FALSE)
        dfOut2
}
# download and extract project zip file
downloadZip<-function(filename)
{
        fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileurl, filename, mode="wb")
        unzip(filename)
}
# get names of activities data frame
getActivityNames<-function(fileName)
{
        df<-read.table(fileName, header = FALSE)
        colnames(df)[which(names(df) == "V1")] <- "ActivityID"
        colnames(df)[which(names(df) == "V2")] <- "ActivityName"
        df
}
# get names of feature vector data frame
getFeatureNames<-function(fileName)
{
        df<-read.table(fileName, header = FALSE)
        colnames(df)[which(names(df) == "V1")] <- "FeatureID"
        colnames(df)[which(names(df) == "V2")] <- "FeatureName"
        df
}
# get subject data ID's
getSubject<-function(fileName)
{
        df<-read.table(fileName, header = FALSE)
        colnames(df)[which(names(df) == "V1")] <- "SubjectID"
        df
}
# get feature data ID's
getY<-function(fileName)
{
        df<-read.table(fileName, header = FALSE)
        colnames(df)[which(names(df) == "V1")] <- "ActivityID"
        df
}
# get body acc
getBodyAcc<-function(dataName)
{
        fileNameX <- paste("body_acc_x_", dataName, ".txt", sep="")
        fileNameY <- paste("body_acc_y_", dataName, ".txt", sep="")
        fileNameZ <- paste("body_acc_z_", dataName, ".txt", sep="")
        dfx <- read.table(fileNameX, header = FALSE)
        colnames(dfx)<-paste("BodyAccX", match(colnames(dfx), colnames(dfx)), sep="_")
        dfy <- read.table(fileNameY, header = FALSE)
        colnames(dfy)<-paste("BodyAccY", match(colnames(dfy), colnames(dfy)), sep="_")
        dfz <- read.table(fileNameZ, header = FALSE)
        colnames(dfz)<-paste("BodyAccZ", match(colnames(dfz), colnames(dfz)), sep="_")
        df <- cbind(dfx, dfy, dfz)
        df
}
# get total acc
getTotalAcc<-function(dataName)
{
        fileNameX <- paste("total_acc_x_", dataName, ".txt", sep="")
        fileNameY <- paste("total_acc_y_", dataName, ".txt", sep="")
        fileNameZ <- paste("total_acc_z_", dataName, ".txt", sep="")
        dfx <- read.table(fileNameX, header = FALSE)
        colnames(dfx)<-paste("TotalAccX", match(colnames(dfx), colnames(dfx)), sep="_")
        dfy <- read.table(fileNameY, header = FALSE)
        colnames(dfy)<-paste("TotalAccY", match(colnames(dfy), colnames(dfy)), sep="_")
        dfz <- read.table(fileNameZ, header = FALSE)
        colnames(dfz)<-paste("TotalAccZ", match(colnames(dfz), colnames(dfz)), sep="_")
        df <- cbind(dfx, dfy, dfz)
        df
}
# get body gyro
getBodyGyro<-function(dataName)
{
        fileNameX <- paste("body_gyro_x_", dataName, ".txt", sep="")
        fileNameY <- paste("body_gyro_y_", dataName, ".txt", sep="")
        fileNameZ <- paste("body_gyro_z_", dataName, ".txt", sep="")
        dfx <- read.table(fileNameX, header = FALSE)
        colnames(dfx)<-paste("BodyGyroX", match(colnames(dfx), colnames(dfx)), sep="_")
        dfy <- read.table(fileNameY, header = FALSE)
        colnames(dfy)<-paste("BodyGyroY", match(colnames(dfy), colnames(dfy)), sep="_")
        dfz <- read.table(fileNameZ, header = FALSE)
        colnames(dfz)<-paste("BodyGyroZ", match(colnames(dfz), colnames(dfz)), sep="_")
        df <- cbind(dfx, dfy, dfz)
        df
}
# get feature data, perform extract on fields needed, and merge activityNames
getX<-function(filename, activityIDs, subjectIDs, features, activityNames, bodyAcc, totalAcc, bodyGyro)
{
        df<-read.table(filename, header = FALSE)
        colnames(df) <- features$FeatureName
        # extract only mean and standard deviation fields
        extract <- grepl("mean|std", features$FeatureName)
        df <- df[, extract]
        # add subject and activity columns
        df$SubjectID <- subjectIDs$SubjectID
        df$ActivityID <- activityIDs$ActivityID
        # merge with activity names
        mf <- merge(activityNames, df, by.x="ActivityID", by.y="ActivityID", all=TRUE)
        mf
        # body acc, total acc, body gyro not needed as they are not mean or standard deviation fields
        # df2 <- cbind(mf, bodyAcc, totalAcc, bodyGyro)
        # df2
}
