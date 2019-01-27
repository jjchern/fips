
library(tidyverse)

xml2::read_html("https://www.bea.gov/regional/docs/regions.cfm") %>%
    rvest::html_nodes(".table-striped") %>%
    rvest::html_table() %>%
    pluck(1) %>%
    as_tibble() %>%
    print() -> df

df %>%
    docxtractr::mcga() %>%
    group_by(region_code) %>%
    slice(1) %>%
    select(region_code,
           region_name = state_or_region_name,
           region_abbr = abbreviation) %>%
    mutate(short_region_name = str_replace(region_name, " Region", "")) %>%
    mutate(short_region_name = str_replace(short_region_name, "Rocky ", "")) %>%
    ungroup() %>%
    print() -> region

df %>%
    select(usps = Abbreviation, region_code = `Region code`) %>%
    left_join(fips::state) %>%
    anti_join(region, by = c("usps"        = "region_abbr")) %>%
    left_join(region, by = c("region_code" = "region_code")) %>%
    select(fips, usps, state, short_region_name, everything()) %>%
    print() -> bea_region

usethis::use_data(bea_region, overwrite = TRUE)
