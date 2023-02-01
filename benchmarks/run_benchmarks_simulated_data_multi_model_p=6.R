###############
## global setup
###############
library(dplyr)
#share_unlabeled = 0.8
set.seed(2138720)

# simulate data
p = 6 

feature_1 <- rnorm(n, mean = 0.2)
feature_2 <- rnorm(n, mean = -2)
feature_3 <- rnorm(n, mean = 1.8)
feature_4 <- rnorm(n, mean = -1)
feature_5 <- rnorm(n, mean = 1.5, sd = 4)
feature_6 <- rnorm(n, mean = -1, sd = 8)
feature_7 <- rnorm(n, mean = -2, sd = 1)
feature_8 <- rnorm(n, mean = 0, sd = 4)
feature_9 <- rnorm(n, mean = 4, sd = 8)
feature_10 <- rnorm(n, mean = 2, sd = 4)
feature_11 <- rnorm(n, mean = 3, sd = 2)
feature_12 <- rnorm(n, mean = -2, sd = 18)
feature_13 <- rnorm(n, mean = -1, sd = 30)
feature_14 <- rnorm(n, mean = -1, sd = 1)
feature_15 <- rnorm(n, mean = -1, sd = 2)
feature_16 <- rnorm(n, mean = 20, sd = 4)
feature_17 <- rnorm(n, mean = 1, sd = 2)
feature_18 <- rnorm(n, mean = -5, sd = 18)
feature_19 <- rnorm(n, mean = -9, sd = 30)
feature_20 <- rnorm(n, mean = -1, sd = 1)
feature_21 <- rnorm(n, mean = 23, sd = 2)
feature_22 <- rnorm(n, mean = -21, sd = 18)
feature_23 <- rnorm(n, mean = -14, sd = 30)
feature_24 <- rnorm(n, mean = -2, sd = 11)
feature_25 <- rnorm(n, mean = 0, sd = 24)
feature_26 <- rnorm(n, mean = 2, sd = 40)
feature_27 <- rnorm(n, mean = 60, sd = 2)
feature_28 <- rnorm(n, mean = 41, sd = 18)
feature_29 <- rnorm(n, mean = 64, sd = 30)
feature_30 <- rnorm(n, mean = -13, sd = 11)
feature_31 <- rnorm(n, mean = 0, sd = 2)
feature_32 <- rnorm(n, mean = -22, sd = 18)
feature_33 <- rnorm(n, mean = -19, sd = 20)
feature_34 <- rnorm(n, mean = -21, sd = 1)
feature_35 <- rnorm(n, mean = 0.22, sd = 24.5)
feature_36 <- rnorm(n, mean = 2.46, sd = 40)
feature_37 <- rnorm(n, mean = 0.46, sd = 2)
feature_38 <- rnorm(n, mean = -42, sd = 18)
feature_39 <- rnorm(n, mean = -67, sd = 30)
feature_40 <- rnorm(n, mean = -12, sd = 11)
feature_41 <- rnorm(n, mean = 24, sd = 0.2)
feature_42 <- rnorm(n, mean = -47, sd = 18)
feature_43 <- rnorm(n, mean = -44, sd = 30)
feature_44 <- rnorm(n, mean = -4.67, sd = 11)
feature_45 <- rnorm(n, mean = 3.48, sd = 24)
feature_46 <- rnorm(n, mean = 2.576, sd = 0.1)
feature_47 <- rnorm(n, mean = 0, sd = 0.2)
feature_48 <- rnorm(n, mean = 74, sd = 0.18)
feature_49 <- rnorm(n, mean = -87, sd = 3)
feature_50 <- rnorm(n, mean = -1, sd = 0.11)
feature_51 <- rnorm(n, mean = 98, sd = 2)
feature_52 <- rnorm(n, mean = -41, sd = 18)
feature_53 <- rnorm(n, mean = -14, sd = 30)
feature_54 <- rnorm(n, mean = -45, sd = 11)
feature_55 <- rnorm(n, mean = 0, sd = 24)
feature_56 <- rnorm(n, mean = 20, sd = 40)
feature_57 <- rnorm(n, mean = 3, sd = 2)
feature_58 <- rnorm(n, mean = 4, sd = 18)
feature_59 <- rnorm(n, mean = 6, sd = 30)
feature_60 <- rnorm(n, mean = -6, sd = 11)


lin_comb <- 2.4- 7.9*feature_1 + 0.5*feature_2

prob = 1/(1+exp(-lin_comb))
target_var <-rbinom(n, 1, prob = prob)
sum(target_var)
data_frame <- data_frame(target_var = target_var, feature_1 = feature_1, feature_2 = feature_2,
                         feature_3 = feature_3, feature_4 = feature_4, feature_5 = feature_5, feature_6 = feature_6) #, feature_7 = feature_7, feature_8 = feature_8,
