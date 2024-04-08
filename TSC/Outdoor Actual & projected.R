

library(tidyREDCap)
library(tidyverse)
library(expss)

rm(list = ls()) # Ensures workspace is clear before starting.

tidyREDCap::import_instruments(
  "https://rc.ctu.exeter.ac.uk/api/",
  "A53DC565170091392FF2A444108EDC4A",
  record_id = "record_id", 
  first_record_id = "NOR-8_(OSCR_043)",
  drop_blank = FALSE
)

  act_exp_plot_wor <- filter(randomisation, redcap_event_name == "Randomisation")%>% 
    mutate(rando_date = as.Date(rand_date)) %>%
  CTUReportTool::ct_recruit_timeplot(
    date_var = rando_date,
    exp_start = as.Date("2024/02/01"),
    exp_recruitment = c(4,4,4,4,4,4,4,4,4),
   # rev_start = as.Date("2024/02/01"),
    #rev_recruitment = c(59,59,59,59,59,59,59,59,59,59,58),
    title = "Actual vs Projected Randomisation"
  )
  act_exp_plot_wor

  ggsave("C:/Users/pg468/workspace/outdoor/TSC/outdoor_randomisation.jpg", height = 0.618*12, width = 12)
  
  getwd()
  