library(dplyr)
library(checkmate,asserthat)
source("R/utils_diff_marg_likelihood.R")

diff_marg_likelihood_all_ext <- function(labeled_data,
                                     unlabeled_data,
                                     target,
                                     glm_formula, 
                                     crit = "sum",
                                     weight = NULL) {
  # some input checking
  assert_number(n_imp)
  assert_data_frame(data)
  assert_formula(formula)
  assert_character(crit)
  assert_character(target)
  
  if(is.null(weight) == FALSE)
    assert_numeric(weight)
  if(crit == "weighted sum" && is.null(weight))
    stop("When using weihgted sum as criterion, a weight must be specified")
  if(is.null(weight) == FALSE && between(weight, 0, 1) == FALSE)
    stop("weight must lie between 0 and 1.")
  
  n_imp = nrow(unlabeled_data)
  
  results = matrix(nrow = n_imp, ncol = 3)
  which_flip = seq(n_imp)

  for (i in seq(n_imp)) {
    if(i >= 2){
      which_flip <- which_flip[-(winner)]
    }
    unlabeled_data[,target] <- 1
    data_sets_1 = list()  
    for (flip_count in seq_along(which_flip)) {
      flip = which_flip[flip_count]
      new_data = rbind(labeled_data, unlabeled_data[flip_count,])
      data_sets_1[[flip_count]] = new_data 
    }
    unlabeled_data[,target] <- 0
    data_sets_0 = list()  
    for (flip_count in seq_along(which_flip)) {
      flip = which_flip[flip_count]
      new_data = rbind(labeled_data, unlabeled_data[flip_count,])
      data_sets_0[[flip_count]] = new_data 
    }

    # fit models for 1
    marg_l_1 = list()
    models_1 = list()
    for(flip_count in seq_along(which_flip)){
      logistic_model <- glm(formula = formula, 
                            data = data_sets_0[[flip_count]], 
                            family = "binomial")
      n <- data_sets_1[[flip_count]] %>% nrow()
      #logistic_model <- step(logistic_model, k = log(n), trace = 0, direction = "backward")
      marg_l_1[[flip_count]] <- get_log_marg_l(logistic_model)
      models_1[[flip_count]] <- logistic_model
    }
    
    
    # fit models for 0
    marg_l_0 = list()
    models_0 = list()
    for(flip_count in seq_along(which_flip)){
      logistic_model <- glm(formula = formula, 
                            data = data_sets_1[[flip_count]], 
                            family = "binomial")
      n <- data_sets_0[[flip_count]] %>% nrow()
      #logistic_model <- step(logistic_model, k = log(n), trace = 0, direction = "backward")
      marg_l_0[[flip_count]] <- get_log_marg_l(logistic_model)
      models_0[[flip_count]] <- logistic_model
    }

    # get predictions
    logistic_model <- glm(formula = formula, 
                          data = labeled_data, 
                          family = "binomial")
    # get weights from predictions
    response_preds = predict(logistic_model, newdata = unlabeled_data, type = "response")
    prob_weights_1 <- response_preds
    prob_weights_0 <- 1 -response_preds
    
    n <- labeled_data %>% nrow()
    #logistic_model <- step(logistic_model, k = log(n), trace = 0, direction = "backward")
    #marg_l_null <- logistic_model %>% get_log_marg_l()
    
    
    
 marg_l_0 = marg_l_0 %>% unlist %>% as.numeric()
 marg_l_1 = marg_l_1 %>% unlist %>% as.numeric()
 
    switch (crit,
            "sum" = {
              crit_eval = unlist(marg_l_0) + unlist(marg_l_1)
            },
            "weighted sum" = {
              crit_eval = unlist(marg_l_0) + weights * unlist(marg_l_1)
            },
            "nat-weighted sum" = {
              crit_eval = prob_weights_0 * unlist(marg_l_0) + prob_weights_1 * unlist(marg_l_1)
            },
            "min" = {
              crit_eval = min(unlist(marg_l_0), unlist(marg_l_1))
            },
            "max" = {
              crit_eval = max(unlist(marg_l_0), unlist(marg_l_1))
            }
    )
    
    if(length(crit_eval) != 1)
     winner = which.max(crit_eval)
      else
        winner = 1
    
print(unlabeled_data[winner,])
print(winner)
print(crit_eval)
  #######
    # predict on it again and add to labeled data
    predicted_target <- predict(logistic_model, newdata= unlabeled_data[winner,], type = "response")
    new_labeled_obs <- unlabeled_data[winner,]
    new_labeled_obs[c(target)] <- ifelse(predicted_target > 0.5, 1,0)  
    
    # evaluate test error (on-the-fly inductive learning results)
    scores = predict(logistic_model, newdata = test_data, type = "response") 
    prediction_test <- ifelse(scores > 0.5, 1, 0)
    test_acc <- sum(prediction_test == test_data[c(target)])/nrow(test_data)
    
    
    # update labeled data
    labeled_data<- rbind(labeled_data, new_labeled_obs)
    # store results
    results[i,] <- c(unlabeled_data[winner,]$nr, new_labeled_obs[c(target)], test_acc) %>% unlist()
    unlabeled_data <- unlabeled_data[-winner,]
    
  }
  
  # get final model
  final_model <- logistic_model <- glm(formula = formula, 
                                       data = labeled_data, 
                                       family = "binomial")
  # return transductive results (labels) and final model
  list(results, final_model)
  
}


