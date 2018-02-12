# Simple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

regressor = lm(formula = Salary ~ YearsExperience, 
               data = training_set)

y_pred = predict(regressor, newdata = test_set)

library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), 
  colour = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), colour = 'purple')
  ggtitle('Salary vs experience(Training Set)') +
    xlab('years of experience') + 
    ylab('Salary')
  
ggplot() + 
    geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), 
               colour = 'blue') + 
    geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), colour = 'grey')
  ggtitle('Salary vs experience(Test Set)') +
    xlab('years of experience') + 
    ylab('Salary')