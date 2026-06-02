# Data Import Script
# Accesses TÜİK Tourism data via tuikr and httr

library(tuikr)
library(httr)
library(readxl)

# Get table URL from tuikr
tables14 <- statistical_tables("14")
url_istab <- tables14$table_url[13]

# Download via httr
temp_file <- tempfile(fileext = ".xls")
response <- GET(url_istab,
                add_headers(
                  "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
                  "Accept"     = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                  "Referer"    = "https://veriportali.tuik.gov.tr/"
                ),
                write_disk(temp_file, overwrite = TRUE))

cat("HTTP Status:", status_code(response), "\n")
df_raw <- read_xls(temp_file)

