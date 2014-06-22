# use the plyr library
library(plyr)

# method returns the column numbers for mean() and std() columns
getColumns <- function(feat){
  a <- numeric()
  count <-1
  for(f in feat){
    split <- strsplit(as.character(f),"-")
    if(length(split[[1]])>1){
      if(split[[1]][2]=="mean()"){
        a <-c(a,count)
      }
      if(split[[1]][2]=="std()"){
        a <-c(a,count)
      }
    }
    count<-count+1
  }
  list(a)
}

# method returns the column names that contain mean() and std()
getColumnNames <- function(feat){
  a <- numeric()
  count <-1
  for(f in feat){
    split <- strsplit(as.character(f),"-")
    if(length(split[[1]])>1){
      if(split[[1]][2]=="mean()"){
        a <-c(a,f)
      }
      if(split[[1]][2]=="std()"){
        a <-c(a,f)
      }
    }
    count<-count+1
  }
  list(a)
}

# method is used to make the variable names more descriptive
repairNames<-function(nameList){
  r<-character()
  for(n in nameList[[1]]){
    split <- strsplit(as.character(n),"-")
    # if length is greater than 2, then look for axis
    var <-split[[1]][1]
    pref<-substr(var,1,1)
    var<-substring(var,2)
    print(var)
    if(pref=="f"){
      pref<-"Frequency"
    }else{
      pref<-"Time"
    }
    if(length(split[[1]])<3){
      fName <- c(var,pref,split[[1]][2])
      fName2 <-paste(fName,collapse="_")
      r<-c(r,fName2)
    }
    else{
      axis <- split[[1]][3]
      if(axis=="X"){
        axis <- "X-Axis"
      }else if(axis=="Y"){
        axis <- "Y-Axis"
      }else{
        axis <- "Z-Axis"
      }
      fName <- c(var,pref,axis,split[[1]][2])
      fName2 <-paste(fName,collapse="_")
      r<-c(r,fName2)
    }
  }
  list(r)
}

# begin the main script activities

# read the test and training attribute columns
testX <- read.table("X_test.txt")
trainX <- read.table("X_train.txt")
combined_feat<-rbind(testX,trainX)

# read the feature names
features2 <-read.table("features.txt")


# read the test and training data set activities
trainY <- read.table("y_train.txt")
testY <- read.table("y_test.txt")
# combine the activities into a single data frame
combinedAct <-rbind(testY,trainY)

# read the test training data set subjects
subTrain <- read.table("subject_train.txt")
subTest <- read.table("subject_test.txt")
# combine the subjects into a single data frame
combinedSubs <-rbind(subTest,subTrain)


# convert activity to actomic vector
combinedAct <- unlist(combinedAct)
# replace numeric values with character description
combinedAct <- mapvalues(combinedAct,c(1,2,3,4,5,6),c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'))
# convert the vector back to a data frame
combinedAct<-data.frame(combinedAct)


#create the final combined data set
combined <-data.frame(combinedSubs)

# get only the Std() and Mean() attributes to subset the data
cols <- getColumns(features2[,2])

# get the column names and make them more descriptive
names <- repairNames(getColumnNames(features2[,2]))

# retain only the std and mean columns
combined_feat<-combined_feat[,unlist(cols)]

# add the column names to the features
colnames(combined_feat)<- unlist(names)

# give a column name to the subject
colnames(combined)[1]<-"Subject"

# add the features to the final data structure
combined <- cbind(combined,combined_feat)

# add a column name to the activity column
colnames(combinedAct)[1]<-"Activity"

# add the activity column to the final combined data set
combined <- cbind(combined,combinedAct)
names(combined)
ncol(combined)
# average the variables by subject and activity
attach(combined)
final <- aggregate(combined, by=list(Subject,Activity), FUN=mean)
# remove the old columns for subject and activity
final2 <-final[ , -which(names(final) %in% c("Subject","Activity"))]
#rename the newly generated subject and activity columns
colnames(final2)[1]<-"Subject"
colnames(final2)[2]<-"Activity"

# write the data to a text file
write.table(final2, file="tidyDataSet.txt",sep="\t",row.names=FALSE)
