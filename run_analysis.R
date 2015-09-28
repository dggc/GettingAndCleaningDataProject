library(dplyr)

dataset_folder = 'UCI HAR Dataset/'

read_dataset_type = function(dataset_type) {
  ## Reads the UCI dataset from a given folder.
  ## Returns a matrix with all the features,
  ## followed by the corresponding subject and activity
  ## Params:
  ## - dataset_type: train or test, dependending on the dataset being read
  
  
  X = read.table(paste(dataset_folder,
                       dataset_type, '/X_',
                       dataset_type,'.txt', sep=''), sep='')
  y = read.table(paste(dataset_folder,
                       dataset_type, '/y_',
                       dataset_type,'.txt', sep=''), sep='')
  subject = read.table(paste(dataset_folder,
                       dataset_type, '/subject_',
                       dataset_type,'.txt', sep=''), sep='')
  
  cbind(X, subject, y)
}

read_dataset = function() {
  ## Reads the whole UCI dataset
  
  dataset_train = read_dataset_type('train')
  dataset_test = read_dataset_type('test')
  dataset = rbind(dataset_train, dataset_test)
  
  # Correcting the names of the features
  feature_names = read.table(paste(dataset_folder, '/features.txt', sep=''))[2]
  names(dataset) = feature_names[[1]]
  names(dataset)[length(names(dataset))-1] = 'subject'
  names(dataset)[length(names(dataset))] = 'activity'
  
  # Selecting only the relevant columns: mean and standard deviation of each measurement,
  # the subject and the observed activity
  dataset_projection = dataset[, grepl('mean\\(\\)', names(dataset)) | 
                                 grepl('std\\(\\)', names(dataset)) | 
                                 names(dataset) == 'subject' | 
                                 names(dataset) == 'activity']
  
  dataset_projection
}

dataset = read_dataset()
write.table(dataset, 'tidy_dataset.txt', row.name=FALSE)