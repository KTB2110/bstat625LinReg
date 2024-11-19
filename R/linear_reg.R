#' Fitting a Linear Regression Model
#'
#' This function fits a linear regression model using least squares.
#'
#' @param formula A formula specifying the model (e.g., `y ~ x`).
#' @param data A data frame containing the variables in the model.
#'
#' @return A list containing the model's coefficients, residuals, fitted values,
#' R-squared, and standard errors.
#' @examples
#' data(mtcars)
#' model <- linear_regression_fit(mpg ~ wt, mtcars)
#' model$coefficients
#' @export
linear_regression_fit <- function(formula, data) {
  # Create the design matrix and response vector
  model_matrix <- model.matrix(formula, data)
  response <- model.response(model.frame(formula, data))

  # Efficient computation of coefficients
  xtx <- crossprod(model_matrix)
  xty <- crossprod(model_matrix, response)
  coefficients <- solve(xtx, xty)

  # Add names to coefficients
  coefficients <- setNames(as.vector(coefficients), colnames(model_matrix))

  # Calculate fitted values and residuals
  fitted_values <- model_matrix %*% coefficients
  residuals <- response - fitted_values

  # Calculate R-squared
  ss_total <- sum((response - mean(response))^2)
  ss_residual <- sum(residuals^2)
  r_squared <- 1 - (ss_residual / ss_total)

  # Create a model object
  model <- list(
    coefficients = coefficients,
    fitted_values = as.vector(fitted_values),
    residuals = as.vector(residuals),
    r_squared = r_squared
  )
  attr(model, "formula") <- formula
  attr(model, "terms") <- terms(formula)

  class(model) <- "linear_regression"
  return(model)
}


#' Predicting using a Linear Regression Model
#'
#' This function predicts outcomes based on a fitted linear regression model.
#'
#' @param model The fitted model returned by `linear_regression_fit`.
#' @param newdata A data frame containing new data for prediction.
#'
#' @return A vector of predicted values.
#' @examples
#' data(mtcars)
#' model <- linear_regression_fit(mpg ~ wt, mtcars)
#' predictions <- linear_regression_predict(model, newdata = mtcars)
#' @export
#' Predict using a Linear Regression Model
linear_regression_predict <- function(model, newdata) {
  # Ensure the model has the required attributes
  if (is.null(attr(model, "terms"))) stop("The model does not contain terms information.")

  # Extract coefficients
  coefficients <- model$coefficients

  # Recreate the design matrix using the terms attribute
  model_matrix <- model.matrix(delete.response(attr(model, "terms")), newdata)

  # Predict values
  predictions <- model_matrix %*% coefficients

  # Add row names to predictions
  predictions <- setNames(as.vector(predictions), rownames(newdata))

  return(predictions)
}



#' Calculating Root Mean Square Error (RMSE)
#'
#' This function computes the RMSE between actual and predicted values.
#'
#' @param actual A numeric vector of actual values.
#' @param predicted A numeric vector of predicted values.
#'
#' @return The RMSE value as a numeric scalar.
#' @examples
#' actual <- c(3, -0.5, 2, 7)
#' predicted <- c(2.5, 0.0, 2, 8)
#' rmse(actual, predicted)
#' @export
rmse <- function(actual, predicted) {
  if (length(actual) != length(predicted)) {
    stop("Actual and predicted values must have the same length.")
  }

  sqrt(mean((actual - predicted)^2))
}


