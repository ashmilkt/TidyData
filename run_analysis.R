##checking the files areready
list.files("C:/Users/ashmi/Desktop/UCI HAR Dataset")
##create a new file which has all the files
allfiles=list.files("C:/Users/ashmi/Desktop/UCI HAR Dataset",recursive = T)
##show
allfiles
##reading the data
xtrain=read.table(file = "C:/Users/ashmi/Desktop/UCI HAR Dataset/train/X_train.txt")
ytrain=read.table(file = "C:/Users/ashmi/Desktop/UCI HAR Dataset/train/y_train.txt")
subjecttrain=read.table(file = "C:/Users/ashmi/Desktop/UCI HAR Dataset/train/subject_train.txt")
xtest=read.table(file = "C:/Users/ashmi/Desktop/UCI HAR Dataset/test/X_test.txt")
ytest=read.table(file = "C:/Users/ashmi/Desktop/UCI HAR Dataset/test/y_test.txt")
subjecttest=read.table(file = "C:/Users/ashmi/Desktop/UCI HAR Dataset/test/subject_test.txt")
xtrain
ytrain
subjecttrain
xtest
ytest
subjecttest
head(xtrain)
head(xtest)
head(ytrain)
head(ytest)
head(subjecttrain)
head(subjecttest)
str(colnames)
colnames(xtrain)
features=read.table(file = "C:\Users\ashmi\Desktop\UCI HAR Dataset\features.txt")
features=read.table(file = "C:/Users/ashmi/Desktop/UCI HAR Dataset/features.txt")
##now giving column names
colnames(xtrain)=features[,2]
colnames(xtest)=features[,2]
colnames(ytrain)="activityno"
colnames(ytest)="activityno"
colnames(subjecttrain)="subjectno"
colnames(subjecttest)="subjectno"
head(xtest)
head(ytest)
head(subjecttest)
##binding
train_merged= cbind(xtrain,ytrain,subjecttrain)
head(train_merged)
test_merged=cbind(xtest,ytest,subjecttest)
test_merged
total_merged=rbind(train_merged,test_merged)
head(total_merged)
##merging competed
tail(total_merged)
ColumnName=colnames(total_merged)
ColumnName
mean_and_sd=(grepl("activityno",ColumnName)|grepl("subjectno",ColumnName)|grepl("mean..",ColumnName)|grepl("std..",ColumnName))
##this is taking only mean and std deviation to another set
mean_and_sd
fianl_mean_sd=total_merged[,mean_and_sd==T]
fianl_mean_sd
head(fianl_mean_sd)
##mean and sd seperated
##now setting descriptive activity names
activityLabels=read.table(file = "C:/Users/ashmi/Desktop/UCI HAR Dataset/activity_labels.txt")
colnames(activityLabels)=c("activityno","activity_type")
head(activityLabels)
str(merge)
ActNames=merge(fianl_mean_sd,activityLabels,by="activityno",by='activityno',all.x = T)
activityLabels
ActNames=merge(fianl_mean_sd,activityLabel,by="activityno")
ActNames=merge(fianl_mean_sd,activityLabels,by="activityno")
head(ActNames)
##descriptive variable names already assigned
##now the final fifth step
tidy1=aggregate(. ~subjectno+activityno,ActNames,mean)
warning()
warnings()
head(tidy1)
tidy1=aggregate(. ~subjectno+activityno,ActNames,mean)
tidy1=aggregate(. ~subjectno + activityno, ActNames, mean)
tidy1
write.table(ActNames,"tidydata.txt", row.names = F)
