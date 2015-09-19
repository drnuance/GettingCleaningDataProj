# *Cleaning and Getting Data* course project code book

### Analysis process

The cleaning script `run_analysis.R` reads in raw experiment data and cleans it into the summary form tidy data.

 1 Both train and test datasets are read. They will be merged into a unified single table.
 2 Columns representding mean or standard deviation are identified, then extracted.
 3 Column names are given by reading the `features.txt`. 
 4 Activity labels are replaced by table joining.
 5 Summarize data is completed via group_by. Then it is saved into `tidy.csv` file.

More details can be found in comments in `run_analysis.R`. 

### Columns in output file

The columns included in the output file are listed below:

  - subject_id - The id of the experiment participant.
  - activity_labels - The name of the activity that the measurements correspond to, like `LAYING` or `WALKING`.

All the rest fields represent the mean of recorded data points for the given subject and activity, which is idential to the raw data cook book. The detailed description of the different measurement types can be found in the `features_info.txt` file.

### More information

The full description and the data can be found
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
