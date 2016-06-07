
<!-- README.md is generated from README.Rmd. Please edit that file -->
About
=====

`fips` is an R data package. It contains state-level and 2010 county-level FIPS code from U.S. Census.

-   [Source for State FIPS Code](https://www.census.gov/geo/reference/ansi_statetables.html)
-   [Source for County FIPS Code](https://www.census.gov/geo/reference/codes/cou.html)

Installation
============

``` r
# install.package("devtools")
devtools::install_github("jjchern/fips")
```

Usage
=====

``` r
library(dplyr, warn.conflicts = FALSE)

# 51 state-level FIPS code
fips::state
#> Source: local data frame [51 x 3]
#> 
#>     fips  usps                state
#>    <chr> <chr>                <chr>
#> 1     01    AL              Alabama
#> 2     02    AK               Alaska
#> 3     04    AZ              Arizona
#> 4     05    AR             Arkansas
#> 5     06    CA           California
#> 6     08    CO             Colorado
#> 7     09    CT          Connecticut
#> 8     10    DE             Delaware
#> 9     11    DC District of Columbia
#> 10    12    FL              Florida
#> ..   ...   ...                  ...

# fips::fips includes FIPS code for other outlying areas
fips::fips 
#> Source: local data frame [57 x 3]
#> 
#>     fips  usps                state
#>    <chr> <chr>                <chr>
#> 1     01    AL              Alabama
#> 2     02    AK               Alaska
#> 3     04    AZ              Arizona
#> 4     05    AR             Arkansas
#> 5     06    CA           California
#> 6     08    CO             Colorado
#> 7     09    CT          Connecticut
#> 8     10    DE             Delaware
#> 9     11    DC District of Columbia
#> 10    12    FL              Florida
#> ..   ...   ...                  ...
fips::fips %>% tail(10)
#> Source: local data frame [10 x 3]
#> 
#>     fips  usps                       state
#>    <chr> <chr>                       <chr>
#> 1     53    WA                  Washington
#> 2     54    WV               West Virginia
#> 3     55    WI                   Wisconsin
#> 4     56    WY                     Wyoming
#> 5     60    AS              American Samoa
#> 6     66    GU                        Guam
#> 7     69    MP    Northern Mariana Islands
#> 8     72    PR                 Puerto Rico
#> 9     74    UM U.S. Minor Outlying Islands
#> 10    78    VI         U.S. Virgin Islands

# 2010 FIPS code for counties
fips::county
#> Source: local data frame [3,235 x 5]
#> 
#>     usps   state  fips          county cty_short
#>    <chr>   <chr> <chr>           <chr>     <chr>
#> 1     AL Alabama 01001  Autauga County  Autauga 
#> 2     AL Alabama 01003  Baldwin County  Baldwin 
#> 3     AL Alabama 01005  Barbour County  Barbour 
#> 4     AL Alabama 01007     Bibb County     Bibb 
#> 5     AL Alabama 01009   Blount County   Blount 
#> 6     AL Alabama 01011  Bullock County  Bullock 
#> 7     AL Alabama 01013   Butler County   Butler 
#> 8     AL Alabama 01015  Calhoun County  Calhoun 
#> 9     AL Alabama 01017 Chambers County Chambers 
#> 10    AL Alabama 01019 Cherokee County Cherokee 
#> ..   ...     ...   ...             ...       ...

# Save as Stata .dta file
haven::write_dta(fips::state, "statefip.dta")
```
