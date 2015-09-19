Data 
=====

An analysis of accelerometer data generated from an experiment with mobile phones. The full description and the raw data can be found
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Contents

This repository contains four files:

  - `run_anlaysis.R`: the R script to process raw data to tidy data
  - `tidy.txt`: the ouput (tidy data) generated from the R script
  - `CodeBook.md`: the doc that describes the variables, the data, and any transformations or work performed to clean up the data
  - `README.md`: this file itself

### Getting started

This program assumes that the following data/code directory structure:

  - [experiment data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is downloaded and unzipped into `{commonDir}/UCI HAR Dataset` 
  - This project is set as working directory, which can be done as `setwd("{commonDir/GettingCleaningDataProj}")`. 
  
With data and program in correct directories, users can simply run the `run_analysis.R` script.


