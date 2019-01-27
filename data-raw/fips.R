
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
  arrange(fips) -> fips

fips %>% filter(fips <= 56) %>% print() -> state
state %>% filter(!fips %in% c("02", "15")) %>% print() -> lower48

devtools::use_data(state, fips, lower48, overwrite = TRUE)

# FIPS codes for US counties ----------------------------------------------

url_cty = "http://www2.census.gov/geo/docs/reference/codes/files/national_county.txt"
fil_cty = "data-raw/county.txt"
if (!file.exists(fil_cty)) download.file(url_cty, fil_cty)

readr::read_csv(fil_cty, col_names = FALSE) %>%
  tidyr::unite(X23, X2, X3, sep = "") %>%
  select(usps  = X1, fips   = X23, county = X4) -> county

fips %>%
  select(usps, state) %>%
  right_join(county, by = "usps") -> county

devtools::use_data(county, overwrite = TRUE)

# Other Special Short Names
# county %>% filter(!stringr::str_detect(county, "County|Borough|City and Borough|Census Area|Municipality|Municipio|Parish|city|City"))
