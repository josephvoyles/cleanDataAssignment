# README

## Overview
run_analysis.r is a script that merges test and training sensor data in the UCI HAR Data set to create a consolidate, tidy data set.

## Dependencies
* run_analysis.r uses relies on the plyr library to run. The script will load the library but it must be made available to your r environment. 
* run_analysis.r looks for data in tue UCI HAR Data set directory. This data set should be downloaded from [Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and placed in the same directory as your r script

## Script execution
To execute run_analysis.r:
1. open the file in r studio
2. Set the r studio working directory to the source file location
3. manually source the run_analysis.r or select source the active document from the toolbar
4. The script will produce a tab delimited data set
*Note: This script may produce warnings during execution. They can be ignored and script will still execte correctly*
