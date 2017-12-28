
library(tidyverse)
library(labelled)

url = "ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/OAE/urbanrural/nchsurcodes2013.sas7bdat"
fil = "data-raw/nchsurcodes2013.sas7bdat"
if (!file.exists(fil)) download.file(url, fil)

haven::read_sas(fil) %>%
    transmute(
        usps = ST_ABBREV,
        statefip = sprintf("%02s", stfips),
        fips = paste0(statefip, sprintf("%03s", ctyfips)),
        county = ctyname,
        code2013 = CODE2013, code2006 = CODE2006, code1990 = CODE1990,
        cbsatitle = cbsatitle, cbsapop = cbsapop, ctypop = ctypop
    ) %>%
    set_value_labels(code2013 = c(
        "Large central metro" = 1,
        "Large fringe metro" = 2,
        "Medium metro" = 3,
        "Small metro" = 4,
        "Micropolitan (nonmetropolitan)" = 5,
        "Noncore (nonmetropolitan)" = 6
    )) %>%
    set_value_labels(code2006 = c(
        "Large central metro" = 1,
        "Large fringe metro" = 2,
        "Medium metro" = 3,
        "Small metro" = 4,
        "Micropolitan (nonmetropolitan)" = 5,
        "Noncore (nonmetropolitan)" = 6
    )) %>%
    set_value_labels(code1990 = c(
        "Large central metro" = 1,
        "Large fringe metro" = 2,
        "Medium metro" = 3,
        "Small metro" = 4,
        "With a city of 10,000 or more (nonmetropolitan)" = 5,
        "Without a city of 10,00 or more (nonmetropolitan)" = 6
    )) %>%
    print() -> nchs_urc

devtools::use_data(nchs_urc, overwrite = TRUE)
