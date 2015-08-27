library(dplyr)

if (!file.exists("data-raw/fips.csv")) {
  download.file(url = "http://www2.census.gov/geo/docs/reference/state.txt",
                destfile = "data-raw/fips.txt",
                quiet = TRUE)
}

raw = read.table(file = "data-raw/fips.txt",
                 header = TRUE,
                 sep = "|",
                 stringsAsFactors = FALSE)

fips <- raw %>%
  tbl_df() %>%
  select(fips = STATE,
         usps = STUSAB,
         state = STATE_NAME) %>%
  filter(fips <= 56) %>%
  arrange(fips)

save(fips, file = "data/fips.rdata")
