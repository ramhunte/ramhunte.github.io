# Load packages required to define the pipeline:
library(targets)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()

# Set target options:
tar_option_set(packages = c("palmerpenguins", "janitor", "tidyverse")) # load our packages for the analysis

# here is where we define our targets using our custom functions
list(
  tar_target(data, pull_data()),
  tar_target(data_c, clean_data(data)),
  tar_target(plot, plot_data(data_c)),
  tar_target(model, fit_model(data_c)),
  tar_target(coefs, model_coefs(model)),
  tar_target(r2, model_r2(model))
)
