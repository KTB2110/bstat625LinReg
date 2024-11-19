test_that("linear_regression_fit computes coefficients correctly", {
  data(mtcars)
  my_model <- linear_regression_fit(mpg ~ wt + hp, mtcars)
  base_model <- lm(mpg ~ wt + hp, data = mtcars)
  expect_equal(my_model$coefficients, coef(base_model), tolerance = 1e-8)
})

test_that("linear_regression_fit computes R-squared correctly", {
  data(mtcars)
  my_model <- linear_regression_fit(mpg ~ wt + hp, mtcars)
  base_model <- lm(mpg ~ wt + hp, data = mtcars)
  base_r_squared <- summary(base_model)$r.squared
  expect_equal(my_model$r_squared, base_r_squared, tolerance = 1e-8)
})
