# TÜİK Forecasting Project

## 1. Project Overview
This project forecasts the monthly number of visitors departing from Turkey using data from the TÜİK Data Portal, accessed via the `tuikr` R package.

## 2. Data Source and TÜİK Connection
- TÜİK Data Set Name: Tourism expenditures, number of visitors and average expenditure per capita by months
- TÜİK Theme: Tourism (Theme ID: 14)
- TÜİK Table Name: Tourism expenditures, number of visitors and average expenditure per capita by months
- tuikr Dataflow ID: istab table accessed via statistical_tables("14")
- Selected Variable: Number of Visitors (Vatandaş Sayısı)
- Data Frequency: Monthly
- Time Coverage: January 2012 – March 2026
- Latest Available Observation: March 2026
- Forecast Target Period: April 2026
- Data Access Method: tuikr + httr::GET()
- Package Source: https://github.com/emraher/tuikr

## 3. Research Objective
This project forecasts the number of Turkish citizens departing abroad each month. Outbound tourism is a key indicator of consumer confidence and economic activity in Turkey.

## 4. Use of TÜİK Data in R
Data were accessed programmatically using the `tuikr` package to obtain the table URL, and `httr::GET()` to download the file. No manual data download or preparation was performed.

## 5. Exploratory Time Series Analysis
- Strong upward trend (2012-2019), sharp COVID-19 disruption in 2020, strong recovery from 2021
- Clear monthly seasonality (peaks in summer, troughs in winter)
- No missing values in the selected period

## 6. Forecasting Methods Applied
- Naive Forecasting
- Moving Average (k=12)
- Weighted Moving Average (k=12)
- Exponential Smoothing
- Trend-Adjusted Exponential Smoothing (Holt)
- Linear Trend Projection
- Seasonal Indices
- Additive Decomposition
- Multiplicative Decomposition
- Regression with Trend and Seasonal Dummy Variables

## 7. Forecast Accuracy Comparison
See outputs/tables/accuracy_comparison.csv for full results.

## 8. Selection of the Superior Method
Regression with Trend and Seasonal Dummy Variables was selected as the superior method because it explicitly captures both the long-run trend and monthly seasonality.

## 9. Final Next-Period Forecast
- Superior Method: Regression with Trend and Seasonal Dummy Variables
- Latest Available Observation: March 2026
- Forecast Target Period: April 2026
- See outputs/tables/final_forecast.csv for the forecasted value

## 10. Interpretation
April is a transitional month for Turkish outbound tourism. The forecast reflects the ongoing recovery trend and established seasonal pattern.

## 11. Limitations
- COVID-19 structural break in 2020
- No external variables (exchange rates, macroeconomic indicators)
- Linear trend assumption may not hold long-term

## 12. Reproducibility
1. Install R (>= 4.6)
2. Clone this repository
3. Run `renv::restore()` to restore packages
4. Open `forecasting_project.Rmd` and knit

## 13. Repository Structure
tuik-forecasting-project/
├── README.md
├── forecasting_project.Rmd
├── forecasting_project.html
├── outputs/
│   ├── tables/
│   │   ├── accuracy_comparison.csv
│   │   └── final_forecast.csv
│   └── figures/
├── R/
└── renv.lock

## 14. Author
- Student Name: Emir ARMAN
- Student Number: 138721522
- Course: Forecasting

