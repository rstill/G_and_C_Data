
# How the Script Works
Per the course instructions, this script, from the test and train data sets, creates a 
single, tidy data set, containing the avearge of each extracted variable for each activity 
and each subject. It accomplished this bby doing the following. 
 1. The dataset is downloaded and unzipped by the function download_data(). Directories are
	 created as needed.
 2. The feature names and activity labels are read from the code book files via the function 
	 read_labels().
 3. The train and test dataset files are loaded and merged into a single data table via the
	 function merge_data(). 
 4. For those columns containing mean() or std(), the resulting data table is summarised by mean, 
 	and activity labels are applied via the function tidy_data().
 5. The code book for the resulting data set is generated via fht function generate_code_book().
 6. This resulting data set and code book is then written to a file by the function output_data().
