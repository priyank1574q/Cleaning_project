# Getting and Cleaning Data

Here are the data for the project:

[Raw dataset link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The raw data was downloaded and was stored in the working directory of RStudio. You can also store the raw data in different location but then you'll have to change the working directory with 
```{r}
setwd()
```


## Details-
1. `run_analysis.R`, the R script that was used to create the dataset. (The method of creation is mentioned in the next section)
2. `README.md`, this file provides an overview of the data set and how it was created.
3. `Instructions.md`, it contains the instructions given on how to make the dataset. [Coursera Project Link](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)
4. `CodeBook.md`, the code book describes the contents of the data set (data, variables and transformations used to generate the data).
5. `tidy2.txt`, the final tidy dataset.

## Creating the tidy dataset.
1. The data files `activity_label.txt`, `features.txt`, `X_train.txt`, `y_train.txt`, `subject_train.txt`, `X_test.txt`, `y_test.txt` and `subject_test.txt` were loaded into the RStudio's working environment.
2. A new variables `y_train_new` and `y_test_test` is made which has the label assigned instead of its numerical factor, i.e. 1 is assigned `WALKING` etc.
3. The column names of the table `X_train` and `X_test` were assigned the names which were provided in `features.txt` file.
4. The required columns of the `X_train` and `X_test` are selected and are assigned to new variable `dataset1` and `dataset2` respectively.
5. A new variable `data1` is made by combining `subject_train`, `y_train_new` and `dataset1` column wise. The same was done with with the test data.
6. A new variable `tidy1` is made by combining `data1` and `data2` row wise and this final complete dataset.
7. A new variable `tidy2` is made which contains the average of datas of activity perfomed by each individual.

##Versions
1. `RStudio` Version - R version 3.4.4 (2018-03-15), Platform: x86_64-w64-mingw32/x64 (64-bit)
2. `dplyr` package version - 0.7.5 
3. `reshape2` package version - 1.4.3
