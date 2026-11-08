library(tidyverse)
library(tidymodels)
library(kknn)

##################################################################
# Load the dataset your group picked in ML in practice I

# Dataset 1: Hotel bookings
# https://github.com/rfordatascience/tidytuesday/blob/main/data/2020/2020-02-11/readme.md
tuesdata <- tidytuesdayR::tt_load("2020-02-11")
hotels <- tuesdata$hotels

# Dataset 2: Coffee ratings
# https://github.com/rfordatascience/tidytuesday/blob/main/data/2020/2020-07-07/readme.md
tuesdata <- tidytuesdayR::tt_load("2020-07-07")
coffee <- tuesdata$coffee_ratings

# Dataset 3: Spotify songs
# https://github.com/rfordatascience/tidytuesday/blob/main/data/2020/2020-01-21/readme.md
tuesdata <- tidytuesdayR::tt_load("2020-01-21")
spotify <- tuesdata$spotify_songs

# Dataset 4: Himalayan expeditions
# https://github.com/rfordatascience/tidytuesday/blob/main/data/2025/2025-01-21/readme.md
tuesdata <- tidytuesdayR::tt_load("2025-01-21")
exped <- tuesdata$exped_tidy
peaks <- tuesdata$peaks_tidy


##################################################################
# Your turn: compare three models for your group's question

# Prepare the data: select the response and the predictors (no leakage variables!),
# make a binary response a factor, and subsample if the data is large


# Step 0: training-testing split, shared by all models (strata if the response is uneven)


# Step 1: specify the models
# binary response:  logistic_reg(), nearest_neighbor(mode = "classification"), rand_forest(mode = "classification")
# numeric response: linear_reg(),   nearest_neighbor(mode = "regression"),     rand_forest(mode = "regression")


# Step 2: a recipe for each model
# linear/logistic regression: step_dummy()
# KNN: step_dummy() and step_normalize()
# random forest: nothing extra
# all models, if needed: step_naomit(), step_other(), step_zv()


# Step 3: a workflow for each model


# Step 4a: the cross-validation folds, shared by all models


# Step 4b: the hyperparameter grid for each model


# Step 4c: fit each model on the folds, with the same metrics
# metric_set(accuracy, roc_auc) or metric_set(rmse, rsq)
# fit_resamples() for linear/logistic regression, tune_grid() for KNN and random forest
# control = control_grid(save_pred = TRUE) to keep the predictions for ROC curves


# Step 4d: average the metrics over the folds


# Step 4e: the best version of each model


# Step 4.5: compare the models on their cross-validation results (mean and std_err),
# plot them, draw the ROC curves (binary response), and choose one


# Step 5/6: refit the chosen model on the training data, and evaluate it once
# on the testing data with last_fit()
