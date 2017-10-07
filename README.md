# Getting and Cleaning Data Course Project
This repo contains my solution to the Getting and Cleaning Data Course Project.
Execute "run_analysis.R". The unzipped data needs to be on the same folder as the R file. (/UCI HAR Dataset...).

IT DOES NOT DOWNLOAD THE DATA, YOU HAVE TO MANUALLY DO IT.

# Analysis Description
The .R code has two functions:

means(arg)--> in "arg" you specify the path for the file and the function calcs the mean of each measure (total_acc(x,y,z), body_acc(x,y,z), body_gyro(x,y,z)) for the "train" and "test" datasets.

sdvs(arg)--> in "arg" you specify the path for the file and the function calcs the sdv of each measure total_acc(x,y,z), body_acc(x,y,z), body_gyro(x,y,z)) for the "train" and "test" datasets.

The analysis also reads info of each subject and each activity for the "train" and "test" datasets.

It creates two data frames and later, they are merged in one large data set with all the information about the measures (subject, type, activity, measures(means, sdvs)

For the second tidy data set, it calculates the average per activity and subject and writes in another file.
