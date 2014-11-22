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
 - Cleaning Data
 - Preparing Tidy Data
   - Merge, extract columns, match rows and replace with strings, combine columns and melt + cast

Details please see the source code comments. I have made extensive comments to what I did and why I did it.

Another note regarding the data transformation: all variables that are used in-between steps during the data processing is named and commented. If you would like to inspect the variables in the browser, simply copy the entire code without out-most bracket and paste them into interactive console.

### Execution of the script

The script is defined as a function accepting no arguments. The script has a download mechanism: if you did not manually put the zip data in the working directory (repo root directory), the script will start to download the zip data itself and unpack into the root directory.

To Execute the script, Run
```
source("run_analysis.R")
run()
```

It will both create a txt file containing the tidy data, as well as return the tidy data itself.


## The Tidy Data

Please see the [CodeBook](CodeBook.md)
