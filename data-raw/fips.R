library(dplyr, warn.conflicts = FALSE)

# FIPS codes for US states -------------------------------------------------

url = "http://www2.census.gov/geo/docs/reference/state.txt"
fil = "data-raw/fips.txt"
if (!file.exists(fil)) download.file(url, fil, quiet = TRUE)

readr::read_delim(fil, delim = "|") %>%
  select(
    fips = STATE,
    usps = STUSAB,
    state = STATE_NAME
  ) %>%
  filter(fips <= 56) %>%
  arrange(fips) -> state -> fips

devtools::use_data(state, fips)
