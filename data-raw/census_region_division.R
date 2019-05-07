
library(tidyverse)

url = "https://www2.census.gov/programs-surveys/popest/geographies/2015/state-geocodes-v2015.xls"
fil = "data-raw/census_region_division.xls"

if (!file.exists(fil)) download.file(url, fil)

readxl::read_excel(fil, skip = 4) %>%
    select(fips = `State (FIPS)`,
           region_cd = Region,
           division_cd = Division,
           name = Name) %>%
    print() -> raw

raw %>%
    filter(fips == "00") %>%
    filter(division_cd == "0") %>%
    select(region_cd, region_name = name) %>%
    mutate(region_name = word(region_name, 1)) %>%
    print() -> region

raw %>%
    filter(fips == "00") %>%
    filter(division_cd != "0") %>%
    select(division_cd, division_name = name) %>%
    mutate(division_name = str_remove(division_name, " Division")) %>%
    print() -> division

fips::state %>%
    left_join(raw) %>%
    select(-name) %>%
    left_join(region) %>%
    left_join(division) %>%
    select(fips, usps, state, region_cd, region_name, everything()) %>%
    print() -> census_region_division

usethis::use_data(census_region_division, overwrite = TRUE)
