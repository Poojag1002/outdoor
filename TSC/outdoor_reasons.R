
Title: Reasons for Declined consnet

library(tidyREDCap)
library(tidyverse)
library(expss)
library(CTUReportTool)
library(kableExtra)
rm(list = ls()) # Ensures workspace is clear before starting.

# Imports data from REDCap using API (Re-run this section to refresh the data).
tidyREDCap::import_instruments("https://rc.ctu.exeter.ac.uk/api/",
                               'Token', 
                               record_id = "screening_id1",
                               first_record_id = "OSCR_001",
                               drop_blank = FALSE )


new_screening_log <- mutate(screening_log, scr_calc_character=as.character(scr_calc)) 

Reasons <- ct_var_proportion(data =screening_log, 
                                 demo_var=scr_calc_character,
                                 cats=c("1", "999", NA))

library(kableExtra)
eligibility$status[eligibility$status == "1"] <- "Eligible"
eligibility$status[eligibility$status == "999"] <- "Eneligible"
kbl(eligibility) %>%
  kableExtra::kable_paper(c("hover",
                            "condensed"),
                          full_width = FALSE,
                          html_font = "Helvetica") %>%
  column_spec(1,
              bold = TRUE,
              border_right = TRUE)
