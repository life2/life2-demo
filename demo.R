# load packages -----------------------------------------------------------
library(here)


# load functions and data -------------------------------------------------
source(here("demo-setup.R"))


# explore data and functions ----------------------------------------------

cat(c("\014",
      paste0(c("# ", rep("-", 50)), collapse = ""), "\n",
      "# All Functions...........", green("LOADED\n"),
      "# Independent Variables...", green("LOADED\n"),
      "# Dependent Variable......", green("LOADED\n"),
      paste0(c("# ", rep("-", 50)), collapse = ""), "\n",
      "#", cyan("Numer of Dependent Variables:  "), ncol(dv), "\n",
      "#", cyan("Numer of Independent Variables:"), ncol(iv), "\n",
      paste0(c("# ", rep("-", 50)), collapse = ""), "\n",
      red("!!!! DISCLAIMER: These datasets were created for demo purposes using only one year of historic data !!!!"))
)

names(dv) # "dv_med_claim_paid_amt_sum_t90"
grep("^dv_", names(dv), value = TRUE)
grep("dv_med_claim", names(dv), value = TRUE)
grep("dv_hospitalization", names(dv), value = TRUE)

View(dv)

iv_names <- list(
  medical_vars = grep("^iv_med", names(iv)),
  dental_vars = grep("^iv_dent", names(iv)),
  rx_vars = grep("^iv_rx", names(iv)),
  wellview_vars = grep("wellview", names(iv)),
  case_mgmt_vars = grep("^iv_case_mgmt", names(iv)),
  plan_vars = grep("^iv_plan", names(iv)),
  precert_vars = grep("^iv_precert", names(iv)),
  experian_vars = grep("^iv_experian", names(iv)),
  provider_vars = grep("^iv_provider", names(iv)),
  temporal_vars = grep("^iv_temporal", names(iv)),
  county_vars = grep("^iv_county", names(iv)),
  other_vars = grep("^iv_age|^iv_member|^iv_sample|^iv_zip", names(iv))
)

# Identifiers
names(iv)[-unlist(iv_names)]

# Data Sources
data.frame(num_vars = sapply(iv_names, length)) %>% 
  tibble::rownames_to_column(var = "source") %>% 
  ggplot(aes(y = reorder(source, num_vars), x = num_vars)) +
  geom_col() +
  xlab("Numer of Variables") +
  ylab("Variable Source")
  

grep("experian", names(iv), value = TRUE)
grep("Mosaic", names(iv), value = TRUE)
grep("sentiment", names(iv), value = TRUE)
grep("NegAff", names(iv), value = TRUE)

# head(iv[, c("person_id", "sample_date", "iv_experian_Mosaic_Household_latest")])

iBuildAndTestModels

?iBuildAndTestModels

get_predictor_vars(params)
