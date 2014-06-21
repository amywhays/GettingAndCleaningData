
run_analysis <- function() {
        
        ##  Load files into data frames
        
        strain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep="")
        xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
        ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, sep="")
        
        stest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep="")
        xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
        ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, sep="")
        
        alabel <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, sep="")
        features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, sep="")
        
        ##  Merges the training and the test sets to create one data set.
        
        xdata <- rbind(xtrain, xtest)
        ydata <- rbind(ytrain, ytest)
        
        
        ## Adding the column names
        colnames(xdata) <- features$V2
        colnames(ydata) <- "act_id"
        colnames(alabel) <- c("id", "activity")
        
        
        ##  Extracts only the measurements on the mean and
        ##  standard deviation for each measurement.
        extractCols <- grep("mean[(][)]|std[(][)]", names(xdata))
        newdata <- xdata[extractCols]
        
        mydata <- cbind(ydata, newdata)
        
        
        ##  Uses descriptive activity names to name the activities in the data set
        ## Adding activities column
        activities <- merge(alabel, mydata, by.x="id", by.y = "act_id", all = TRUE, incomparables = NA)
        
        
        
        ##  Appropriately labels the data set with descriptive variable names.
        
        oldnames <- colnames(activities)
        discnames <- gsub("[(][)]", "", oldnames)
        colnames(activities) <- discnames
        
        ## drop the id field.
        gooddata <- activities[, names(activities) != "id"]
        
        
        ## get variable names
        variables <- names(gooddata) != "activity"
        varnames <- gooddata[,variables]
        varnames<- colnames(varnames)

        
        ##  Creates a second, independent tidy data set
        ##  with the average of each variable for each activity and each subject.
        library(reshape2)
        goodmelt <- melt(gooddata, id="activity", measure.vars=varnames, na.rm=TRUE)
        goodcast <- dcast(goodmelt, activity ~ variable, mean)
        goodcast


        
}