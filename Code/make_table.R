here::i_am("code/make_table.R")

# load data
covid_sub <- read.csv(here::here("raw_data/covid_sub.csv"))

# load packages
library(tidyverse)
library(gtsummary)

# Ensure the folder exists before saving
dir.create(here::here("output"), showWarnings = FALSE, recursive = TRUE)

# make table 1
table_one <- covid_sub %>%
  # clean up some of the variables
  mutate(
    DIED = if_else(is.na(DATE_DIED), "Yes", "No"),
    SEX = case_when(SEX == 'female' ~ "Female",
                    SEX == "male" ~ "Male"),
    PATIENT_TYPE = case_when(PATIENT_TYPE == "hospitalization" ~ "Hospitalized",
                             PATIENT_TYPE == "returned home" ~ "Returned Home")
  ) %>%
  # make table 1
  select(-X, -USMER, -MEDICAL_UNIT, -CLASIFFICATION_FINAL, -ICU, -DATE_DIED) %>%
  tbl_summary(
    missing = "no",
    label = list(
      SEX ~ "Sex",
      AGE ~ "Age (years)",
      PATIENT_TYPE ~ "Patient Type",
      INTUBED ~ "Intubation Required",
      PNEUMONIA ~ "Pneumonia",
      PREGNANT ~ "Pregnant",
      DIABETES ~ "Diabetes",
      COPD ~ "COPD",
      ASTHMA ~ "Asthma",
      INMSUPR ~ "Immunosuppression",
      HIPERTENSION ~ "Hypertension",
      CARDIOVASCULAR ~ "Cardiovascular Disease",
      RENAL_CHRONIC ~ "Chronic Kidney Disease",
      OTHER_DISEASE ~ "Other Comorbidity",
      OBESITY ~ "Obesity",
      TOBACCO ~ "Tobacco Use",
      DIED ~ "Mortality"
    )
  ) %>%
  modify_table_body(
    ~.x %>%
      arrange(
        factor(variable, levels = c(
          "AGE", "SEX", "DIED", "PATIENT_TYPE", "PNEUMONIA", "DIABETES",
          "HIPERTENSION", "OBESITY", "CARDIOVASCULAR", "COPD",
          "ASTHMA", "RENAL_CHRONIC", "OTHER_DISEASE", "INMSUPR",
          "TOBACCO", "PREGNANT", "INTUBED" 
        ))
      )
  ) %>%
  italicize_levels()

saveRDS(table_one,
        file = here::here("output/table_one.RDS")
        )
  