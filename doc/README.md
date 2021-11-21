# Intro to Accelerated Failure Time (AFT) Models

## General notes on time-to-event data 
* Time-to-event (T) requires time of origin (T0) to be defined. 
* T takes on positive values
* T is typically skewed to the right
* T can be censored (left, right, interval)
* T can be truncated (left, right)
* Different type of events: 
    - events of interest (ESKD), 
    - interfering/intercurrent events (death, loss to follow-up)

## Time-to-event data in **our study**. 

* T0 is defined as time of the first visit for a given cohort (it does not have clinical interpretation)
* Time-to-event is defined as time (T) to ESKD event
* T can be right censored due to loss to follow-up, withdrawing from the study
* Death: Consider to include as part of the composite event definition? Less recommended to treat time of death as censored value
* Death can be treated as competing event

## Notes on Cox regression 

* Proportional hazard (PH) assumption:  
  <img src="https://render.githubusercontent.com/render/math?math=\log h(t \vert \mathbf{\beta},\mathbf{x})= \log h_0(t) %2B\mathbf{x}'\mathbf{\beta}">
* Semi-parametric (because no assumptions on distribution of T) 
* Interpretation: Effect of a covariate expressed in terms of hazard ratios (across entire time spectrum) 
* Extensions with time varying covariates
* Interactions with time variable
* Very popular in developing risk prediction models

## AFT model:

<img src="https://render.githubusercontent.com/render/math?math=log(T_i) = \beta_0 %2B\beta_1 x_{i1} %2B\ldots %2B\beta_p x_{ip} %2B\sigma\epsilon_i">

* <img src="https://render.githubusercontent.com/render/math?math=\sigma"> is scale parameter. 
* <img src="https://render.githubusercontent.com/render/math?math=\epsilon_i"> is random disturbance
* Note: The scale parameter is the reciprocal of the shape parameter.

| <img src="https://render.githubusercontent.com/render/math?math=\epsilon_i"> distribution | T distribution | Lifereg syntax         | Notes
| --- | --- | ---- | ----
| extreme value(2 params)| Weibull        | dist = Weibull     | Meets PH assumptiond
| extreme value(1 param)| exponential     | dist = exponential | sigma =1, Special case of Weibull
| log-gamma           | gamma           | dist = gamma       | ?
| logistic            | log-logistic    | dist = llogistic   | commonly used
| normal              | log-normal      | dist = lnormal     | ?

Interpretation of the regression coefficients in AFT model:

If we increase the covariate value of <img src="https://render.githubusercontent.com/render/math?math=x_k"> by one
unit while holding other covariate values unchanged, the corresponding expected survival time (median survival
time) will increase by
a factor of <img src="https://render.githubusercontent.com/render/math?math=\exp{(\beta_k)}">.

Notes:

* In the Weibull Mode:
   - If the scale parameter is less than 1, the hazard increases over time.
   - If the scale parameter equals 1, the hazard stays constant over time (exponential model).
   - If the scale parameter greater than 1, the hazard decreases over time.
Pre
REFERENCES

[Applied Survival Analysis: Parametric Survival Analysis using R](https://rstudio-pubs-static.s3.amazonaws.com/5564_bc9e2d9a458c4660aa82882df90b7a6b.html)
{Parametric Regression Model](http://www.ams.sunysb.edu/~zhu/ams588/Lecture_5_AFT.pdf)