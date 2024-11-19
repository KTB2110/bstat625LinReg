### Homework 3 - BIOSTAT 625

<!-- badges: start -->
[![R-CMD-check](https://github.com/KTB2110/bstat625LinReg/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/KTB2110/bstat625LinReg/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/KTB2110/bstat625LinReg/graph/badge.svg)](https://app.codecov.io/gh/KTB2110/bstat625LinReg)
<!-- badges: end -->

# Package name: biost625linreg

## Goal of the project
`biost625linreg` was created for the BIOSTAT625 course. I have tried to code the Linear Regression module from scratch to better understand what is happening in the background mathematically. In this way, I was able to make the functions slightly faster than the `lm` module from the `stat` package.

## Installation and Loading
To install the package from GitHub, use:

```{r}
# Install devtools if you don't have it
install.packages("devtools")

# Install biost625linreg from GitHub
devtools::install_github("KTB2110/bstat625LinReg")
```

Then, load the package using:

```{r}
library(biost625linreg)
```

## Functions Included

The package includes the following core functions:

`linear_regression_fit(formula, data)`
Fits a linear regression model using least squares.
Returns coefficients, residuals, fitted values, R-squared, and standard errors.

`linear_regression_predict(model, newdata)`
Predicts outcomes based on a fitted linear regression model.

`rmse(actual, predicted)`
Calculates the Root Mean Squared Error (RMSE) between actual and predicted values.

## Example Use Cases
Here’s how you can use the package:

```{r}
# Load the data
data(mtcars)

# Fit a linear regression model
model <- linear_regression_fit(mpg ~ wt + hp, mtcars)

# View coefficients
print(model$coefficients)

# Predict values
predictions <- linear_regression_predict(model, newdata = mtcars)
print(predictions)

# Calculate RMSE
error <- rmse(mtcars$mpg, predictions)
print(error)
```

## Getting Help
If you need help with any function, use R’s built-in documentation:

```{r}
?linear_regression_fit
?linear_regression_predict
?rmse
```
