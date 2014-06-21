
## This is the readme file for the assignment

###Some facts about the origin raw data: 

   The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.For more info, please refer to the README file in "UCI HAR Dataset"
   
###The processing history

   The tidy dataset I submitted is the data set with the average of each variable for each activity and each subject. Here are the steps:
   
   1.Merges the training and the test sets to create one data set.
   
   use cbind function to add the "subject" column as well as the "activity" column to the training dataset and the test dataset. After that, use rbind function to combine the training dataset with the test dataset.
   
   2.Extracts only the measurements on the mean and standard deviation for each measurement.
   
   In this section, I extract the columns whose names have relations with "mean" as well as "std" (based on the "feature_info"file in the "UCI HAR Dateset"" file). 
   
   3.Uses descriptive activity names to name the activities in the data set
   
   I use " if-else" to replace the numeric data in the "activity" column with characters like "WALKING" and so on.
   
   4.Appropriately labels the data set with descriptive variable names.
   
   use function names() to catch the vector of the current column names in the dataframe. After that, replace it with the vector that contains the actual names.
   
   5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
   
   This is the final step of producing the tidy dataset that was submitted. Just use the function "aggregate".
   
   The tidy dataset includes 68 columns(the first two are the grouping variables) and 36 rows in total.
   
   Thank you!
   
   

   