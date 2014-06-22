#Codebook

## Source Data
This data set was created using the source found [Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
It contains seperate testing and training sensor datasets that includes measurements for different subjects and lables for observed activities
## Files used
The following files were used from this data set
1. Test Data
..*X_test.txt
..*Y_test.txt
..*subject_test.txt
2. Training Data
..*X_train.txt
..*Y_train.txt
..*subject_train.txt
3. Features
..*features.txt
## Variables Selected
For the purpose of this exercise, all data set features or measurements that contained a mean() or std() summary within the x_test and x_training data, as indicated in the source file variable name. This will produce a feature set of 66 varialbles. In addition, the subject is included as a seperate column as well as the activitiy name.
## Transformations
1. Test and training features, activities, and subjects were consolidated
2. Only features that contained a mean() or std() in the name were retained as part of the final data set. All others were removed
3. The feature columns, subject column, and activity column were combined into a single table where each row represents a measurement for each subject
4. Variable names were transformed to makes them more specific and added to the data set
5. All features were averaged for each subject and activity pair and the final value for the feature is an average for all observations
## Variables
The data set contains the following variables
1. Subject - An id that represents the subject that was observered
2. Activity - The activity that was performed during each observation
3. Measurements - A series of measurements that were collected from the sensor. Measurements contain the following information:
..*Unit - A measurement is represents either Time elapsed or Frequency
..*Axis - The axis that was measured for the measurement in question. Not all features contain an axis: x-axis, y-axis, or z-axis
..*Var - Represents what was being measured from the sensor. The following is a list of all measurements:
...BodyAcc
...GravityAcc
...BodyAccJerk
...BodyGyro
...BodyGyroJerk
...BodyAccMag
...GravityAccMag
...BodyAccJerkMag
...BodyGyroMag
...BodyGyroJerkMag
...BodyAcc
...BodyAccJerk
...BodyGyro
...BodyAccMag
...BodyAccJerkMag
...BodyGyroMag
...BodyGyroJerkMag
..*Value - the value of the variable is one of 2 summary statistics: Mean() or Std()
4. Naming convention - variables follow a naming convention that includes: variable name_unit_axis(depending on feature)_measurement
## Values
Each row in the data set contains an average of each feature for all observations of the subject and activity pairs. (i.e. BodyAcc_Time_Y-Axis_std() is avraged of all oberservations for a particular subject and activity producting an average Std of BodyAcc time on the x axis for a subject and the observed activity e.g. laying)

