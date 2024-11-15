% Load the dataset
data = readtable('D:\Matlab Project\Project 1\iphone_price.csv');

% Extract the variables
X = data.version;
y = data.price;

% Fit a linear regression model
model = fitlm(X, y);

% Predict the price for iPhone newModel 
newModel = input('Enter a model: ');
predictedPrice = predict(model, newModel);

% Display the predicted price
fprintf('The predicted price for iPhone model %d is: %.2f $\n', newModel,predictedPrice);

% Calculate the price differences
priceDifferences = diff(y);

% Calculate percentage change in prices
percentageChange = priceDifferences ./ y(1:end-1) * 100;

% Plot all charts in one figure
figure;

% Plot the data and the regression line
subplot(3,1,1);
hold on;
scatter(X, y, 'b', 'filled'); % Scatter plot of the data
plot(X, predict(model, X), 'r-'); % Regression line
plot(newModel, predictedPrice, 'go', 'MarkerSize', 10, 'LineWidth', 2); 
xlabel('iPhone Model');
ylabel('Price ($)');
title('iPhone Price Prediction');
legend('Actual Prices', 'Linear Fit', 'Predicted Price for iPhone', 'Location', 'NorthWest');
hold off;

% Create increase/decrease bar chart
subplot(3,1,2);
bar(X(2:end), priceDifferences);
xlabel('iPhone Model');
ylabel('Price Difference ($)');
title('Price Difference between iPhone Models');
grid on;

% Plot percentage change
subplot(3,1,3);
bar(X(2:end), percentageChange);
xlabel('iPhone Model');
ylabel('Price Change Percentage (%)');
title('Percentage Change in iPhone Prices');
grid on;
