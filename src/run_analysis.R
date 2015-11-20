############################################################################################
# DIRECTIONS FOR THE COURSE PROJECT.
# 
# Here are the data for the project: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
#
# Good luck!
############################################################################################

# Load relevant libraries
library(data.table)
library(dplyr)

# Url of the dataset 
DATA_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Directory to which the dataset should be downloaded. 
# Change this variable to move the downloaded data set 
# to another location.
DATA_DIR <- "../data"

# Name of the file to which the downloaded data should be saved
DEST_FILE <- "data.zip"

# Subdirectory contsaining the resulting unzipped data set
DATA_SET_DIR <- "UCI\ HAR\ Dataset"

# Subdirectory containing unzipped test data set
TEST_DIR <- "test"

# Subdirectory containing unzipped train data set
TRAIN_DIR <- "train"

# Files containing the training data
TRAIN_DATA <- c("y_train.txt", "subject_train.txt", "X_train.txt")

# Files containing the test data
TEST_DATA <- c("y_test.txt", "subject_test.txt", "X_test.txt")

# File contaiing the features reference
FEATURES <- "features.txt"

# File containing the activity labels
LABELS <- "activity_labels.txt"

# Name of code book file
CODE_BOOK_FILE <- "code_book.md"

# Directory where the tidy dataset should be output.
# Change this variable to move resulting tidy data set 
# and code book to another location.
OUTPUT_DIR <- "."

 # Tidy data output file name
OUTPUT_FILE <- "tidy.txt"

###################################################################
# FUNCTION:
# 	download_data
# PURPOSE:
#	Downloads and unzips the dataset.
# INPUTS:
#	url - The url of the dataset.
#	dir - The directory where the dataset should be stored.
#	file - Optional destination file name of the compressed file.
# OUTPUTS:
# 	Path to the directory where the data is stored.  
###################################################################
download_data <- function (url, dir, file=DEST_FILE) {
	# Check to determine if the data directory exosts.
	# If not, then create it.
	if (!file.exists(dir)) { 
		dir.create(dir)
		# Check to determine of the dataset has already exists.
		# If not, download and unzip it.
		dest_path <- file.path(dir, file)
		if (!file.exists(dest_path)) {
			print(dest_path)
			download.file(url, dest_path)
			unzip(dest_path, exdir=dir)
		}
	}
	# Return the path to the data directory so
	# that the return value can be used as input
	# to other functions for further processing. 
	file.path(dir, DATA_SET_DIR)
}

###################################################################
# FUNCTION:
# 	read_labels
# PURPOSE:
#	Reads the features from the features.txt file features that 
#	match the supplied regular expression, and the activity labels
#   from the activity_labels.txt file. 
# INPUTS:
#	path - Path to the directory containing code book related
#          files.  
# OUTPUTS:
# 	The list of features and labes to be used when generating the 
#   tidy data set.
###################################################################
read_labels <- function(path) {
	# Read the features from the features.txt file
	features <- read.table(file.path(path, FEATURES), col.names = c("value", "name"))

	# Read the labels from the activity_labels.txt file
    labels <- read.table(file.path(path, LABELS), col.name = c("value", "name"))

    # Return the featurs and the labels as a list
	list(features=as.character(features$name), activities=as.character(labels$name))
}

###################################################################
# FUNCTION:
# 	merge_data
# PURPOSE:
#	Reads the test and train data sets and merges the data into
#   a single data table.  
# INPUTS:
#	path - Path to the directory containing the test and train data
#		   sets. 
#	features - The names of each of the features contained in the 
#	           feature vectors. These are read from the code book
#			   by read_labels.
# OUTPUTS:
# 	A single data table containing all data from both the test and 
#	train data set. The returned data table has all columns 
#	appropriately labeled. 
###################################################################
merge_data <- function (path, features) {
	# Merge the files containing the training data into a single data frame.
	raw_data <- lapply(TRAIN_DATA, function (file_name) { read.table(file.path(path, TRAIN_DIR, file_name)) })
	train_data <- data.table(raw_data[[1]], raw_data[[2]], raw_data[[3]])
	colnames(train_data) <- c("activity", "subject", features)
	
	# Merge the files containing the train data into a single data frame
	raw_data <- lapply(TEST_DATA, function (file_name) { read.table(file.path(path, TEST_DIR, file_name)) })
	test_data <- data.table(raw_data[[1]], raw_data[[2]], raw_data[[3]])
	colnames(test_data) <- c("activity", "subject", features)
	
	# Merge the these data frames into a single data frame containing all data from both sets.
	merged_data <- bind_rows(train_data, test_data)
}

