
library(tidyverse)

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

usethis::use_data(state, fips, lower48, overwrite = TRUE)

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

usethis::use_data(county, overwrite = TRUE)

# Other Special Short Names
# county %>% filter(!stringr::str_detect(county, "County|Borough|City and Borough|Census Area|Municipality|Municipio|Parish|city|City"))

# Identified Counties in IPUMS USA ----------------------------------------

url = "https://usa.ipums.org/usa/resources/volii/ipums_usa_identified_counties.xlsx"
fil = "data-raw/ipums_usa_identified_counties.xlsx"
if (!file.exists(fil)) download.file(url, fil)

# Make column name great again (Modified Version)
# Ref: https://github.com/hrbrmstr/docxtractr/blob/master/R/mcga.r
mcga <- function(tbl) {

    x <- colnames(tbl)
    x <- tolower(x)
    x <- gsub("_+", "_", x)
    x <- gsub("(^_|_$)", "", x)
    x <- make.unique(x, sep = "_")

    colnames(tbl) <- x
    tbl
}

readxl::read_xlsx(fil, skip = 1) %>%
    rename(`State` = X__1,
           `County_Name` = X__2,
           `NOTE` = X__3) %>%
    mcga() %>%
    mutate(countyfip = paste0(statefip, countyfip)) %>%
    print() -> county_ipums_usa

usethis::use_data(county_ipums_usa, overwrite = TRUE)
