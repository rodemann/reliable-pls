
# *In all LikelihoodS*

## How to Reliably Select Pseudo-Labeled Data for Self-Training in Semi-Supervised Learning



### Introduction, TOC
This anonymous repository contains code for Selecting Pseudo-Labels the Bayesian way, as introduced in the paper "Bayes Optimal Pseudo-Label Selection for Semi-Supervised Learning"

* [R](R) contains implementation of BPLS with PPP and alternative PLS methods to benchmark against
* [benchmarking](benchmarking) provides files for experiments (section 4), in order to reproduce results, see setup below
* [data](data) contains real-world data used in experiments
* experimental results and visualization thereof will be saved in [plots](plots) and [results](results) 


### Tested with

- R 4.2.0
- R 4.1.6
- R 4.0.3

on
- Linux Ubuntu 20.04
- Linux Debian 10
- Windows 11 Pro Build 22H2 

### Bayesian Neural Net 

* integrated by emilio, jann into julian's experimental framework
* call `tf(prob)`, `keras` via `reticulate` to stay consistent with julian's code and plug bnn in as module

#### Setup and Installation

Setup that works on `4.15.0-65-generic` ubuntu server

* tensorflow==2.10.0
* tensorflow_probability==0.16
* keras==2.10.0 
* R 4.2.1 
* python 3.10

Installation:

* little hick hack to get tfproba to run 
* does not work with GPU on jann's machine
* working approach is `install_tensorflow(extra_packages = c("keras", "tensorflow-hub", "tensorflow-probability"), version = "2.10")``
* check header of file `R/diff_marg_likelihood_pred_ext_bnn.R`

#### Prototype: 

* run `benchmarks/entry_bnn.R` from R terminal until line 196 
* run `diff_marg_likelihood_pred_ext()` and to jump into `R/diff_marg_likelihood_pred_ext_bnn.R` debug via `browser()`
* I deleted the rep loop (i.e. set `N=1`) as still development mode
* model trains, adapting it should be straight forward and not sure if the final bernoulli layer adds any value right now
* Check these [Slides](https://rstudio-pubs-static.s3.amazonaws.com/547114_25698a3b3e5440158fa78cd8e083bc89.html#40) and [this blog post by Rstudio](https://blogs.rstudio.com/ai/posts/2019-06-05-uncertainty-estimates-tfprobability/) to get a good overview on BNNs in R

#### Linklist:

* [intro tfproba in R](https://blogs.rstudio.com/ai/posts/2019-01-08-getting-started-with-tf-probability/)
* [rstudio intro tf proba keras](https://rstudio.github.io/tfprobability/)
* [intro bayes nns via tfproba](https://towardsdatascience.com/introduction-to-tensorflow-probability-6d5871586c0e)
* [Common virtual environment via 'renv'](https://alexweston013.medium.com/how-to-set-up-an-r-python-virtual-environment-using-renv-483f67d76206) (not necessary)
* [TF Probability VI Intro Rstudio](https://blogs.rstudio.com/ai/posts/2019-06-05-uncertainty-estimates-tfprobability/)
* [Slides on it](https://rstudio-pubs-static.s3.amazonaws.com/547114_25698a3b3e5440158fa78cd8e083bc89.html#40)

#### Howto use (wip emilio, jann only)

* get on remote via `ssh ubuntu@138.246.236.24` then cd into `Bayesian-pls`
* `conda activate bnn_env` for python usage, check the `test_tf.py` for dummy bayesian mlp 
* dummy script is `test_tf.R` with commented installation of tfproba 
    * simply run from local `R` distribution
    * (tldr: installation from within r package `tensorflow` works)
    * still some fuckup with cudnn => runs only on cpu but should do for small data and models
    * test script contains dummy code (tested by jann) for vae training via tfproba from https://rstudio.github.io/tfprobability/


### Setup

First and foremost, please install all dependencies by sourcing [this file](_setup_session.R).

Then download the implementations of BPLS with PPP and concurring PLS methods and save in a folder named "R":

* [Supervised Baseline](R/standard_supervised.R)
* [Probability Score](R/standard_self_training_conf.R)
* [Predictive Variance](R/standard_self_training.R)
* [PPP (Bayes-optimal)](R/diff_marg_likelihood_pred_ext.R)
* [PPP (Bayes-optimal) Bayesian Neural Net](R/diff_marg_likelihood_pred_ext_bnn.R)
* [Likelihood (max-max)](R/diff_marg_likelihood_pred.R)
* [Utilities for PPP](R/utils_diff_marg_likelihood.R)


In order to reproduce the papers' key results (and visualizations thereof) further download these scripts and save in respective folder:

* in folder analysis/
    * [analysis and visualization](analyze/analyze.R) 
* in folder benchmarks/
    * [global setup of experiments](benchmarks/run_benchmarks_simulated_data_p=60.R)
* in folder benchmarks/experiments/
    * [experiments with likelihood (max-max)](benchmarks/experiments/benchmark-dml-pred.R)
    * [experiments with PPP (bayes-opt)](benchmarks/experiments/benchmark-dml-pred-ext.R)
    * [experiments with supervised baseline](benchmarks/experiments/_benchmark-standard-supervised.R)
    * [experiments with predictive variance](benchmarks/experiments/_benchmark-standard-self-training.R)
    * [experiments with probability score](benchmarks/experiments/_benchmark-standard-self-training_conf.R)


Eventually, download [benchmarks/experiments_simulated_data.R](benchmarks/experiments_simulated_data.R) and run from benchmarks/ (estimated runtime: 30 CPU hours)

Important: Create empty folders [results](results) and [plots](plots) where experimental results will be stored automatically. In addition, you can access them as object after completion of the experiments.


### Further experiments

Additional experimental setups can now easily be created by modifying [benchmarks/experiments_simulated_data.R](benchmarks/experiments_simulated_data.R)


### Data

Find data and files to read in data in folder [data](data). 



