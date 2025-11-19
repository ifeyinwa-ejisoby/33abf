here::i_am("Code/make_model.R")

# load packages
library(dplyr)
library(gtsummary)

# load in raw data
raw_data <- read.csv("raw_data/covid_sub.csv")

# clean data  
data <- raw_data %>% 
  mutate(DEATH = ifelse(is.na(DATE_DIED), 0, 1), # make death indicator
         SEX = ifelse(SEX == "female", "Female", "Male"),
         INTUBATED = INTUBED)

# logistic model predicting mortality 
fit <- glm(DEATH ~ AGE + SEX + PNEUMONIA + INTUBATED,
           family = binomial(link = "logit"),
           data = data
)

# make table for regression results
logistic_reg_table <- tbl_regression(fit, exponentiate = TRUE) %>% 
  modify_caption("Logistic Regression Model for Mortality") %>% 
  bold_p(t = 0.05) %>% 
  add_global_p()
 
# save regression table
saveRDS(logistic_reg_table,
        file = here::here("output/logistic_reg_table.rds"))