#                          feature_9 = feature_9, feature_10 = feature_10, feature_11 = feature_11,
#                          feature_12 = feature_12, feature_13 = feature_13, feature_14 = feature_14,
#                          feature_15 = feature_15, feature_16 = feature_16, feature_17 = feature_17,
#                          feature_18 = feature_18, feature_19 = feature_19, feature_20 = feature_20,
#                          feature_21 = feature_21, feature_22 = feature_22, feature_23 = feature_23,
#                          feature_24 = feature_24, feature_25 = feature_25, feature_26 = feature_26,
#                          feature_27 = feature_27, feature_28 = feature_28, feature_29 = feature_29,
#                          feature_30 = feature_30, feature_31 = feature_31,
#                          feature_32 = feature_32, feature_33 = feature_33, feature_34 = feature_34,
#                          feature_35 = feature_35, feature_36 = feature_36, feature_37 = feature_37,
#                          feature_38 = feature_38, feature_39 = feature_39, feature_40 = feature_40,
#                          feature_41 = feature_41, feature_42 = feature_42, feature_43 = feature_43,
#                          feature_44 = feature_44, feature_45 = feature_45, feature_46 = feature_46,
#                          feature_47 = feature_47, feature_48 = feature_48, feature_49 = feature_49,
#                          feature_50 = feature_50, feature_51 = feature_51,
#                          feature_52 = feature_52, feature_53 = feature_53, feature_54 = feature_54,
#                          feature_55 = feature_55, feature_56 = feature_56, feature_57 = feature_57,
#                          feature_58 = feature_58, feature_59 = feature_59, feature_60 = feature_60)

formula <- target_var ~ .
glm(formula = formula, data = data_frame, family = "binomial") %>% summary()

data_frame = data_frame %>% as.data.frame()
name_df = "simulated" # for results 
data = "simulated" # for results 

#train test splict
n_test = nrow(data_frame)*0.5
n_test = round(n_test)



# formula for logistic regression
formula = target_var~ 1 + feature_1 + feature_2 + feature_3 + feature_4 + feature_5 + feature_6 #+
# feature_7 + feature_8 + feature_9 + feature_10 + feature_11 + feature_12 + feature_13 +
# feature_14 + feature_15 + feature_16 + feature_17 + feature_18 + feature_19 + feature_20 +
# feature_21 + feature_22 + feature_23 + feature_24 + feature_25 + feature_26 + feature_27 +
# feature_28 + feature_29 + feature_30 + feature_31 + feature_32 + feature_33 +
# feature_34 + feature_35 + feature_36 + feature_37 + feature_38 + feature_39 + feature_40 +
# feature_41 + feature_42 + feature_43 +
# feature_44 + feature_45 + feature_46 + feature_47 + feature_48 + feature_49 + feature_50 +
# feature_51 + feature_52 + feature_53 +
# feature_54 + feature_55 + feature_56 + feature_57 + feature_58 + feature_59 + feature_60


formula_alt5 = target_var~ 1 + feature_1 + feature_2 + feature_3 + feature_4 + feature_5 
formula_alt4 = target_var~ 1 + feature_1 + feature_2 + feature_3 + feature_4# + feature_6 +
formula_alt3 = target_var~ 1 + feature_1 + feature_2 + feature_3 #+ feature_5 + feature_6 +
formula_alt2 = target_var~ 1 + feature_1 + feature_2  #+ feature_5 + feature_6 +
formula_alt1 = target_var~ 1 + feature_1  #+ feature_5 + feature_6 +


formula_list = list(formula, formula_alt1, formula_alt2, formula_alt3, formula_alt4, formula_alt5)

summary <- glm(formula = formula, data = data_frame, family = "binomial") %>% summary()
summary
#p <- summary$coefficients %>% nrow() - 1

target = "target_var" 
data_frame[c(target)] <- data_frame[c(target)] %>% unlist() %>% as.factor()
levels_present <- levels(data_frame[c(target)] %>% unlist())
# check whether labels are suited for replacement by 0,1
levels_present
levels(data_frame[, which(names(data_frame) %in% target)]) <- c(0,1)

##########################
# source experiments files
##########################
path_to_experiments = paste(getwd(),"/benchmarks/experiments", sep = "")


# sequential sourcing
# miceadds::source.all(path_to_experiments) 


# parallel sourcing
files_to_source = list.files(path_to_experiments, pattern=".R",
                             full.names = TRUE)

num_cores <- parallel::detectCores() - 1
comp_clusters <- parallel::makeCluster(num_cores) # parallelize experiments
doParallel::registerDoParallel(comp_clusters)
object_vec = c("N", "share_unlabeled", "data_frame", "name_df", "formula", "formula_list","target", "p", "n_test")
env <- environment()
parallel::clusterExport(cl=comp_clusters, varlist = object_vec, envir = env)
parallel::parSapply(comp_clusters, files_to_source, source)
parallel::stopCluster(comp_clusters)



