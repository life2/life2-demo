library(crayon)
library(randomForest)
project_base_dir <- "C:/Users/Derek/Desktop/GBA"
source(file.path(project_base_dir, "R/main.R"))

params <- 
  get_params_from_file(
    file.path(project_base_dir,"ini/ALTUM_DEV_DMN.ini"),
    setup_logging = FALSE,
    setup_db = FALSE
  )
load_libraries(params)

iv_file <- here::here("data", "iv.RDS")
dv_file <- here::here("data", "dv.RDS")

iv <- readRDS(iv_file)
dv <- readRDS(dv_file)

rm(iv_file, dv_file, project_base_dir)
