
library(dplyr)
library(reshape2)

##Reading the files 'activity_labels.txt' and 'features.txt'.
activity_labels <- read.table("C:/Users/asus1/Documents/UCI HAR Dataset/activity_labels.txt")
features <- read.table("C:/Users/asus1/Documents/UCI HAR Dataset/features.txt")[,2]

##Reading files 'X_train.txt', 'y_train' and 'subject_train.txt' in the folder 'train'. 
X_train <- read.table("C:/Users/asus1/Documents/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/asus1/Documents/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("C:/Users/asus1/Documents/UCI HAR Dataset/train/subject_train.txt")
##The level numbers in the y_train dataset is given the name of the activity performed which is in the second column of the activity_labels. 
y_train_new <- factor(y_train, levels = c(1,2,3,4,5,6), labels = activity_labels[,2])
##The name of columns of the X_train are assigned the names of features.
colnames(X_train) <- features
##A dataset1 is made which only consists the columns which consisted the data for mean and standard deviation.
dataset1 <- X_train[,grep("[Mm]ean|[Ss]td",names(X_train))]
##data1, a dataset for train is make which consists the subject in the 'Subject' column, the activity performed in the 'Activity' column and the rest dataset1 which consist the data for mean and std.
data1 <- cbind(Subject = subject_train[,1], Activity = y_train_new, dataset1)

##Reading files 'X_test.txt', 'y_test' and 'subject_test.txt' in the folder 'test'. 
X_test <- read.table("C:/Users/asus1/Documents/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/asus1/Documents/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/asus1/Documents/UCI HAR Dataset/test/subject_test.txt")
##The level numbers in the y_test dataset is given the name of the activity performed which is in the second column of the activity_labels.
y_test_new <- factor(y_test, levels = c(1,2,3,4,5,6), labels = activity_labels[,2])
##The name of columns of the X_test are assigned the names of features.
colnames(X_test) <- features
##A new dataset2 is made which only consists the columns which consisted the data for mean and standard deviation.
dataset2 <- X_test[,grep("[Mm]ean|[Ss]td",names(X_test))]
##data2, a dataset for test is make which consists the subject in the 'Subject' column, the activity performed in the 'Activity' column and the rest dataset1 which consist the data for mean and std.
data2 <- cbind(Subject = subject_test[,1], Activity = y_test_new, dataset2)

##The 'train' and 'test' dataset made is combined column wise.
tidy1 <- rbind(data1,data2)

##Mean of each subject and each activity performed by him is calculated.
tidy2 <- tidy1 %>% melt(id = c("Subject","Activity")) %>% dcast(Subject+Activity~variable,mean)
