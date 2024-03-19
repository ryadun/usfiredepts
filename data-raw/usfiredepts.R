library(readr)
library(usethis)
library(dplyr)

# File obtained from:
# https://apps.usfa.fema.gov/registry/download


# National List: https://apps.usfa.fema.gov/registry/download?national=Download+national+list

# Retrieved: 2023-03-18

if (!file.exists("data-raw/usfa-registry-national.txt")) {
  download.file("https://apps.usfa.fema.gov/registry/download?national=Download+national+list",
                destfile = "data-raw/usfa-registry-national.txt")
}

usfiredepts <- readr::read_csv("data-raw/usfa-registry-national.txt",
                             name_repair = "universal")

usfiredepts <- usfiredepts %>%
  rename(Active.Firefighters.Career = Active.Firefighters...Career,
         Active.Firefighters.Volunteer = Active.Firefighters...Volunteer,
         Active.Firefighters.Paid.per.Call = Active.Firefighters...Paid.per.Call,
         Non.Firefighting.Civilian = Non.Firefighting...Civilian,
         Non.Firefighting.Volunteer = Non.Firefighting...Volunteer
         )


use_data(usfiredepts, overwrite = TRUE)
