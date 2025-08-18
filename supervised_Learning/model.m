% Load the dataset
df = readtable('churn.csv');

% Remove the CustomerID column
df = removevars(df, 'CustomerID');