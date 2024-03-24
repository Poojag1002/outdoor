print("HelloWorld")
x <- 1
y <- 2
z=x+y
my_string <- "comment me with ctrl-Shift-C"
print(my_string)

library(httr)
library(jsonlite)
token <- "D53E4D05D75354D5E9E324999672561A"
url <- "https://rc.ctu.exeter.ac.uk/api/"
formData <- list("token"=token,
                 content='report',
                 format='json',
                 report_id='209',
                 csvDelimiter='',
                 rawOrLabel='raw',
                 rawOrLabelHeaders='raw',
                 exportCheckboxLabel='true',
                 returnFormat='json'
)
response <- httr::POST(url, body = formData, encode = "form")
result <- httr::content(response)
print(result)
parsed_data <- fromJSON(content(response,"text"))
library(ggplot2)
View(parsed_data)
library(plotly)
colum
Sys.setenv("plotly_username" = "Outdoor")
Sys.setenv("plotly_api_key" = "response")
# Filter the parsed JSON data for the required information
eligible_participants <- parsed_data$parsed$data
eligible_participants <- subset(eligible_participants, "scr_calc" == 1)
print(eligible_participants)

# Create a bar chart using ggplot2
ggplot(eligible_participants, aes(x = eligible_participants.scr_calc)) +
  geom_bar(fill = "green") +
  labs(title = "Distribution of Eligible Participants by Eligibility (scr_calc = 1)",
       x = "Scr_calc",
       y = "Count")