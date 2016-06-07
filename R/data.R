#' State-level FIPS Code
#'
#' FIPS Codes for the 50 states, the District of Columbia, and the Outlying Areas of the United States.
#'
#' @format A data frame with three variables:
#' \describe{
#' \item{fips}{FIPS State Code}
#' \item{usps}{Official United States Postal Service (USPS) Code}
#' \item{state}{State Name}
#' }
#'
#' @source \url{https://www.census.gov/geo/reference/ansi_statetables.html}
"fips"

#' State-level FIPS Code
#'
#' FIPS Codes for the 50 States and the District of Columbia.
#'
#' @format A data frame with three variables:
#' \describe{
#' \item{fips}{FIPS State Code}
#' \item{usps}{Official United States Postal Service (USPS) Code}
#' \item{state}{State Name}
#' }
#'
#' @source \url{https://www.census.gov/geo/reference/ansi_statetables.html}
"state"

#' County-level FIPS Code
#'
#' 2010 FIPS Codes for Counties and County Equivalent Entities.
#'
#' @format A data frame with five variables:
#' \describe{
#' \item{usps}{Official United States Postal Service (USPS) Code}
#' \item{state}{State Name}
#' \item{fips}{2010 FIPS County Code}
#' \item{county}{Full County Name}
#' \item{cty_short}{Short County Name}
#' }
#'
#' @source \url{https://www.census.gov/geo/reference/codes/cou.html}
"county"
