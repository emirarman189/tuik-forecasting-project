# Forecasting Methods Script
# Applies all required forecasting methods to the TÜİK visitor series

library(forecast)

# Naive Forecasting
naive_fit  <- naive(ts_visitors, h = 1)
naive_next <- as.numeric(naive_fit$mean[1])

# Moving Average (k=12)
ma_window  <- 12
ma_fitted  <- as.numeric(stats::filter(ts_eval, rep(1/ma_window, ma_window), sides=1))
ma_next    <- mean(tail(as.numeric(ts_visitors), 12))

# Weighted Moving Average (k=12)
wma_weights <- (1:12) / sum(1:12)
wma_next    <- sum(wma_weights * tail(as.numeric(ts_visitors), 12))

# Exponential Smoothing
es_fit  <- ses(ts_visitors, h = 1)
es_next <- as.numeric(es_fit$mean[1])

# Holt Trend-Adjusted ES
holt_fit  <- holt(ts_visitors, h = 1)
holt_next <- as.numeric(holt_fit$mean[1])

# Linear Trend Projection
t_index <- 1:length(ts_visitors)
lm_fit  <- lm(as.numeric(ts_visitors) ~ t_index)
lm_next <- predict(lm_fit, newdata=data.frame(t_index=length(ts_visitors)+1))

# Regression with Trend and Seasonal Dummies
reg_df  <- data.frame(visitors=as.numeric(ts_visitors),
                      t=1:length(ts_visitors),
                      month=factor(cycle(ts_visitors)))
reg_fit  <- lm(visitors ~ t + month, data=reg_df)
reg_next <- predict(reg_fit, newdata=data.frame(t=length(ts_visitors)+1,
                                                 month=factor(4, levels=1:12)))

