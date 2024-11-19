data(mtcars)

# Fit the model
model <- linear_regression_fit(mpg ~ wt + hp, mtcars)

# Print model details
print("Coefficients:")
print(model$coefficients)

print("R-squared:")
print(model$r_squared)

# Predict using the model
predictions <- linear_regression_predict(model, newdata = mtcars)

# Compare predictions to actual values
print("Predictions (first 6):")
print(head(predictions))

print("Actual values (first 6):")
print(head(mtcars$mpg))

error <- rmse(mtcars$mpg, predictions)
print(paste("RMSE:", error))
