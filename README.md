<!-- README.md is generated from README.Rmd. Please edit that file -->
FIPS Codes for the States and the District of Columbia
======================================================

This package contains a dataset `fips` that has three variables:

-   `fips`: FIPS State Code
-   `usps`: Official United States Postal Service (USPS) Code
-   `state`: State Name

Installation
============

Install from github with

``` r
devtools::install_github("jjchern/fips").
```

Usage
=====

``` r
library(fips)
fips
#>    fips usps                state
#> 1     1   AL              Alabama
#> 2     2   AK               Alaska
#> 3     4   AZ              Arizona
#> 4     5   AR             Arkansas
#> 5     6   CA           California
#> 6     8   CO             Colorado
#> 7     9   CT          Connecticut
#> 8    10   DE             Delaware
#> 9    11   DC District of Columbia
#> 10   12   FL              Florida
#> 11   13   GA              Georgia
#> 12   15   HI               Hawaii
#> 13   16   ID                Idaho
#> 14   17   IL             Illinois
#> 15   18   IN              Indiana
#> 16   19   IA                 Iowa
#> 17   20   KS               Kansas
#> 18   21   KY             Kentucky
#> 19   22   LA            Louisiana
#> 20   23   ME                Maine
#> 21   24   MD             Maryland
#> 22   25   MA        Massachusetts
#> 23   26   MI             Michigan
#> 24   27   MN            Minnesota
#> 25   28   MS          Mississippi
#> 26   29   MO             Missouri
#> 27   30   MT              Montana
#> 28   31   NE             Nebraska
#> 29   32   NV               Nevada
#> 30   33   NH        New Hampshire
#> 31   34   NJ           New Jersey
#> 32   35   NM           New Mexico
#> 33   36   NY             New York
#> 34   37   NC       North Carolina
#> 35   38   ND         North Dakota
#> 36   39   OH                 Ohio
#> 37   40   OK             Oklahoma
#> 38   41   OR               Oregon
#> 39   42   PA         Pennsylvania
#> 40   44   RI         Rhode Island
#> 41   45   SC       South Carolina
#> 42   46   SD         South Dakota
#> 43   47   TN            Tennessee
#> 44   48   TX                Texas
#> 45   49   UT                 Utah
#> 46   50   VT              Vermont
#> 47   51   VA             Virginia
#> 48   53   WA           Washington
#> 49   54   WV        West Virginia
#> 50   55   WI            Wisconsin
#> 51   56   WY              Wyoming

# Save as Stata .dta file
foreign::write.dta(fips, "fips.dta")
```
