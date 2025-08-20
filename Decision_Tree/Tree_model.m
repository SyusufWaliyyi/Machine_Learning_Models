data = readtable('brest_cancer.csv'); % Load the breast cancer dataset
data.Properties.VariableNames = {'ID', 'Diagnosis', 'Radius', 'Texture', 'Perimeter', 'Area', 'Smoothness', 'Compactness', 'Concavity', 'ConcavePoints', 'Symmetry', 'FractalDimension', 'RadiusSE', 'TextureSE', 'PerimeterSE', 'AreaSE', 'SmoothnessSE', 'CompactnessSE', 'ConcavitySE', 'ConcavePointsSE', 'SymmetrySE', 'FractalDimensionSE', 'RadiusWorst', 'TextureWorst', 'PerimeterWorst', 'AreaWorst', 'SmoothnessWorst', 'CompactnessWorst', 'ConcavityWorst', 'ConcavePointsWorst', 'SymmetryWorst', 'FractalDimensionWorst'};

% Shape of the data
% Display the shape of the data
[numRows, numCols] = size(data);
fprintf('The dataset contains %d rows and %d columns.\n', numRows, numCols);

% scatter plot of Radius against ConcavePoints and separated by diagnosis
gscatter(data.Radius, data.ConcavePoints, data.Diagnosis, 'rb', '+', 8);
xlabel('Radius');
ylabel('Concave Points');
title('Scatter Plot of Radius vs Concave Points by Diagnosis');
legend('Malignant', 'Benign');

% Define input and target variable
% Input variables = data minus ID and Diagnosis
X = data{:, 3:end}; % Input variables excluding ID and Diagnosis
y = data.Diagnosis; % Target variable


% Convert target variable to binary numeric values
y_numeric = double(strcmp(y, 'M')); % 'M' for malignant, 'B' for benign

% Train a decision tree classifier
treeModel = fitctree(X, y_numeric);
disp(treeModel)

% Display the trained decision tree
view(treeModel, 'Mode', 'graph');

