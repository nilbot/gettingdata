# Getting and Cleaning Data Course Project


## Introduction

This is the repo of course project for the "Getting and Cleaning Data". In this README you will find informations to the project, the script that I wrote to produce the tidy data from the raw dataset, and additional information regarding the produced dataset as a Codebook.

## Project (*The Question*)

 The goal is to prepare tidy data that can be used for later analysis.

### About the source of the data

 One of the most exciting areas in all of data science right now is wearable computing - see for example this [article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

### Obtaining the data

 - [Description to the data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
 - [Zipped Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) (approx 62MB)

## Script

The script that I wrote to produce the tidy data that we need has the following major steps: 
 - Getting Data
   - In this step I would use the link provided in the previous section to download the data into the working directory. And then I would extract it

   - Further, I would read the data from those data files into R environment. 

 - Cleaning Data
   - First I would merge the test and training sets first

   - Further, I would extract a subset of the data to reflect only the measurements on the mean and std (standard deviation)

   - I would name the subset with activity names
 - Preparing Tidy Data
   - 

### Execution of the script

The script is defined as a function accepting no arguments (**TODO** in future I might add ability for user to switch *on* and *off* the download mechanism, should the data is manually downloaded before hand.) To Execute the script, Run
```
source("run_analysis.R")
run()
```
## The Tidy Data

Please see the [CodeBook](CodeBook.md)
