# Project for "Getting and Cleaning Data"
This repository corresponds to a class project for course on [Getting and Cleaning Data](https://www.coursera.org/course/getdata). The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.The goal is to prepare tidy data that can be used for later analysis.

The data for the project is present at ["Human Activity Recognition Using Smartphones" data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

**Here are the steps that must be performed before running the R script:**

1. Download the zip file from [this URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file to be extracted as "UCI HAR Dataset" directory.
3. Set the Working directory in R to the location of "UCI HAR Dataset" directory by using setwd() command.

**After completing above steps, run the R script ([run_analysis.R](run_analysis.R)).** Note that it requires the [reshape2 package](http://cran.r-project.org/web/packages/reshape2/index.html), which can be downloaded from CRAN.

**The output of the R script is a tidy data set, [tidy.txt](https://s3.amazonaws.com/coursera-uploads/user-d9f077af70d9c2a8e23146ba/975117/asst-3/2e5f9f107a0211e598d6f189b9099096.txt).**

You can read more about the data and the analysis in the [code book](CodeBook.md).