###################################################################
# FUNCTION:
# 	extract_data
# PURPOSE:
#	Extracts those columns from the the combined data set the
#	are related to either mean() or std().
# INPUTS:
#	data - Data table from with the columns should be extracted.
#		   It is assumed that this data table is the one returned 
#		   by a call to merge_data() and therefore contains all 
#		   test and train data as wll as having all columns  
#		   appropriately labeled.
#	features - The names of each of the features contained in the 
#	           feature vectors. These are read from the code book
#			   by read_labels.
# OUTPUTS:
# 	A single data table containing the activities, the subjects, 
#	and only those features columns related to mean() or std(). 
###################################################################
extract_data <- function (data, features) {
	# Determine those features that are related to mean() or std()
	indices <- sort(c(grep("-mean()", features, fixed=TRUE), grep("-std()", features, fixed=TRUE)))	

	# Extract those features, along with the activity and subject
	data[,c("activity", "subject", features[indices])]
}

###################################################################
# FUNCTION:
# 	tidy_data
# PURPOSE:
#	Labels activities with a readable name, groups the data by 
#   activity and subject, and summarises each of the features 
#   by mean. 
# INPUTS:
#	data - Data table to be tidyed. It is assumed that this data 
#		   is returned by a call to extract_data().
#	features - The names of each of the features contained in the 
#	           feature vectors. These are read from the code book
#			   by read_labels.
# OUTPUTS:
# 	A single data table containing the activities, the subjects, 
#	and only those features columns related to mean() or std(). 
###################################################################
tidy_data <- function(data, labels) {
	# Provide readable activity labels
	for (i in seq_along(labels)) { data$activity[data$activity==i] <- labels[i] }

	# Compute the column means, grouped by activity and subject
	group_by(data, activity, subject) %>% summarise_each(funs(mean))
}

###################################################################
# FUNCTION:
# 	generate_code_book
# PURPOSE:
#	Generates the code book for the tidy data set 
# INPUTS:
#	features - Featue name to be included in the code book.
# OUTPUTS:
# 	A data table containing the variable name and descriptions. 
###################################################################
generate_code_book <- function(features) {
	code_book <- c("## Code book for the data derived from the UCI HAR Dataset",
				   "### Each observation consists of the activity measured, the subject conducting the activity measuredm as well as the means of all measurements involving either mean or standard deviation.",
				   "### The columns for each observation are as follows.",
			   	   "* __activity__: The activity being conducted when the observation was made.\n", 
			       "* __subject__: The subject conducting the activity when the observation was made.\n")
	indices <- sort(c(grep("-mean()", features, fixed=TRUE), grep("-std()", features, fixed=TRUE)))
	codes <- sapply(features[indices], function(feature) { sprintf("* __%s__: Mean of %s for all observations of the activity conducted by the indicated subject.", feature, feature) })
	code_book <- c(code_book, codes)

}

###################################################################
# FUNCTION:
# 	output_data
# PURPOSE:
#	Writes the tidy data set to a file. 
# INPUTS:
#	dir - Directory to which the data set should be written.
#	name - Name of the file to be written.
#	data - The data to be written.
# OUTPUTS:
# 	The full path to the file containing the data.
###################################################################
output_data <- function(dir, data_name, data, code_name, code_book) {
	# Create the output directory if it does not exist
	if (!file.exists(dir)) {
		dir.create(dir)
	}

	# Initialize the data file name
	data_path <- file.path(dir, data_name)

	# Write the data set to the file
	write.table(data, data_path, row.name=FALSE)

	# Initialize the codd book file name
	code_path <- file.path(dir, code_name)

	# Write the code cook to the file
	writeLines(code_book, code_path)

	# Return the path to the file
	data_path
}

###################################################################
# FUNCTION:
# 	run_analysis
# PURPOSE:
#	Downloads the data set, creates a tidy data set, and writes
# 	the resulting tidy data set to a file.  
# INPUTS:
#	None
# OUTPUTS:
# 	Path to the file containing the tidy data set.
###################################################################
run_analysis <- function () {
	# Download the dataset if necessary.
	path <- download_data(DATA_URL, DATA_DIR)

	# Read the feature labels and the activity labels 
	labels <- read_labels(path)

	# Merge the test and train data sets
	merged_data <- merge_data(path, labels$features)

	# Extract the column related to mean() and std()
	extracted_data <- extract_data(merged_data, labels$features)

	# Tidy the data by computing means, assigning column names, 
	# and labeling activities with meaningful labels.
	tidyed_data <- tidy_data(extracted_data, labels$activities)

	# Generate the code book for the tidy data set
	code_book <- generate_code_book(labels$features)

	# Write the resulting data set to a file
	output_path <- output_data(OUTPUT_DIR, OUTPUT_FILE, tidyed_data, CODE_BOOK_FILE, code_book)
}



