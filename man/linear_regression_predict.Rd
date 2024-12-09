% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/linear_reg.R
\name{linear_regression_predict}
\alias{linear_regression_predict}
\title{Predicting using a Linear Regression Model}
\usage{
linear_regression_predict(model, newdata)
}
\arguments{
\item{model}{The fitted model returned by `linear_regression_fit`.}

\item{newdata}{A data frame containing new data for prediction.}
}
\value{
A vector of predicted values.
}
\description{
This function predicts outcomes based on a fitted linear regression model.
}
\examples{
data(mtcars)
model <- linear_regression_fit(mpg ~ wt, mtcars)
predictions <- linear_regression_predict(model, newdata = mtcars)
}
