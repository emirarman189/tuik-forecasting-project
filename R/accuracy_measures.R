# Accuracy Measures Script
# Computes forecast accuracy metrics

calc_accuracy <- function(actual, forecast, method_name) {
  e    <- actual - forecast
  bias <- mean(e)
  mad  <- mean(abs(e))
  mse  <- mean(e^2)
  mape <- mean(abs(e / actual)) * 100
  rsfe <- sum(e)
  ts_  <- rsfe / mad
  data.frame(Method=method_name,
             Bias=round(bias,2), MAD=round(mad,2),
             MSE=round(mse,2),  MAPE=round(mape,4),
             RSFE=round(rsfe,2), Tracking_Signal=round(ts_,4),
             stringsAsFactors=FALSE)
}

