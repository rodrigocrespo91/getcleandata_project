# 1. Merges the training and the tests sets to create one data set
# 2. Extracts only the measurements on the mean and standard desviation for each measurement
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Apropiately labels the data set with descriptive variable names
# 5. From the data set in step 4, create a second, independent tidy data set with the average of each
# variable for each activity and each subject
library(plyr)
library(dplyr)
#Calc the mean por the measure set
means <- function (path){
        measure <- read.table(path)
        x <- vector("numeric")
        for (i in 1:dim(measure)[1]) {
                x[i] <- mean(t(measure[i,1:length(measure)]))
        }
        return(x)
}

#Calc the standard deviation por the measure set
sdvs <- function (path){
        measure <- read.table(path)
        x <- vector("numeric")
        for (i in 1:dim(measure)[1]) {
                x[i] <- sd(t(measure[i,1:length(measure)]))
        }
        return(x)
}

#Lecture of training files
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
activity_train <- as.character(activity_train$V1)
activity_train <- revalue(activity_train,c("1"="Walking","2"="Walking upstairs","3"="Walking downstairs","4"="Sitting",
                         "5"="Standing","6"="Laying"))
type_train <- c(rep("Train",7352))
total_acc_x_mean <- means("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_mean <- means("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_mean <- means("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
body_acc_x_mean <- means("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_mean <- means("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_mean <- means("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_mean <- means("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_mean <- means("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_mean <- means("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_sdv <- sdvs("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_sdv <- sdvs("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_sdv <- sdvs("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
body_acc_x_sdv <- sdvs("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_sdv <- sdvs("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_sdv <- sdvs("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_sdv <- sdvs("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_sdv <- sdvs("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_sdv <- sdvs("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")

#Construction of data_train data set
data_train <- data.frame(subject_train,type=type_train,activity=activity_train,total_acc_x_mean,total_acc_x_sdv,total_acc_y_mean,total_acc_y_sdv,
                   total_acc_z_mean,total_acc_z_sdv,body_acc_x_mean,body_acc_x_sdv,body_acc_y_mean,body_acc_y_sdv,
                   body_acc_z_mean,body_acc_z_sdv,body_gyro_x_mean,body_gyro_x_sdv,body_gyro_y_mean,body_gyro_y_sdv,
                   body_gyro_z_mean,body_gyro_z_sdv)

#Remove objects from workspace
rm(subject_train,type_train,activity_train,total_acc_x_mean,total_acc_x_sdv,total_acc_y_mean,total_acc_y_sdv,
   total_acc_z_mean,total_acc_z_sdv,body_acc_x_mean,body_acc_x_sdv,body_acc_y_mean,body_acc_y_sdv,
   body_acc_z_mean,body_acc_z_sdv,body_gyro_x_mean,body_gyro_x_sdv,body_gyro_y_mean,body_gyro_y_sdv,
   body_gyro_z_mean,body_gyro_z_sdv)


#Lecture of test files
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
activity_test <- as.character(activity_test$V1)
activity_test <- revalue(activity_test,c("1"="Walking","2"="Walking upstairs","3"="Walking downstairs","4"="Sitting",
                                           "5"="Standing","6"="Laying"))
type_test <- c(rep("Test",2947))
total_acc_x_mean <- means("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_mean <- means("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_mean <- means("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
body_acc_x_mean <- means("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_mean <- means("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_mean <- means("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_mean <- means("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_mean <- means("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_mean <- means("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_sdv <- sdvs("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_sdv <- sdvs("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_sdv <- sdvs("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
body_acc_x_sdv <- sdvs("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_sdv <- sdvs("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_sdv <- sdvs("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_sdv <- sdvs("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_sdv <- sdvs("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_sdv <- sdvs("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")

#Construction of data_test data frame
data_test <- data.frame(subject_test,type=type_test,activity=activity_test,total_acc_x_mean,total_acc_x_sdv,total_acc_y_mean,total_acc_y_sdv,
                         total_acc_z_mean,total_acc_z_sdv,body_acc_x_mean,body_acc_x_sdv,body_acc_y_mean,body_acc_y_sdv,
                         body_acc_z_mean,body_acc_z_sdv,body_gyro_x_mean,body_gyro_x_sdv,body_gyro_y_mean,body_gyro_y_sdv,
                         body_gyro_z_mean,body_gyro_z_sdv)

#Remove objects from workspace
rm(subject_test,type_test,activity_test,total_acc_x_mean,total_acc_x_sdv,total_acc_y_mean,total_acc_y_sdv,
   total_acc_z_mean,total_acc_z_sdv,body_acc_x_mean,body_acc_x_sdv,body_acc_y_mean,body_acc_y_sdv,
   body_acc_z_mean,body_acc_z_sdv,body_gyro_x_mean,body_gyro_x_sdv,body_gyro_y_mean,body_gyro_y_sdv,
   body_gyro_z_mean,body_gyro_z_sdv)

#Merges train and test data sets
data <- rbind(data_test,data_train)
rm(data_test,data_train)
names(data)[1]<-"subject"

# Write a file with the merged data set
write.csv(data,"data.csv")

# Second tidy data
activity<-c(rep("Walking",30),rep("Walking upstairs",30),rep("Walking downstairs",30),
            rep("Sitting",30),rep("Standing",30),rep("Laying",30))
subject <- c(rep(c(1:30),6))
data2 <- data.frame(activity,subject)
y <- vector("numeric",length=180)
#Average of each variable for each activity and each subject
for(i in 1:30) {
        x <- filter(data,subject==i, activity=="Walking")
        for(j in 1:18) {
                y[j] <- mean(x[,j+3])
                data2[i,j+2]<-y[j]
        }
        
}
for(i in 1:30) {
        x <- filter(data,subject==i, activity=="Walking upstairs")
        for(j in 1:18) {
                y[j] <- mean(x[,j+3])
                data2[i+30,j+2]<-y[j]
        }
        
}
for(i in 1:30) {
        x <- filter(data,subject==i, activity=="Walking downstairs")
        for(j in 1:18) {
                y[j] <- mean(x[,j+3])
                data2[i+60,j+2]<-y[j]
        }
        
}
for(i in 1:30) {
        x <- filter(data,subject==i, activity=="Sitting")
        for(j in 1:18) {
                y[j] <- mean(x[,j+3])
                data2[i+90,j+2]<-y[j]
        }
        
}
for(i in 1:30) {
        x <- filter(data,subject==i, activity=="Standing")
        for(j in 1:18) {
                y[j] <- mean(x[,j+3])
                data2[i+120,j+2]<-y[j]
        }
        
}
for(i in 1:30) {
        x <- filter(data,subject==i, activity=="Laying")
        for(j in 1:18) {
                y[j] <- mean(x[,j+3])
                data2[i+150,j+2]<-y[j]
        }
        
}
#Variable names for the new data frame
names(data2)[3:20]<-names(data)[4:21]
#Write file
write.csv(data2,"data2.csv")