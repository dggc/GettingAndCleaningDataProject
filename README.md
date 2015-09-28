## Getting and Cleaning Data Course Project
The run_analysis.R script reads both the train and test data and rbinds
their rows together. Then, it names its columns according to the
features.txt file, using 'subject' and 'activity' as extra column names
for the subjects and activity labels, respectively, that were on
    different files, and were not described in the features.txt file.

Then, it selects only the columns with mean of std of a given variable,
and saves the tidied dataset to tidy_dataset.txt

## IMPORTANT
Due to a submission problem, I could not upload the tidy_dataset on
time. Therefore, I added it to the repository, under the name of
tidy_dataset.txt.
