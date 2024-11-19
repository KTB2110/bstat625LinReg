test_that("rmse calculates correctly for simple inputs", {
  # Simple example
  actual <- c(3, -0.5, 2, 7)
  predicted <- c(2.5, 0.0, 2, 8)
  my_rmse <- rmse(actual, predicted)

  expected_rmse <- sqrt(mean((actual - predicted)^2))

  expect_equal(my_rmse, expected_rmse, tolerance = 1e-8)
})

test_that("rmse handles real-world regression predictions", {
  data(mtcars)
  my_model <- linear_regression_fit(mpg ~ wt + hp, mtcars)
  my_predictions <- linear_regression_predict(my_model, mtcars)

  my_rmse <- rmse(mtcars$mpg, my_predictions)

  base_rmse <- sqrt(mean((mtcars$mpg - my_predictions)^2))

  expect_equal(my_rmse, base_rmse, tolerance = 1e-8)
})

test_that("rmse throws an error for mismatched lengths", {
  # Inputs with different lengths
  actual <- c(1, 2, 3)
  predicted <- c(1, 2)

  # Test that an error is thrown
  expect_error(rmse(actual, predicted), "Actual and predicted values must have the same length.")
})
