
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Travis-CI Build
Status](https://travis-ci.org/jjchern/fips.svg?branch=master)](https://travis-ci.org/jjchern/fips)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/jjchern/fips?branch=master&svg=true)](https://ci.appveyor.com/project/jjchern/fips)

# About {fips}

The R package {fips} makes it easier to merge geographic identifiers
such as state FIPS, county FIPS, urban-rural codes, and BEA region
codes. The following datasets are available:

  - `fips::fips`, `fips::state`, and `fips::lower48`:
      - State-level FIPS codes.
        [(Source)](https://www.census.gov/geo/reference/ansi_statetables.html)
      - `fips::fips` contains 50 states, the District of Columbia, and
        the Outlying Areas of the United States.
      - `fips::state` contains 50 states and the District of Columbia.
      - `fips::lower48` contains the 48 Contiguous Continental States
        and the District of Columbia.
  - `fips::county`, `fips::county_ipums_usa`
      - County-level FIPS codes.
      - `fips::county` contains 2010 county-level FIPS codes.
        [(Source)](https://www.census.gov/geo/reference/codes/cou.html)
      - `fips::county_ipums_usa` contains counties that are identified
        through the microdata maintained by IPUMS.
        [(Source)](https://usa.ipums.org/usa-action/variables/COUNTYFIP#description_section)
  - `fips::nchs_urc`:
      - NCHS Urban-Rural Classification Scheme for Counties.
        [(Source)](https://www.cdc.gov/nchs/data_access/urban_rural.htm)
  - `fips::bea_region`:
      - BEA Region codes.
        [(Source)](https://www.bea.gov/regional/docs/regions.cfm)

Similar implementation in Stata:

  - [{statastates} by
    `@wschpero`](https://github.com/wschpero/statastates)

Similar R packages:

  - [{zipcodes} by `@jacobkap`](https://github.com/jacobkap/zipcodes)
  - [The data set `US_states` in {EconData} by
    `@floswald`](https://github.com/floswald/EconData)

# Installation

You can install the development version of {fips} from Github with:

``` r
# install.packages("remotes")
remotes::install_github("jjchern/fips")
```

Or install the most recent released version of {fips} from Github with:

``` r
remotes::install_github("jjchern/fips@v0.0.4")
```

# Usage

## State-level FIPS code

``` r
library(tidyverse)
fips::state
#> # A tibble: 51 x 3
#>    fips  usps  state               
#>    <chr> <chr> <chr>               
#>  1 01    AL    Alabama             
#>  2 02    AK    Alaska              
#>  3 04    AZ    Arizona             
#>  4 05    AR    Arkansas            
#>  5 06    CA    California          
#>  6 08    CO    Colorado            
#>  7 09    CT    Connecticut         
#>  8 10    DE    Delaware            
#>  9 11    DC    District of Columbia
#> 10 12    FL    Florida             
#> # … with 41 more rows

# fips::fips includes FIPS code for other outlying areas
fips::fips 
#> # A tibble: 57 x 3
#>    fips  usps  state               
#>    <chr> <chr> <chr>               
#>  1 01    AL    Alabama             
#>  2 02    AK    Alaska              
#>  3 04    AZ    Arizona             
#>  4 05    AR    Arkansas            
#>  5 06    CA    California          
#>  6 08    CO    Colorado            
#>  7 09    CT    Connecticut         
#>  8 10    DE    Delaware            
#>  9 11    DC    District of Columbia
#> 10 12    FL    Florida             
#> # … with 47 more rows
fips::fips %>% tail(10)
#> # A tibble: 10 x 3
#>    fips  usps  state                      
#>    <chr> <chr> <chr>                      
#>  1 53    WA    Washington                 
#>  2 54    WV    West Virginia              
#>  3 55    WI    Wisconsin                  
#>  4 56    WY    Wyoming                    
#>  5 60    AS    American Samoa             
#>  6 66    GU    Guam                       
#>  7 69    MP    Northern Mariana Islands   
#>  8 72    PR    Puerto Rico                
#>  9 74    UM    U.S. Minor Outlying Islands
#> 10 78    VI    U.S. Virgin Islands

# fips::lower48 includes the 48 continental states and DC
fips::lower48
#> # A tibble: 49 x 3
#>    fips  usps  state               
#>    <chr> <chr> <chr>               
#>  1 01    AL    Alabama             
#>  2 04    AZ    Arizona             
#>  3 05    AR    Arkansas            
#>  4 06    CA    California          
#>  5 08    CO    Colorado            
#>  6 09    CT    Connecticut         
#>  7 10    DE    Delaware            
#>  8 11    DC    District of Columbia
#>  9 12    FL    Florida             
#> 10 13    GA    Georgia             
#> # … with 39 more rows
```

## 2010 FIPS code for counties

``` r
fips::county
#> # A tibble: 3,235 x 4
#>    usps  state   fips  county         
#>    <chr> <chr>   <chr> <chr>          
#>  1 AL    Alabama 01001 Autauga County 
#>  2 AL    Alabama 01003 Baldwin County 
#>  3 AL    Alabama 01005 Barbour County 
#>  4 AL    Alabama 01007 Bibb County    
#>  5 AL    Alabama 01009 Blount County  
#>  6 AL    Alabama 01011 Bullock County 
#>  7 AL    Alabama 01013 Butler County  
#>  8 AL    Alabama 01015 Calhoun County 
#>  9 AL    Alabama 01017 Chambers County
#> 10 AL    Alabama 01019 Cherokee County
#> # ... with 3,225 more rows
```

## Counties Identified in IPUMS USA (2005-forward)

``` r
fips::county_ipums_usa %>% 
    select(countyfip, 
           `2000 5% & 1% unwt, acs 2005`,
           `acs 2006-2011`, 
           `2010 10%, acs 2012-onward`) %>% 
    na.omit() %>% 
    select(countyfip)
#> # A tibble: 331 x 1
#>    countyfip
#>    <chr>    
#>  1 01003    
#>  2 01015    
#>  3 01055    
#>  4 01073    
#>  5 01081    
#>  6 01097    
#>  7 01117    
#>  8 02020    
#>  9 04005    
#> 10 04013    
#> # … with 321 more rows
```

## BEA Region codes for states

``` r
fips::bea_region
#> # A tibble: 51 x 7
#>    fips  usps  state   short_region_na… region_code region_name region_abbr
#>    <chr> <chr> <chr>   <chr>                  <int> <chr>       <chr>      
#>  1 09    CT    Connec… New England                1 New Englan… NENG       
#>  2 23    ME    Maine   New England                1 New Englan… NENG       
#>  3 25    MA    Massac… New England                1 New Englan… NENG       
#>  4 33    NH    New Ha… New England                1 New Englan… NENG       
#>  5 44    RI    Rhode … New England                1 New Englan… NENG       
#>  6 50    VT    Vermont New England                1 New Englan… NENG       
#>  7 10    DE    Delawa… Mideast                    2 Mideast Re… MEST       
#>  8 11    DC    Distri… Mideast                    2 Mideast Re… MEST       
#>  9 24    MD    Maryla… Mideast                    2 Mideast Re… MEST       
#> 10 34    NJ    New Je… Mideast                    2 Mideast Re… MEST       
#> # … with 41 more rows
```

![](README-files/bea_regions-1.png)<!-- -->

## NCHS Urban Rural Codes

``` r
fips::nchs_urc
#> # A tibble: 3,147 x 10
#>    usps  statefip fips  county code2013 code2006 code1990 cbsatitle cbsapop
#>    <chr> <chr>    <chr> <chr>  <dbl+lb> <dbl+lb> <dbl+lb> <chr>       <dbl>
#>  1 AL    01       01001 Autau… 3        3        3        Montgome…  377149
#>  2 AL    01       01003 Baldw… 4        5        3        Daphne-F…  190790
#>  3 AL    01       01005 Barbo… 6        5        5        ""             NA
#>  4 AL    01       01007 Bibb … 2        2        6        Birmingh… 1136650
#>  5 AL    01       01009 Bloun… 2        2        3        Birmingh… 1136650
#>  6 AL    01       01011 Bullo… 6        6        6        ""             NA
#>  7 AL    01       01013 Butle… 6        6        6        ""             NA
#>  8 AL    01       01015 Calho… 4        4        4        Anniston…  117296
#>  9 AL    01       01017 Chamb… 5        5        6        Valley, …   34064
#> 10 AL    01       01019 Chero… 6        6        6        ""             NA
#> # … with 3,137 more rows, and 1 more variable: ctypop <dbl>
```

![](README-files/nchs_urc_2013-1.png)<!-- -->

![](README-files/nchs_urc_2006-1.png)<!-- -->

![](README-files/nchs_urc_1990-1.png)<!-- -->
