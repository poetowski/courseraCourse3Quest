Coursera Getting and Cleaning Data course project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

This repository contains the following files:

README.md, this file, which provides an overview of the data set and how it was created.
tidy_data.txt, which contains the data set.
CodeBook.md, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data).
run_analysis.R, the R script that was used to create the data set (see the Creating the data set section below)
Study design

The source data set that this project was based on was obtained from the Human Activity Recognition Using Smartphones Data Set, which describes how the data was initially collected as follows:

Data set was randomly partitioned into test and train subsets.
Training and test data were first merged together to create one data set, then the measurements on the mean and standard deviation were extracted for each measurement (79 variables extracted from the original 561), and then the measurements were averaged for each subject and activity, resulting in the final data set.

Creating the data set

The R script run_analysis.R do the following:

- download and unzip data
- there is a string pool which is not required by the logic, but I think it is good practise
- extraction of features and activities
- creating train and test datasets and merging into preprocessing tidy
- getting mean and std
- labelling each column by descriptive name
- finalizing tidy submitted to this course

DONE
