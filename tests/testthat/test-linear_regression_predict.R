test_that("linear_regression_predict produces correct predictions", {
  data(mtcars)
  my_model <- linear_regression_fit(mpg ~ wt + hp, mtcars)
  my_predictions <- linear_regression_predict(my_model, mtcars)
  base_model <- lm(mpg ~ wt + hp, data = mtcars)
  base_predictions <- predict(base_model, newdata = mtcars)
  expect_equal(my_predictions, base_predictions, tolerance = 1e-8)
})

test_that("linear_regression_predict handles missing terms attribute", {
  # Create a dummy model without the 'terms' attribute
  dummy_model <- list(coefficients = c(1, 2, 3))

  # Attempt prediction and expect an error
  expect_error(
    linear_regression_predict(dummy_model, mtcars),
    "The model does not contain terms information."
  )
})
