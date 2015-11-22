## Code book for the data derived from the UCI HAR Dataset.
#### This data presented has been created by merging the data from the test and train data sets, extracting all mean and standard deviation related features, summarized, and finally output with readable activity labels.
#### Each observation consists of the activity measured, the subject conducting the activity measured as well as the means of all measurements involving either a mean or standard deviation.
#### The following quotation, take in full from the source data (see features_info,txt), describes how time related features were both generated and sampled.
_The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz._
_Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)._
_Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)._
_These signals were used to estimate variables of the feature vector for each pattern._
#### The columns for each observation are as follows.
* __activity__ -- The activity being conducted when the observation was made.
* __subject__ -- The subject conducting the activity when the observation was made.
* __tBodyAcc-mean()-X__ -- Mean of tBodyAcc-mean()-X for all observations of the activity conducted by the indicated subject.
* __tBodyAcc-mean()-Y__ -- Mean of tBodyAcc-mean()-Y for all observations of the activity conducted by the indicated subject.
* __tBodyAcc-mean()-Z__ -- Mean of tBodyAcc-mean()-Z for all observations of the activity conducted by the indicated subject.
* __tGravityAcc-mean()-X__ -- Mean of tGravityAcc-mean()-X for all observations of the activity conducted by the indicated subject.
* __tGravityAcc-mean()-Y__ -- Mean of tGravityAcc-mean()-Y for all observations of the activity conducted by the indicated subject.
* __tGravityAcc-mean()-Z__ -- Mean of tGravityAcc-mean()-Z for all observations of the activity conducted by the indicated subject.
* __tBodyAccJerk-mean()-X__ -- Mean of tBodyAccJerk-mean()-X for all observations of the activity conducted by the indicated subject.
* __tBodyAccJerk-mean()-Y__ -- Mean of tBodyAccJerk-mean()-Y for all observations of the activity conducted by the indicated subject.
* __tBodyAccJerk-mean()-Z__ -- Mean of tBodyAccJerk-mean()-Z for all observations of the activity conducted by the indicated subject.
* __tBodyGyro-mean()-X__ -- Mean of tBodyGyro-mean()-X for all observations of the activity conducted by the indicated subject.
* __tBodyGyro-mean()-Y__ -- Mean of tBodyGyro-mean()-Y for all observations of the activity conducted by the indicated subject.
* __tBodyGyro-mean()-Z__ -- Mean of tBodyGyro-mean()-Z for all observations of the activity conducted by the indicated subject.
* __tBodyGyroJerk-mean()-X__ -- Mean of tBodyGyroJerk-mean()-X for all observations of the activity conducted by the indicated subject.
* __tBodyGyroJerk-mean()-Y__ -- Mean of tBodyGyroJerk-mean()-Y for all observations of the activity conducted by the indicated subject.
* __tBodyGyroJerk-mean()-Z__ -- Mean of tBodyGyroJerk-mean()-Z for all observations of the activity conducted by the indicated subject.
* __tBodyAccMag-mean()__ -- Mean of tBodyAccMag-mean() for all observations of the activity conducted by the indicated subject.
* __tGravityAccMag-mean()__ -- Mean of tGravityAccMag-mean() for all observations of the activity conducted by the indicated subject.
* __tBodyAccJerkMag-mean()__ -- Mean of tBodyAccJerkMag-mean() for all observations of the activity conducted by the indicated subject.
* __tBodyGyroMag-mean()__ -- Mean of tBodyGyroMag-mean() for all observations of the activity conducted by the indicated subject.
* __tBodyGyroJerkMag-mean()__ -- Mean of tBodyGyroJerkMag-mean() for all observations of the activity conducted by the indicated subject.
* __fBodyAcc-mean()-X__ -- Mean of fBodyAcc-mean()-X for all observations of the activity conducted by the indicated subject.
* __fBodyAcc-mean()-Y__ -- Mean of fBodyAcc-mean()-Y for all observations of the activity conducted by the indicated subject.
* __fBodyAcc-mean()-Z__ -- Mean of fBodyAcc-mean()-Z for all observations of the activity conducted by the indicated subject.
* __fBodyAccJerk-mean()-X__ -- Mean of fBodyAccJerk-mean()-X for all observations of the activity conducted by the indicated subject.
* __fBodyAccJerk-mean()-Y__ -- Mean of fBodyAccJerk-mean()-Y for all observations of the activity conducted by the indicated subject.
* __fBodyAccJerk-mean()-Z__ -- Mean of fBodyAccJerk-mean()-Z for all observations of the activity conducted by the indicated subject.
* __fBodyGyro-mean()-X__ -- Mean of fBodyGyro-mean()-X for all observations of the activity conducted by the indicated subject.
* __fBodyGyro-mean()-Y__ -- Mean of fBodyGyro-mean()-Y for all observations of the activity conducted by the indicated subject.
* __fBodyGyro-mean()-Z__ -- Mean of fBodyGyro-mean()-Z for all observations of the activity conducted by the indicated subject.
* __fBodyAccMag-mean()__ -- Mean of fBodyAccMag-mean() for all observations of the activity conducted by the indicated subject.
* __fBodyBodyAccJerkMag-mean()__ -- Mean of fBodyBodyAccJerkMag-mean() for all observations of the activity conducted by the indicated subject.
* __fBodyBodyGyroMag-mean()__ -- Mean of fBodyBodyGyroMag-mean() for all observations of the activity conducted by the indicated subject.
* __fBodyBodyGyroJerkMag-mean()__ -- Mean of fBodyBodyGyroJerkMag-mean() for all observations of the activity conducted by the indicated subject.
* __tBodyAcc-std()-X__ -- Mean of tBodyAcc-std()-X for all observations of the activity conducted by the indicated subject.
* __tBodyAcc-std()-Y__ -- Mean of tBodyAcc-std()-Y for all observations of the activity conducted by the indicated subject.
* __tBodyAcc-std()-Z__ -- Mean of tBodyAcc-std()-Z for all observations of the activity conducted by the indicated subject.
* __tGravityAcc-std()-X__ -- Mean of tGravityAcc-std()-X for all observations of the activity conducted by the indicated subject.
* __tGravityAcc-std()-Y__ -- Mean of tGravityAcc-std()-Y for all observations of the activity conducted by the indicated subject.
* __tGravityAcc-std()-Z__ -- Mean of tGravityAcc-std()-Z for all observations of the activity conducted by the indicated subject.
* __tBodyAccJerk-std()-X__ -- Mean of tBodyAccJerk-std()-X for all observations of the activity conducted by the indicated subject.
* __tBodyAccJerk-std()-Y__ -- Mean of tBodyAccJerk-std()-Y for all observations of the activity conducted by the indicated subject.
* __tBodyAccJerk-std()-Z__ -- Mean of tBodyAccJerk-std()-Z for all observations of the activity conducted by the indicated subject.
* __tBodyGyro-std()-X__ -- Mean of tBodyGyro-std()-X for all observations of the activity conducted by the indicated subject.
* __tBodyGyro-std()-Y__ -- Mean of tBodyGyro-std()-Y for all observations of the activity conducted by the indicated subject.
* __tBodyGyro-std()-Z__ -- Mean of tBodyGyro-std()-Z for all observations of the activity conducted by the indicated subject.
* __tBodyGyroJerk-std()-X__ -- Mean of tBodyGyroJerk-std()-X for all observations of the activity conducted by the indicated subject.
* __tBodyGyroJerk-std()-Y__ -- Mean of tBodyGyroJerk-std()-Y for all observations of the activity conducted by the indicated subject.
* __tBodyGyroJerk-std()-Z__ -- Mean of tBodyGyroJerk-std()-Z for all observations of the activity conducted by the indicated subject.
* __tBodyAccMag-std()__ -- Mean of tBodyAccMag-std() for all observations of the activity conducted by the indicated subject.
* __tGravityAccMag-std()__ -- Mean of tGravityAccMag-std() for all observations of the activity conducted by the indicated subject.
* __tBodyAccJerkMag-std()__ -- Mean of tBodyAccJerkMag-std() for all observations of the activity conducted by the indicated subject.
* __tBodyGyroMag-std()__ -- Mean of tBodyGyroMag-std() for all observations of the activity conducted by the indicated subject.
* __tBodyGyroJerkMag-std()__ -- Mean of tBodyGyroJerkMag-std() for all observations of the activity conducted by the indicated subject.
* __fBodyAcc-std()-X__ -- Mean of fBodyAcc-std()-X for all observations of the activity conducted by the indicated subject.
* __fBodyAcc-std()-Y__ -- Mean of fBodyAcc-std()-Y for all observations of the activity conducted by the indicated subject.
* __fBodyAcc-std()-Z__ -- Mean of fBodyAcc-std()-Z for all observations of the activity conducted by the indicated subject.
* __fBodyAccJerk-std()-X__ -- Mean of fBodyAccJerk-std()-X for all observations of the activity conducted by the indicated subject.
* __fBodyAccJerk-std()-Y__ -- Mean of fBodyAccJerk-std()-Y for all observations of the activity conducted by the indicated subject.
* __fBodyAccJerk-std()-Z__ -- Mean of fBodyAccJerk-std()-Z for all observations of the activity conducted by the indicated subject.
* __fBodyGyro-std()-X__ -- Mean of fBodyGyro-std()-X for all observations of the activity conducted by the indicated subject.
* __fBodyGyro-std()-Y__ -- Mean of fBodyGyro-std()-Y for all observations of the activity conducted by the indicated subject.
* __fBodyGyro-std()-Z__ -- Mean of fBodyGyro-std()-Z for all observations of the activity conducted by the indicated subject.
* __fBodyAccMag-std()__ -- Mean of fBodyAccMag-std() for all observations of the activity conducted by the indicated subject.
* __fBodyBodyAccJerkMag-std()__ -- Mean of fBodyBodyAccJerkMag-std() for all observations of the activity conducted by the indicated subject.
* __fBodyBodyGyroMag-std()__ -- Mean of fBodyBodyGyroMag-std() for all observations of the activity conducted by the indicated subject.
* __fBodyBodyGyroJerkMag-std()__ -- Mean of fBodyBodyGyroJerkMag-std() for all observations of the activity conducted by the indicated subject.
