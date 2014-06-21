##this is the assignment for the cleaning data course

##1.Merges the training and the test sets to create one data set.

x_train <- read.csv ("UCI HAR Dataset/train/X_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");
subject_train <- read.csv ("UCI HAR Dataset/train/subject_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");
y_train <- read.csv ("UCI HAR Dataset/train/y_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");
x_test <- read.csv ("UCI HAR Dataset/test/X_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");
subject_test <- read.csv ("UCI HAR Dataset/test/subject_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");
y_test <- read.csv ("UCI HAR Dataset/test/y_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");
comtrain <- cbind(x_train,subject_train,y_train)
comtest <- cbind(x_test,subject_test,y_test)
comb <- rbind(comtrain,comtest)

##2.Extracts only the measurements on the mean and standard deviation for each measurement.

n <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543)
data2 <- comb[,n]
data2$subject <- comb[[562]]
data2$activity <- comb[[563]]


##3.Uses descriptive activity names to name the activities in the data set

for(i in 1:nrow(data2)) {
  if(data2[i,67]==1){
    data2[i,67] <- "WALKING"
  }
  else if(data2[i,67]==2){
    data2[i,67] <- "WALKING_UPSTAIRS"
  }
  else if(data2[i,67]==3){
    data2[i,67] <- "WALKING_DOWNSTAIRS"
  }
  else if(data2[i,67]==4){
    data2[i,67] <- "SITTING"
  }
  else if(data2[i,67]==5){
    data2[i,67] <- "STANDING"
  } 
  else data2[i,67] <- "LAYING"
}

##4.Appropriately labels the data set with descriptive variable names.

featureset <- read.csv ("UCI HAR Dataset/features.txt",header=F, sep="", comment.char = "")
feature <- as.character(featureset[n,2])
feature1 <- c(feature,"activity","subject")
names(data2) <- feature1


##5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject

data3 <- data2
datamean <- aggregate(data3[,-67:-68],list(data3[[67]],data3[[68]]),mean)
